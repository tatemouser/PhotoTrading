//
//  TradeCompleteView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/16/23.
//

import SwiftUI

struct TradeCompleteView: View {
    @ObservedObject var matchManager: MatchManager

    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Names and arrows
                Text("------------>")

                HStack {
                    Text("Bobby")
                    Spacer()
                    Text("Theo")
                }
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.title)
                .padding(30)
                
                Text("<-------------")
                
                // Photo of trade
                Image("swappingPhoto")
                    .resizable() // Allow the image to be resized
                    .frame(width: 200, height: 200) // Set the image size
                    .aspectRatio(contentMode: .fit)
                
                // Download
                Button {
                    
                } label: {
                    Text("Download")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(Color.black)
                
                // Return home
                Button {
                    
                } label: {
                    Text("Go home")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(Color.black)
            }
        }
    }
}

struct TradeCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        TradeCompleteView(matchManager: MatchManager())
    }
}
