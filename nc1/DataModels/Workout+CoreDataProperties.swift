//
//  Workout+CoreDataProperties.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 22/11/22.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var name: String?
    @NSManaged public var duration: Int16
    @NSManaged public var last: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var workoutToSchema: NSSet?

}

// MARK: Generated accessors for workoutToSchema
extension Workout {

    @objc(addWorkoutToSchemaObject:)
    @NSManaged public func addToWorkoutToSchema(_ value: Series)

    @objc(removeWorkoutToSchemaObject:)
    @NSManaged public func removeFromWorkoutToSchema(_ value: Series)

    @objc(addWorkoutToSchema:)
    @NSManaged public func addToWorkoutToSchema(_ values: NSSet)

    @objc(removeWorkoutToSchema:)
    @NSManaged public func removeFromWorkoutToSchema(_ values: NSSet)

}

extension Workout : Identifiable {

}
