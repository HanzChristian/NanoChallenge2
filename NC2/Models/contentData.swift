//
//  contentData.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager{
    let context =
    DeckView().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }

var items:[Deck]?

func dummyData(){
    
    // create medicine
    let deck = Deck(context: context)
    deck1.deckName = "Product"
//    let deck = Deck(context: context)
//    deck2.deckName = "Product"
    
    // Add time
    let card1 = Card(context: context)
    card1.cardCategory = "Introducing"
    card1.cardIndex = 1
    card1.cardTitle = "Product"
    card1.cardText = "blablabla"
    card1.cardType = "Introduction"
    
    //make new cards
    
    deck.addToDeckRelationship(card1)
    
    
    do{
        try self.context.save()
    }catch{
        
    }
}

}
