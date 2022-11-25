//
//  exercisePage.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 19/11/22.
//

import SwiftUI
import UserNotifications

struct exercisePage: View {
    
    @Binding var exercise : Series
    @State var timerGoing : Bool = false
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count : Int = 0
    @State var to : CGFloat = 0
    
    @State var flag : Bool = false
    
    @Binding var sel : Int
    @Binding var status : Int
    
    var body: some View {
        VStack(spacing: 20){
            HStack(spacing: 30){
                Text("Load")
                Text("Reps")
                Text("Rec")
            }
            ForEach($exercise.loadRep) { $lr in
                EditableRow(lr: $lr, rec: $exercise.rec, timerGoing: $timerGoing, completedExe: $exercise.completed, count: $count)
                    .onChange(of: lr.done){ newValue in
                        if exercise.loadRep.firstIndex(where: { $0.done == false}) ?? -1 == -1 {
                            exercise.completed = true
                            withAnimation(.default){
                                status += 1
                                sel += 1
                            }
                        }
                    }
            }.padding(.leading)
            Spacer().frame(height: 20)
            ZStack{
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 250, height: 250)
                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: -90))
                Text("\(exercise.rec)").font(.system(size: 36))
            }
        }.onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (succ, error) in
                
            }
        })
        .navigationTitle(exercise.exe.name)
        .onReceive(self.time){ _ in
            if timerGoing{
                if self.count != exercise.rec {
                    self.count += 1
                    print("counting")
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / CGFloat(exercise.rec)
                    }
                }else {
                    self.timerGoing = false
                    self.Notify()
                }
            }
        }
    }
    
    func Notify(){
        let content = UNMutableNotificationContent()
        content.title = "Rec time is up!"
        content.body = "Time to get back to work"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    
}
//
//struct exercisePage_Previews: PreviewProvider {
//    static var previews: some View {
//        exercisePage(exercise: Series(exe: Exercise(name: "Alzate Laterali", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10)]))
//    }
//}

