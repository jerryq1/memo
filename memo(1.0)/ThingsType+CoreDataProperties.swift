//
//  ThingsType+CoreDataProperties.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/30.
//  Copyright © 2016年 jerry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ThingsType {

    @NSManaged var detailThing: String?
    @NSManaged var isDone: NSNumber!
    @NSManaged var isImport: NSNumber!
    @NSManaged var thing: String!

}
