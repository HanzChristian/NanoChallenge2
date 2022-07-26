//
//  CardView.swift
//  NC2
//
//  Created by Hanz Christian on 22/07/22.
//

import SwiftUI

struct SpellingView: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var record:Bool = false
    
    var index:Int = 0
    //    var Content:Content
    
    var body: some View {
        
        VStack{
            Rectangle()
                .frame(height: 0)
                .background(Color(hex: "5C929D"))
            Spacer()
            
            GeometryReader{reader in
                VStack{
                    Text("Type : Introduction")
                        .font(.system(size: 24).weight(.bold))
                        .foregroundColor(Color(hex: "476F78"))
                        .padding()
                        .padding(.trailing,60)
                    
                    ZStack{
                        VStack(){
                            ZStack{
                                Rectangle()
                                    .frame(width: 277, height: 56)
                                    .foregroundColor(Color(hex: "5C929D"))
                                    .cornerRadius(20)
                                Text("Try to Speak it!").font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                            
                            Text("For those of you who don’t know me already, my name’s ... and I’m responsible for...").font(.system(size: 24).weight(.bold))
                                    .foregroundColor(Color(hex: "476F78"))
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .frame(height:150)
                        }
                        .padding(.bottom,90)
                    }
                    .frame(width: 315, height: 334)
                    .background(Color(hex: "DAE5D0"))
                    .cornerRadius(20)
                    .padding(.leading,20)
                    .padding(.bottom,30)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    Button(action: {
                        if(record == false){
                            self.record = true
                            Image("stop")
                                .resizable().frame(width: 88, height: 88)
                                .padding(.leading,20)
                                .padding(.top,-87)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }){
                        Image("record")
                            .resizable().frame(width: 88, height: 88)
                            .padding(.leading,20)
                            .padding(.top,-87)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    
                    Button(action: {
                    }) {
                        Text("New Word!").font(.system(size: 24).weight(.bold))
                            .foregroundColor(Color(hex: "476F78"))
                    }
                        .frame(width: 300, height: 50)
                        .background(Color(hex: "DAE5D0"))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
                        .padding(.leading,25)
                        .padding(.top,30)
                }
                .padding()
            }
        }
        .navigationBarTitle(Text("Spelling Practice")).navigationBarHidden(false)
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

struct SpellingView_Previews: PreviewProvider {
    static var previews: some View {
        SpellingView()
    }
}
