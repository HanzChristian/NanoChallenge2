//
//  ContentView.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//

import SwiftUI

// 1st View
struct DeckView: View {
    
    //Dummy data
    @State var all_contents = [
        Content(id: 0, type: "Introduction", category: "Introducing Yourself", words: "For those of you who don’t know me already, my name’s ... and I’m responsible for...", place: 1),
        
        Content(id: 1, type: "T", category: "Asada", words: "Konz",place: 2),
        
        Content(id: 1, type: "e", category: "Sama", words: "Lu",place: 2),
        
        Content(id: 1, type: "s", category: "Semua", words: "Ngen",place: 2),
        
        Content(id: 1, type: "t", category: "Ngen", words: "Sama",place: 2),
        
        Content(id: 1, type: "i", category: "Lu", words: "Semua",place: 2),
        
        Content(id: 1, type: "s", category: "Inilah", words: "Pahitnya",place: 2),
    ]
    
    @State var isActive: Bool = false
    
    func buttonPressed(){
        self.isActive = true
    }
    
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
                        ForEach(1..<7){ i in
                            HStack{
                                
                                NavigationLink(destination: CardView(), isActive: self.$isActive){
                                    Text("")
                                }
                                
                                Button(action:{
                                    buttonPressed()
                                }){
                                    Image("img\(i)")
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
    
    var index:Int = 0
    
    var body: some View{
        
        //logic berdasarkan index
        if(index == 0){
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(Color(hex: "5C929D"))
                Spacer()
                
                GeometryReader{reader in
                    
                    ZStack{
//                        ForEach(all_cont)
                        
                    }
                }
            }
            
            .navigationBarTitle(Text("\(arrayOfContent[0])")).navigationBarHidden(false)
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
    var place: Int
}

