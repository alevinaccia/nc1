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
    Series(exe: Exercise(name: "Reverse Crounch", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 1, y: 15), Vector2(x: 1, y: 15), Vector2(x: 1, y: 15), Vector2(x: 1, y: 15)])
]

let push = Workout(name: "Push", duration: 75, schema: pushSchema, last : Date(), difficulty: .Intermediate())

let pullSchema : [Series] = [
    Series(exe : Exercise(name: "Wide pull ups", image: "", improvement: 0), rec: 60, loadRep: [Vector2(x: 35, y: 12), Vector2(x: 40, y: 10), Vector2(x: 40, y: 10), Vector2(x: 40, y: 7)]),
    Series(exe: Exercise(name: "Row with triangle", image: "", improvement: 0), rec: 60, loadRep : [Vector2(x: 25, y: 10), Vector2(x: 30, y: 10), Vector2(x: 35, y: 10), Vector2(x: 35, y: 10)]),
    Series(exe: Exercise(name: "Single arm row", image: "", improvement: 0), rec: 30, loadRep : [ Vector2(x: 15, y: 10), Vector2(x: 15, y: 10), Vector2(x: 15, y: 10), Vector2(x: 15, y: 10)]),
    Series(exe: Exercise(name: "Arm curl", image: "", improvement: 0), rec: 45, loadRep: [ Vector2(x: 20, y: 10), Vector2(x: 20, y: 10), Vector2(x: 20, y: 10), Vector2(x: 20, y: 10)]),
    Series(exe: Exercise(name: "Deadlift", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 60, y: 10), Vector2(x: 70, y: 10), Vector2(x: 90, y: 5), Vector2(x: 100, y: 2)]),
    Series(exe: Exercise(name: "Leg curl", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 35, y: 10), Vector2(x: 35, y: 10), Vector2(x: 35, y: 10)]),
    Series(exe: Exercise(name: "Reverse Crounch", image: "", improvement: 0), rec: 30, loadRep: [Vector2(x: 1, y: 15), Vector2(x: 1, y: 15), Vector2(x: 1, y: 15), Vector2(x: 1, y: 15)])
]

let pull = Workout(name: "Pull", duration: 70, schema: pullSchema, last : Date(), difficulty: .Intermediate())


class UserViewModel : ObservableObject {
    
    @Published var workouts : [Workout] = []
    @Published var history : [HistoryElement] = []

    init() {
        self.readData()
    }

    func calculateWoIncrement(workoutA : Workout) -> Int {
        var schemaA : [Series] = workoutA.schema
        let schemaB : [Series] = workouts.first(where: {$0.name == workoutA.name})!.schema
        var total = 0
        for i in schemaA.indices {
            var sum = 0
            let serieA : Series = schemaA[i]
            let serieB : Series = schemaB[i]
            
            for j in serieA.loadRep.indices {
                let diff = serieA.loadRep[j].volume - serieB.loadRep[j].volume
                let singleIncrement = (diff * 100)/serieB.loadRep[j].volume
                schemaA[i].loadRep[j].done = false
                sum += singleIncrement
            }
            schemaA[i].completed = false
            schemaA[i].exe.improvement = sum/schemaA[i].loadRep.count
            total += sum/schemaA[i].loadRep.count
        }
        let index = workouts.firstIndex(where: {$0.name == workoutA.name})!
        self.workouts[index].setSchema(newSchema: schemaA)
        self.workouts[index].updateLast()
        return total/schemaA.count
    }
    
    func addToHistory(workout : Workout) -> Void{
        history.append(HistoryElement(value: self.calculateWoIncrement(workoutA: workout), woName: workout.name))
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("history.json")
            
            try JSONEncoder()
                .encode(self.history)
                .write(to: fileURL)
            
            self.writeData(workouts: workouts)
            self.readData()
        } catch {
            print("error writing data")
        }
        
    }
 
    func writeData(workouts : [Workout]) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("data.json")
            
            try JSONEncoder()
                .encode(workouts)
                .write(to: fileURL)
        } catch {
            print("error writing data")
        }
    }
    
   
    func readData() {
        do {
            let dataURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("data.json")
            let historyURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("history.json")

            let data = try Data(contentsOf: dataURL)
            let history = try Data(contentsOf: historyURL)
            let pastData = try JSONDecoder().decode([Workout].self, from: data)
            let pastHistory = try JSONDecoder().decode([HistoryElement].self, from: history)
        
            self.workouts = pastData
            self.history = pastHistory
            
            print("I've been called!")
        } catch {
            print("error reading data")
        }
    }
    
}
