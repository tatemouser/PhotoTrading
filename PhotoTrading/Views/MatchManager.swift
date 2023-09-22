//
//  MatchManager.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/9/23.
//

import Foundation
import GameKit
import PencilKit

class MatchManager: NSObject, ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var isTimeKeeper = false
    @Published var authenticationState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = false
    @Published var drawPrompt = ""
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    
    @Published var remainingTime = maxTimeRemaining {
        willSet {
            if isTimeKeeper { sendString("timer:\(newValue)") }
            if newValue < 0 { gameOver()}
        }
    }
    
    @Published var p1Confirm = false;
    @Published var p1Deny = false;
    
    @Published var p2Confirm = false;
    @Published var p2Deny = false;
    
    
    @Published var lastReceivedDrawing = PKDrawing()
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            
            if let error = e {
                authenticationState = .error
                print(error.localizedDescription)
                
                return
            }
            
            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    authenticationState = .restricted
                } else {
                    authenticationState = .authenticated
                }
                
            } else {
                authenticationState = .unauthenticated
            }
        }
    }
    
    func startMatchmaking() {
        let request = GKMatchRequest()
        //request.minPlayers = 2
        request.minPlayers = 2
        request.maxPlayers = 2
        
        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
        matchmakingVC?.matchmakerDelegate = self
        
        rootViewController?.present(matchmakingVC!, animated: true)

    }
    
    func startGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        //otherPlayer = match?.players.first
        drawPrompt = everydayObjects.randomElement()!
        
        sendString("began:\(playerUUIDKey)")
    }
    
    func swapRoles() {
        score += 1
        currentlyDrawing = !currentlyDrawing
        drawPrompt = everydayObjects.randomElement()!
    }
    
    func gameOver() {
        isGameOver = true
        match?.disconnect()
    }
    
    func resetGame() {
        DispatchQueue.main.async { [self] in
            isGameOver = false
            inGame = false
            drawPrompt = ""
            score = 0
            remainingTime = maxTimeRemaining
            lastReceivedDrawing = PKDrawing()
        }
        
        isTimeKeeper = false
        match?.delegate = nil
        match = nil
        otherPlayer = nil
        pastGuesses.removeAll()
        playerUUIDKey = UUID().uuidString
    }
    
    func receivedString(_ message: String) {
        let messageSplit = message.split(separator: ":")
        guard let messagePrefix = messageSplit.first else { return }
        
        let parameter = String(messageSplit.last ?? "")
        
        switch messagePrefix {
        case "began":
            // For 1 in 17 billion chance of same id
            if playerUUIDKey == parameter {
                playerUUIDKey = UUID().uuidString
                sendString("began:\(playerUUIDKey)")
                break
            }
            
            currentlyDrawing = playerUUIDKey < parameter
            inGame = true
            isTimeKeeper = currentlyDrawing
            
            if isTimeKeeper {
                //countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
        case "guess":
            var guessCorrect = false
            if parameter.lowercased() == drawPrompt {
                sendString("correct:\(parameter)")
                swapRoles()
                guessCorrect = true
            } else {
                sendString("incorrect:\(parameter)")
            }
            
            appendPastguess(guess: parameter, correct: guessCorrect)
        case "correct":
            swapRoles()
            appendPastguess(guess: parameter, correct: true)
        case "incorrect":
            appendPastguess(guess: parameter, correct: false)
        case "time":
            remainingTime = Int(parameter) ?? 0
        default:
            break
        }
    }
    
    func appendPastguess(guess: String, correct: Bool) {
        pastGuesses.append(PastGuess(
            message: "\(guess)\(correct ? " was correct!)" : "")",
            correct: correct))
    }
}
