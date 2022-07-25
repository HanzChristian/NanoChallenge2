//
//  ContentView.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//

import SwiftUI

// 1st View
struct DeckView: View {
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    init() {
        //Change Navigation title to white color
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(Color(hex: "5C929D"))
                Spacer()
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0..<6){ i in
                            HStack{
                                NavigationLink(destination: CardView(index:i)){
                                        Image("img\(i + 1)")
                                            .resizable().frame(width: 150, height: 201)
                                }
                                
                            }
                        }
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.automatic)
            }
            .navigationBarTitle(Text("List of Decks")).navigationBarHidden(false)
            .background(Color(hex: "FEFBE7"))
        }
    }
    
}

struct CardView:View{
    
    @Environment(\.presentationMode) var presentation
    
    var arrayOfContent:[String] = ["Product","Decision Making","Motivational","Persuasuve","Progress","Instructive"]
    
    //Determines how many card are swiped
    @State var swiped = 0
    @State var all_contents = [
        Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 1),

        Content(id: 1, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 2),
        
        Content(id: 2, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 3),
        
        Content(id: 3, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 4),
        
        Content(id: 4, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 5),
    
        Content(id: 5, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 6),

        Content(id: 6, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...",offset: 0,place: 7),
    ]
    
    
    
    //to loop the cards
    func restoreCard(id: Int){
       var currentCard = all_contents[id]
        
        currentCard.id = all_contents.count
        all_contents.append(currentCard)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                all_contents[all_contents.count - 1].offset = 0
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
                    ZStack{
                        if(index == 0){
                            ForEach(all_contents.reversed()){Content in
                                ContentView(Content: Content, reader: reader,swiped: $swiped)
                                //for swipe gesture
                                    .offset(x: Content.offset)
                                    .rotationEffect(.init(degrees: getRotation(offset: Content.offset)))
                                
                                    .gesture(DragGesture().onChanged({ (value) in
                                        
                                        withAnimation{
                                            if (value.translation.width > 0){
                                                all_contents[Content.id].offset = value.translation.width
                                            }
                                        }
                                    }).onEnded({ (value) in
                                        
                                        withAnimation{
                                            if (value.translation.width > 150){
                                                all_contents[Content.id].offset = 1000
                                                swiped = Content.id + 1
                                                restoreCard(id: Content.id)
                                            }
                                            else{
                                                all_contents[Content.id].offset = 0
                                            }
                                        }
                                    }))
                            }
                        }
                    } //zstack
                    .offset(y: -25)
                }
            }
            
            
            .navigationBarTitle(Text("\(arrayOfContent[index])")).navigationBarHidden(false)
            .background(Color(hex: "FEFBE7"))
            
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
                            .font(.system(size: 46))
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
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "476F78"))
                            .padding(.leading,20)
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
            .frame(height: reader.frame(in: .global).height - 180)
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
        
        
        
        //Content for drag/swipe gesture
//        .contentShape(Rectangle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}


//To add hex in color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

//Sample data
struct Content: Identifiable{
    var id: Int
    var type : String
    var category : String
    var words: String
    var offset: CGFloat
    var place: Int
}

