//
//  Entity+CoreDataProperties.swift
//  DentistApp
//
//  Created by user174125 on 8/14/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var phone: NSObject?

}
