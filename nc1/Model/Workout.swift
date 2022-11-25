//
//  Workout.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 16/11/22.
//

import Foundation

enum DiffLevel : Codable {
    case Beginner(String = "Beginner")
    case Intermediate(String = "Intermediate")
    case Advanced(String = "Advanced")
}

struct Exercise : Codable {
    var name : String
    var image : String
    var improvement : Int
}

struct Series : Identifiable & Codable {
    var exe : Exercise
    var rec : Int
    var loadRep : [Vector2]
    var id : UUID = UUID()
    var completed : Bool = false
}

struct Workout : Identifiable & Codable {
    var name : String
    var duration : Int
    var schema : [Series]
    var last : Date
    var difficulty : DiffLevel
    var id : UUID = UUID()
    
    mutating func setSchema(newSchema : [Series]){
        self.schema = newSchema
    }
    
    mutating func updateLast(){
        self.last = Date()
    }
}

struct HistoryElement : Identifiable & Codable { //stupid name -> Change it dude :D
    var value : Int
    var woName : String
    var timeStamp : String  = Date().formatted(.dateTime.day().month()) // toformat
    var id : UUID = UUID()
}

struct Vector2 : Identifiable & Codable { //more like a vector3 -> consider a name change
    var x : Int = 0
    var y : Int = 0
    var volume : Int = 0
    var done : Bool = false
    var id : UUID = UUID()
    
    init(x : Int, y : Int){
        self.x = x
        self.y = y
        self.volume = self.x * self.y
    }
    
    mutating func setVolume() {
        self.volume = self.x * self.y
    }
}



