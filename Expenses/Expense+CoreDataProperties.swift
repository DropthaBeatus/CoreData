//
//  Expense+CoreDataProperties.swift
//  Expenses
//
//  Created by Liam Flaherty on 12/1/17.
//  Copyright © 2017 Liam Flaherty. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {
/**
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }
**/
    @NSManaged public var name: String?
    @NSManaged public var amount: Double
  //  @NSManaged public var rawDate: NSDate?

}
