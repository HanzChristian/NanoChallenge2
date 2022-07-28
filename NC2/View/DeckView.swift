//
//  ContentView.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//

import SwiftUI
import Speech

// 1st View
struct DeckView: View {
    @EnvironmentObject var swiftUISpeech : SwiftUISpeech
    
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
            .onAppear(){
                swiftUISpeech.getAuth()
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView().environmentObject(SwiftUISpeech())
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

