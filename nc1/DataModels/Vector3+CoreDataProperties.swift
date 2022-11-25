//
//  Vector3+CoreDataProperties.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 22/11/22.
//
//

import Foundation
import CoreData


extension Vector3 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vector3> {
        return NSFetchRequest<Vector3>(entityName: "Vector3")
    }

    @NSManaged public var x: Int16
    @NSManaged public var y: Int16
    @NSManaged public var volume: Int16
    @NSManaged public var done: Bool
    @NSManaged public var lrToSeries: Series?

}

extension Vector3 : Identifiable {

}
