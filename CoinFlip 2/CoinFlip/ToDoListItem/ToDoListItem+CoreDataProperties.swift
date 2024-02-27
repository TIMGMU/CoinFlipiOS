//
//  ToDoListItem+CoreDataProperties.swift
//  CoinFlip
//
//  Created by Tim Nguyen on 5/7/23.
//  Copyright © 2023 RADEFFFACTORY. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListItem : Identifiable {

}
