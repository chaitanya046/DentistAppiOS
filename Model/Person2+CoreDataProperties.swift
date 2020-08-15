//
//  Person2+CoreDataProperties.swift
//  DentistApp
//
//  Created by user174125 on 8/15/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//
//

import Foundation
import CoreData


extension Person2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person2> {
        return NSFetchRequest<Person2>(entityName: "Person2")
    }

    @NSManaged public var age: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}
