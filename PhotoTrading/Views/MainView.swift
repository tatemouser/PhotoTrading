//
//  ContentView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/4/23.
//
import GameKit
import SwiftUI

struct MainView: View {
    //@ObservedObject var matchManager: MatchManager
    @ObservedObject var matchManager: MatchManager = MatchManager()
    
    var body: some View {
         ZStack {
            if matchManager.inGame {
                // For running regulat gameview without commenting
                //GameView(matchManager: matchManager)
                GameView()
            } else {
                //MenuView(matchManager: matchManager)
                MenuCompleteView(matchManager: matchManager)
            }
        }
        .onAppear {
            matchManager.authenticateUser()
        }
     }
}

struct MenuCompleteView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            
            TabView {
                HomeView(matchManager: matchManager)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .padding(.bottom, 10)
                
                AddFriendsView()
                    .tabItem {
                        Label("Add Friends", systemImage:
                                "person.badge.plus.fill")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage:
                                "person.circle")
                    }
            }
            .accentColor(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(matchManager: MatchManager())
        
    }
}

