//
//  CardView.swift
//  NC2
//
//  Created by Hanz Christian on 26/07/22.
//

import SwiftUI

struct CardView:View{
    
    @Environment(\.presentationMode) var presentation
    
    @StateObject var content: CardViewModel = CardViewModel()


    //Determines how many card are swiped
    @State var swiped = 0
    
    //to loop the cards
    func restoreCard(id: Int){
        if(index == 0){
            var currentCard = content.productContents[id]
             
            currentCard.id = content.productContents.count
            //to append more view
            content.productContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 content.productContents[ content.productContents.count - 1].offset = 0
             }
        }
        
        if(index == 1){
            var currentCard =  content.decisionContents[id]
             
            currentCard.id =  content.decisionContents.count
            content.decisionContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 content.decisionContents[ content.decisionContents.count - 1].offset = 0
             }
        }
        
        if(index == 2){
            var currentCard =  content.motivationalContents[id]
             
            currentCard.id =  content.motivationalContents.count
            content.motivationalContents.append(currentCard)
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                 content.motivationalContents[ content.motivationalContents.count - 1].offset = 0
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
                                ForEach( content.productContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    content.productContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    content.productContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    content.productContents[Content.id].offset = 0
                                                }
                                            }
                                        }))
                                }
                            }
                            
                            if(index == 1){
                                ForEach( content.decisionContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    content.decisionContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    content.decisionContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    content.decisionContents[Content.id].offset = 0
                                                }
                                            }
                                        }))
                                }
                            }
                            
                            if(index == 2){
                                ForEach( content.motivationalContents.reversed()){Content in
                                    ContentView(Content: Content, reader: reader,swiped: $swiped)
                                    //for swipe gesture
                                        .offset(x: Content.offset)
                                        .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                    
                                        .gesture(DragGesture().onChanged({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 0){
                                                    content.motivationalContents[Content.id].offset = value.translation.width
                                                }
                                            }
                                        }).onEnded({ (value) in
                                            
                                            withAnimation{
                                                if (value.translation.width > 150){
                                                    content.motivationalContents[Content.id].offset = 1000
                                                    swiped = Content.id + 1
                                                    restoreCard(id: Content.id)
                                                }
                                                else{
                                                    content.motivationalContents[Content.id].offset = 0
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
                                        Text("Spelling Practice").font(.system(size: 24).weight(.bold))
                                            .foregroundColor(Color(hex: "476F78"))
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
            
            .navigationBarTitle(Text("\(content.arrayOfContent[index])")).navigationBarHidden(false)
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
