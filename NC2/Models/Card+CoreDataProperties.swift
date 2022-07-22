//
//  Card+CoreDataProperties.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var cardTitle: String?
    @NSManaged public var cardType: String?
    @NSManaged public var cardCategory: String?
    @NSManaged public var cardText: String?
    @NSManaged public var cardIndex: Int32
    @NSManaged public var cardRelationship: Deck?

}

extension Card : Identifiable {

}
