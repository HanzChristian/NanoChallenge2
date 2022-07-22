//
//  Deck+CoreDataProperties.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//
//

import Foundation
import CoreData


extension Deck {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var deckName: String?
    @NSManaged public var deckRelationship: NSSet?

}

// MARK: Generated accessors for deckRelationship
extension Deck {

    @objc(addDeckRelationshipObject:)
    @NSManaged public func addToDeckRelationship(_ value: Card)

    @objc(removeDeckRelationshipObject:)
    @NSManaged public func removeFromDeckRelationship(_ value: Card)

    @objc(addDeckRelationship:)
    @NSManaged public func addToDeckRelationship(_ values: NSSet)

    @objc(removeDeckRelationship:)
    @NSManaged public func removeFromDeckRelationship(_ values: NSSet)

}

extension Deck : Identifiable {

}
