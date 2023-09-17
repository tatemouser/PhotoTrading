//
//  PlayerImageBoxView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/12/23.
//

import SwiftUI

struct ConfirmDenyButton: View {
    var color: Color
    var symbol: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(symbol)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
                
                .frame(height: 60)

                .foregroundColor(.white)
                .background(color)
                .cornerRadius(8)
                .bold()
                .font(.system(size: 30))
        }
        .padding(10)
    }
}

struct PlayerImageBoxView: View {
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
                ConfirmDenyButton(
                    color: .green,
                    symbol: "Confirm")
                ConfirmDenyButton(
                    color: .red,
                    symbol: "Reject")
            }
            
            Rectangle()
            .frame(height: 13)
            .foregroundColor(Color.red)
            .edgesIgnoringSafeArea(.bottom)
            // Seperates trade now button
            .padding(.top, 30)

//            Rectangle()
//            .frame(height: 5)
//            .foregroundColor(Color.red)
//            .edgesIgnoringSafeArea(.bottom)
        }
        //.padding(.bottom, 30)
        .background(Color.black)
    }
}

struct PlayerImageBoxView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerImageBoxView()
    }
}
