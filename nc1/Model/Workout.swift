//
//  Workout.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 16/11/22.
//

import Foundation

enum DiffLevel : String {
    case Beginner
    case Intermediate
    case Advanced
}

struct Exercise {
    var name : String
    var image : String
    var improvement : Int
}

struct Series : Identifiable {
    var exe : Exercise
    var rec : Int
    var loadRep : [Vector2]
    var id : UUID = UUID()
    var completed : Bool = false
}

struct Workout : Identifiable {
    var name : String
    var duration : Int
    var schema : [Series]
    var last : Date
    var difficulty : DiffLevel
    var id : UUID = UUID()
}

struct Vector2 : Identifiable {
    var x : Int = 0
    var y : Int = 0
    var done : Bool = false
    var id : UUID = UUID()
}



