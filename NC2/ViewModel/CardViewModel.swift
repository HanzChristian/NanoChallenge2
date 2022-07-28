//
//  CardViewModel.swift
//  NC2
//
//  Created by Hanz Christian on 27/07/22.
//

import SwiftUI

class CardViewModel: ObservableObject{
    
    @Published var arrayOfContent:[String] = []
    @Published var productContents: [Content] = []
    @Published var decisionContents: [Content] = []
    @Published var motivationalContents: [Content] = []
    
    
    init(){
        arrayOfContent = ["Product","Decision Making","Motivational","Persuasive","Progress","Instructive"]
        
        productContents = [
            Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone",offset: 0,place: 1),
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
        ]
        
        decisionContents = [
            Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone, I think we might still be missing a few people but I’m going to kick things off now so we have time to get through everything.",offset: 0,place: 1),
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
        ]
        
        motivationalContents = [
            Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone, I think we might still be missing a few people but I’m going to kick things off now so we have time to get through everything.",offset: 0,place: 1),
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
        ]
    }
}
