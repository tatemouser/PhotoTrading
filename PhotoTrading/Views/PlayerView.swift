//
//  PlayerView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/19/23.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        VStack {
            HStack {
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
            }
            .padding(.top, 20)
            
            HStack {
//                if isPlayer1Confirmed {
//                    ConfirmDenyButton(color: .red, symbol: "Reject", isConfirmed: $isPlayer1Confirmed)
//                    
//                } else {
//                    ConfirmDenyButton(color: .green, symbol: "Confirm", isConfirmed: $isPlayer1Confirmed)
//                }
                
            }
            
            Rectangle()
                .frame(height: 13)
                .foregroundColor(Color.red)
                .edgesIgnoringSafeArea(.bottom)
            // Seperates trade now button
                .padding(.top, 30)
        }
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
