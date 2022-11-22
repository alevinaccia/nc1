//
//  workoutCard.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 16/11/22.
//

import SwiftUI

struct workoutCard: View {
    
    var workout : Workout
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: 200,height: 75)
                .cornerRadius(10)
                .shadow(radius: 3)
            HStack{
                Text("\(workout.duration)'")
                VStack(alignment: .center){
                    Text(workout.name)
                    Text("\(workout.schema.count) Exercises - \(workout.last.formatted(.dateTime.day().month()))")
                        .font(.caption)
                }
            }
        }
    }
}

