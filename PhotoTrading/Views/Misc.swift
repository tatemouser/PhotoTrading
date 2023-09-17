//
//  Misc.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/9/23.
//

import Foundation

let everydayObjects = ["paper", "tools", "dogs", "cats"]

enum PlayerAuthState: String {
    case authenticating = "Logging into Game Center..."
    case unauthenticated = "Please sing in to Game Center to play."
    case authenticated = ""
    
    case error = "There was an error logging into Game Center."
    case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100


