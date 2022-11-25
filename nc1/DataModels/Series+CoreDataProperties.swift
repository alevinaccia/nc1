//
//  Series+CoreDataProperties.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 22/11/22.
//
//

import Foundation
import CoreData


extension Series {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Series> {
        return NSFetchRequest<Series>(entityName: "Series")
    }

    @NSManaged public var rec: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var completed: Bool
    @NSManaged public var seriesToExe: Exercise?
    @NSManaged public var seriesToLr: NSSet?
    @NSManaged public var seriesToWorkout: Workout?

}

// MARK: Generated accessors for seriesToLr
extension Series {

    @objc(addSeriesToLrObject:)
    @NSManaged public func addToSeriesToLr(_ value: Vector3)

    @objc(removeSeriesToLrObject:)
    @NSManaged public func removeFromSeriesToLr(_ value: Vector3)

    @objc(addSeriesToLr:)
    @NSManaged public func addToSeriesToLr(_ values: NSSet)

    @objc(removeSeriesToLr:)
    @NSManaged public func removeFromSeriesToLr(_ values: NSSet)

}

extension Series : Identifiable {

}
