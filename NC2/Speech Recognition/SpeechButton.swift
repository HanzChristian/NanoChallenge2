//
//  SpeechButton.swift
//  NC2
//
//  Created by Hanz Christian on 28/07/22.
//

import Speech
import SwiftUI
import Foundation

struct SpeechButton: View {
    
    @State var isPressed:Bool = false
    @State var actionPop:Bool = false
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
        
        Button(action:{// Button
            if(self.swiftUISpeech.getSpeechStatus() == "Denied - Close the App"){// checks status of auth if no auth pop up error
                self.actionPop.toggle()
            }else{
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.swiftUISpeech.isRecording.toggle()}// button animation
                if(self.swiftUISpeech.isRecording){
                    self.swiftUISpeech.startRecording()
                    isPressed = true
                }
                else{
                    self.swiftUISpeech.stopRecording()
                    isPressed = false
                    print("\(swiftUISpeech.outputText)")
                }
            }
        }){
            if(isPressed == false){
                Image("record")// Button Image
                    .resizable()
                    .frame(width: 88, height: 88)
                    .foregroundColor(.white)
            }
            else if(isPressed == true){
                Image("stop")// Button Image
                    .resizable()
                    .frame(width: 88, height: 88)
                    .foregroundColor(.white)
            }
        
        }.actionSheet(isPresented: $actionPop){
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Reinstall the App"))])// Error catch if the auth failed or denied
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        SpeechButton().environmentObject(SwiftUISpeech())
    }
}
