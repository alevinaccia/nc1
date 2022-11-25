//
//  Exercise+CoreDataProperties.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 22/11/22.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var improvement: Int16
    @NSManaged public var exeToSeries: Series?

}

extension Exercise : Identifiable {

}
