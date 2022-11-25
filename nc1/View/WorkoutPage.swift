//
//  WorkoutPage.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 16/11/22.
//

import SwiftUI

struct WorkoutPage: View {
    @State var workout : Workout
    
    var body: some View {
            VStack(alignment: .center, spacing: 30){
                HStack(spacing: 70){
                    VStack{
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black)
                        Text("\(workout.duration)'")
                    }
                    VStack{
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black)
                        Text("Intermediate")
                    }
                    VStack{
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black)
                        Text("\(workout.last.formatted(.dateTime.day().month()))")
                    }
                }
                VStack{
                    HStack{
                        Text("List of exercises").font(.system(size: 17)).fontWeight(.semibold).padding()
                        Spacer()
                    }
                    ScrollView{
                        ForEach(workout.schema) { series in
                            SeriesRow(series : series).frame(height: 50)
                            Divider()
                        }
                    }
                }
                
                NavigationLink {
                    ActiveWorkout(workout : $workout)
                } label: {
                    ZStack{
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 300, height: 40)
                            .cornerRadius(10)
                        Text("Start").zIndex(1).foregroundColor(.black)
                    }
                }
            }
            .navigationTitle(workout.name)
    }
}


