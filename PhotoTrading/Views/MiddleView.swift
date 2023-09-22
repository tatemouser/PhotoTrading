//
//  MiddleView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/19/23.
//

import SwiftUI

struct MiddleView: View {
    //@Binding var isPlayerReady: Bool // Add a binding to MainView's isPlayerReady

    var body: some View {
//        Button(action: {
//                    self.isPlayerReady = true // Update isPlayerReady in MainView via binding
//                }) {
//                    Text("Update Player Status")
//                }
        
        VStack {
            HStack {
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                
//                if isPlayer2Confirmed {
//                    CheckMarkStatusView(color: .green)
//                } else {
//                    XMarkStatusView(color: .red)
//                }
                //                CheckMarkStatusView()
                //                XMarkStatusView()
            }
            //.padding(.trailing, 50)
            
            HStack {
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                
//                if isPlayer1Confirmed {
//                    CheckMarkStatusView(color: .green)
//                } else {
//                    XMarkStatusView(color: .red)
//                }
                
                // already commented prior ot isPlayer1Confirmed comments
                //                CheckMarkStatusView()
                //                XMarkStatusView()
            }
            //.padding(.trailing, 50)
        }
        .frame(maxWidth: .infinity) //, maxHeight: .infinity)
        .background(Color.black)
        .background(Color("LightBlue1"))
    }
}

struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleView()
    }
}

