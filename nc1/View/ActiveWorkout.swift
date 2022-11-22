//
//  ActiveWorkout.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 19/11/22.
//

import SwiftUI

struct ActiveWorkout: View {
    
    @State var selection = 0
    
    var workout : Workout
    
    init(workout : Workout) {
        self.workout = workout
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }

    var body: some View {
        ScrollView(.init()){
            TabView(selection: $selection){
                ForEach(workout.schema.indices) { index in
                //exercisePage(exercise: workout.schema[index], sel : $selection).tag(index)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
        }.ignoresSafeArea()
    }
}


struct ActiveWorkout_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkout(workout : Workout(name: "", duration: 5, schema: [], last: Date(), difficulty: .Advanced))
    }
}



