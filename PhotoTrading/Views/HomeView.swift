//
//  ToDoListItemsView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/4/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @ObservedObject var matchManager: MatchManager

//    init() {
//        // Initialize matchManager here by creating an instance of it
//        self.matchManager = MatchManager()
//
//        // Customize the back button color
//        UINavigationBar.appearance().tintColor = .red
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button {
                    // Matchmaking nonsense that i was trying to find
                    matchManager.startMatchmaking()
                } label: {
                    Text("Trade Now")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background {
                    Capsule(style: .circular)
                        .fill(matchManager.authenticationState != .authenticated || matchManager.inGame ? .gray : Color.red)
                }
                
                Text(matchManager.authenticationState.rawValue)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(Color.white)
                    .padding()
//                NavigationLink(destination: GameView()) {
//                    Text("Trade Now")
//                        .padding(.horizontal, 20)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 60)
//                        .foregroundColor(Color.white)
//                        .background(Color.red)
//                        .cornerRadius(8)
//                        .bold()
//                        .font(.system(size: 30))
//                }
//                .padding(.trailing, 20)
//                .padding(.leading, 20)
//                // Seperates trade now button
//                .padding(.top, 10)

                Spacer()
                
                Rectangle()
                .frame(height: 10)
                .foregroundColor(Color.red)
                //.edgesIgnoringSafeArea(.bottom)
                // Seperates trade now button
                .padding(.top, 10)

            }
            .frame(maxHeight: .infinity)
            .background(Color.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(matchManager: MatchManager())
    }
}
