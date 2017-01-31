//
//  Restaurant+CoreDataProperties.swift
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

extension Restaurant {

    @NSManaged var name: String!
    @NSManaged var rating: String?
    @NSManaged var isImportant: NSNumber?
    @NSManaged var memo: String?
    @NSManaged var type: String!
    @NSManaged var location: String!
    @NSManaged var photo: NSData?
}
