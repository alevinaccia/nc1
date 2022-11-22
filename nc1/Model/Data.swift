//
//  Data.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 21/11/22.
//

import Foundation

let pushSchema : [Series] = [
    Series(exe : Exercise(name: "Back extensions", image: "", improvement: 0), rec: 10, loadRep: [Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10)]),
    Series(exe: Exercise(name: "Barbell press", image: "", improvement: 0), rec: 60, loadRep : [Vector2(x: 20, y: 10), Vector2(x: 30, y: 10), Vector2(x: 35, y: 10), Vector2(x: 35, y: 10)]),
    Series(exe: Exercise(name: "Chest press", image: "", improvement: 0), rec: 60, loadRep : [ Vector2(x: 50, y: 8), Vector2(x: 45, y: 10), Vector2(x: 40, y: 12), Vector2(x: 35, y: 15)]),
    Series(exe: Exercise(name: "Military Press", image: "", improvement: 0), rec: 45, loadRep: [ Vector2(x: 20, y: 8), Vector2(x: 20, y: 8), Vector2(x: 20, y: 8), Vector2(x: 20, y: 8)]),
    Series(exe: Exercise(name: "Alzate Laterali", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10), Vector2(x: 5, y: 10)]),
    Series(exe: Exercise(name: "Leg Extensions", image: "", improvement: 0), rec: 60, loadRep: [Vector2(x: 40, y: 20), Vector2(x: 40, y: 20), Vector2(x: 40, y: 20), Vector2(x: 40, y: 20)]),
    Series(exe: Exercise(name: "Reverse Crounch", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 0, y: 15), Vector2(x: 0, y: 15), Vector2(x: 0, y: 15), Vector2(x: 0, y: 15)])
]

let push = Workout(name: "Push", duration: 75, schema: pushSchema, last : Date(), difficulty: .Intermediate)

let pullSchema : [Series] = [
    Series(exe : Exercise(name: "Wide pull ups", image: "", improvement: 0), rec: 60, loadRep: [Vector2(x: 35, y: 12), Vector2(x: 40, y: 10), Vector2(x: 40, y: 10), Vector2(x: 40, y: 7)]),
    Series(exe: Exercise(name: "Row with triangle", image: "", improvement: 0), rec: 60, loadRep : [Vector2(x: 25, y: 10), Vector2(x: 30, y: 10), Vector2(x: 35, y: 10), Vector2(x: 35, y: 10)]),
    Series(exe: Exercise(name: "Single arm row", image: "", improvement: 0), rec: 30, loadRep : [ Vector2(x: 15, y: 10), Vector2(x: 15, y: 10), Vector2(x: 15, y: 10), Vector2(x: 15, y: 10)]),
    Series(exe: Exercise(name: "Arm curl", image: "", improvement: 0), rec: 45, loadRep: [ Vector2(x: 20, y: 10), Vector2(x: 20, y: 10), Vector2(x: 20, y: 10), Vector2(x: 20, y: 10)]),
    Series(exe: Exercise(name: "Deadlift", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 60, y: 10), Vector2(x: 70, y: 10), Vector2(x: 90, y: 5), Vector2(x: 100, y: 2)]),
    Series(exe: Exercise(name: "Leg curl", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 35, y: 10), Vector2(x: 35, y: 10), Vector2(x: 35, y: 10)]),
    Series(exe: Exercise(name: "Reverse Crounch", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 0, y: 15), Vector2(x: 0, y: 15), Vector2(x: 0, y: 15), Vector2(x: 0, y: 15)])
]

let pull = Workout(name: "Pull", duration: 70, schema: pullSchema, last : Date(), difficulty: .Intermediate)

class UserViewModel : ObservableObject {
    
    @Published var workouts : [Workout] = [push, pull]

}
