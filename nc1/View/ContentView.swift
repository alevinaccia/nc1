//
//  ContentView.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 16/11/22.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @ObservedObject var userVM : UserViewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                ZStack {
                    Image("classCard").resizable()
                        .frame(width: 365, height: 237)
                        .cornerRadius(10)
                        .opacity(0.8)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Class timetable")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                            Text("Find classes that interest you and receive reminders")
                                .foregroundColor(.white)
                        }.frame(width: 350)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                .padding(.top, 50)
                .frame(width: 375, height: 200)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(userVM.workouts){ workout in
                            NavigationLink {
                                WorkoutPage(workout : workout)
                            } label: {
                                workoutCard(workout: workout)
                            }.foregroundColor(.black)
                        }
                    }
                    .padding(.vertical, 40)
                    .padding()
                }.frame(width: 400)
                VStack(alignment:.leading){
                    Text("Progress").font(.title2)
                    Chart(userVM.history){ item in
                        LineMark(
                            x: .value("day" ,item.timeStamp),
                            y: .value("increment" ,item.value)
                        ).foregroundStyle(by: .value("woName", item.woName))
                    }
                }.padding()
                    .onAppear {
                        self.userVM.readData()
                    }
                Spacer()
            }.navigationTitle("Mywellness")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
