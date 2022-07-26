//
//  CardView.swift
//  NC2
//
//  Created by Hanz Christian on 26/07/22.
//

import SwiftUI

struct CardView:View{
    
    @Environment(\.presentationMode) var presentation
    
    //Card Contents
    @State var arrayOfContent:[String] = ["Product","Decision Making","Motivational","Persuasuve","Progress","Instructive"]
    
    @State var productContents = [
        Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone, I think we might still be missing a few people but I’m going to kick things off now so we have time to get through everything.",offset: 0,place: 1),

        Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),
        
        Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),
        
        Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),
        
        Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),
    
        Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
    ]

    @State var decisionContents = [
        Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone, I think we might still be missing a few people but I’m going to kick things off now so we have time to get through everything.",offset: 0,place: 1),

        Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),

        Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),

        Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),

        Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),

        Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
    ]

    @State var motivationalContents = [
        Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "Hi everyone, I think we might still be missing a few people but I’m going to kick things off now so we have time to get through everything.",offset: 0,place: 1),

        Content(id: 1, type: "Topic of Presentation", category: "Saying your topic", words: "For the next ... minutes, I am going to be speaking to you about ...",offset: 0,place: 2),

        Content(id: 2, type: "Question policy", category: "Mind to be interrupted or not?", words: "If you have questions about anything, please kindly wait until the end of the presentation. We’ll have ... minutes for an open discussion at the end. ",offset: 0,place: 3),

        Content(id: 3, type: "Main presentation", category: "Beginning the main presentation", words: "Let’s start at the very beginning. Many people ask…",offset: 0,place: 4),

        Content(id: 4, type: "New Section", category: "Switching topic", words: "There’s a lot more to learn about that but since we’re pushed for time, let’s move on to ...",offset: 0,place: 5),

        Content(id: 5, type: "Ending", category: "Conclusion", words: "Well, that concludes my presentation today. To refresh your memory, the main takeaways are the following. Number one…",offset: 0,place: 6),
    ]


    //Determines how many card are swiped
    @State var swiped = 0
    
    //to loop the cards
    func restoreCard(id: Int){
        if(index == 0){
            var currentCard = productContents[id]
             
             currentCard.id = productContents.count
             productContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 productContents[productContents.count - 1].offset = 0
             }
        }
        
        if(index == 1){
            var currentCard = decisionContents[id]
             
             currentCard.id = decisionContents.count
             decisionContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 decisionContents[decisionContents.count - 1].offset = 0
             }
        }
        
        if(index == 2){
            var currentCard = motivationalContents[id]
             
             currentCard.id = motivationalContents.count
            motivationalContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 motivationalContents[motivationalContents.count - 1].offset = 0
             }
        }
    }
    
    //swipe rotate animation
    func getRotation(offset: CGFloat)->Double{
        let value = offset/150
        let angle:CGFloat = 10
        
        let degree = Double(value * angle)
        
        return degree
    }
    
    var index:Int = 0
    
    var body: some View{
        //logic berdasarkan index
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(Color(hex: "5C929D"))
                Spacer()
                
                GeometryReader{reader in
                    VStack{
                        ZStack{
                            if(index == 0){
                                ForEach(productContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    productContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    productContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    productContents[Content.id].offset = 0
                                                }
                                            }
                                        }))
                                }
                            }
                            
                            if(index == 1){
                                ForEach(decisionContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    decisionContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    decisionContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    decisionContents[Content.id].offset = 0
                                                }
                                            }
                                        }))
                                }
                            }
                            
                            if(index == 2){
                                ForEach(motivationalContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    motivationalContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    motivationalContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    motivationalContents[Content.id].offset = 0
                                                }
                                            }
                                        }))
                                }
                            }
                        } //zstack
                            .offset(y: -50)
                    
                        if(index == 0 || index == 1 || index == 2){
                            VStack(){
                                Text("Try spelling these words!")
                                    .padding(.trailing,110)
                                    .font(.system(size: 20).weight(.bold))
                                    .foregroundColor(Color(hex: "476F78"))
                                    
                                Spacer(minLength: 5)
                                
                                NavigationLink(destination: SpellingView(index: index)){
                                    Button(action: {
                                    }) {
                                        Text("Spelling Practice").font(.system(size: 24).weight(.bold))
                                            .foregroundColor(Color(hex: "476F78"))
                                    }
                                        .frame(width: 350, height: 50)
                                        .background(Color(hex: "DAE5D0"))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
                                }
                                
                            }
                            .padding(.bottom,50)
                        }
                        if(index == 3 || index == 4 || index == 5){
                            Text("Coming Soon!").font(.system(size: 40).weight(.bold))
                                .foregroundColor(Color(hex: "476F78"))
                                .frame(maxHeight: .infinity, alignment: .center)
                                .padding(.leading,65)
                        }
                        
                    }
                }
            }
            
            .navigationBarTitle(Text("\(arrayOfContent[index])")).navigationBarHidden(false)
            .background(Color(hex: "FEFBE7"))
            .accentColor(.white)
            //Changes to back button color
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigation)  {
                    Text("Back")
                        .foregroundColor(.white)
                        .onTapGesture {
                            // code to dismiss the view
                            self.presentation.wrappedValue.dismiss()
                        }
                }
            })
    }
}
struct ContentView: View{
    
    var Content: Content
    var reader: GeometryProxy
    @Binding var swiped: Int
    
    var body: some View{
        VStack{
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("\(Content.type)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "476F78"))
                            .padding(.leading,20)
                        
                        
                        Text("Category :")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "476F78"))
                            .padding(.leading,20)
                        
                        Text("\(Content.category)")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "476F78"))
                            .padding(.leading,20)
                            .padding(.bottom,25)
                        
                        Text("\(Content.words)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "476F78"))
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.bottom,20)
                        
                        HStack{
                            Text("#")
                                .font(.system(size: 48))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "476F78"))
                            
                            Text("\(Content.place)")
                                .font(.system(size: 48))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "476F78"))
                        }
                        .padding(.leading,250)
                        .padding(.top,50)
                        Spacer(minLength: 0)
                    }
                }
                .padding(.bottom,20)
                .padding(.top,25)
            }
            .frame(height: reader.frame(in: .global).height - 160)
            .background(Color(hex: "F9EBC8"))
            .cornerRadius(20)
            .padding(.vertical,10)
            .padding(.horizontal,25)
            .padding(.top,50)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            //Get next content with 1:2 comparison & 2 cards displayed
            .offset(y: Content.id - swiped <= 2 ? CGFloat(Content.id - swiped) * 25 : 50)
            
            Spacer(minLength: 0)
        }
//        Content for drag/swipe gesture
        .contentShape(Rectangle())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
