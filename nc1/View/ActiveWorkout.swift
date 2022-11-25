//
//  ActiveWorkout.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 19/11/22.
//

import SwiftUI

struct ActiveWorkout: View {
    
    var userVM : UserViewModel = UserViewModel()
    @State var selection = 0
    @State var status = 0
    
    @Binding var workout : Workout

 
    var body: some View {
        if status != workout.schema.count{
            ScrollView(.init()){
                TabView(selection: $selection){
                    ForEach($workout.schema.indices) { index in
                        exercisePage(exercise: $workout.schema[index], sel : $selection, status : $status).tag(index)
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
            }.ignoresSafeArea()
        } else {
            Text("Workout Completed").navigationTitle("Testing").onAppear {
                userVM.addToHistory(workout: workout)
                self.workout = userVM.workouts.first(where: {$0.id == self.workout.id})!
            }
        }
    }
}

//
//struct ActiveWorkout_Previews: PreviewProvider {
//    static var previews: some View {
//        ActiveWorkout(workout : Workout(name: "", duration: 5, schema: [], last: Date(), difficulty: .Advanced()))
//    }
//}



