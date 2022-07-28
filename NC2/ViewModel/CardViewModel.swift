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
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next minutes i am going to be speaking to you about",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything please kindly wait until the end of the presentation we will have two minutes for an open discussion at the end",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let's start at the very beginning many people ask",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time let’s move on to",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well that concludes my presentation today to refresh your memory the main takeaways are the following number one",offset: 0,place: 6),
        ]
        
        decisionContents = [
            Content(id: 0, type: "Brainstorming", category: "Choosing the right decision", words: "Let's look at these statements what do you guys think about it",offset: 0,place: 1),
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next minutes i am going to be speaking to you about",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything please kindly wait until the end of the presentation we will have two minutes for an open discussion at the end",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let's start at the very beginning many people ask",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time let’s move on to",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well that concludes my presentation today to refresh your memory the main takeaways are the following number one",offset: 0,place: 6),
        ]
        
        motivationalContents = [
            Content(id: 0, type: "Going to Speech", category: "Connecting to other topics", words: "There is a lot more to learn about that but since we are pushed for time let's move on to",offset: 0,place: 1),
            
            Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next minutes i am going to be speaking to you about",offset: 0,place: 2),
            
            Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything please kindly wait until the end of the presentation we will have two minutes for an open discussion at the end",offset: 0,place: 3),
            
            Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let's start at the very beginning many people ask",offset: 0,place: 4),
            
            Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time let’s move on to",offset: 0,place: 5),
            
            Content(id: 5, type: "Ending", category: "Conclusion", words: "Well that concludes my presentation today to refresh your memory the main takeaways are the following number one",offset: 0,place: 6),
        ]
    }
}
