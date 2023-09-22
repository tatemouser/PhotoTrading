//
//  GameView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/9/23.
//

import SwiftUI
import Combine

//struct ConfirmDenyButton: View {
//    var color: Color
//    var symbol: String
//    @Binding var isConfirmed: Bool
//
//    var body: some View {
//        Button(action: {
//            // Toggle the confirmation status for the corresponding player
//            self.isConfirmed.toggle()
//        }) {
//            Text(symbol)
//                .padding(.horizontal, 10)
//                .frame(maxWidth: .infinity)
//
//                .frame(height: 60)
//
//                .foregroundColor(.white)
//                .background(color)
//                .cornerRadius(8)
//                .bold()
//                .font(.system(size: 30))
//        }
//    }
//}

struct DottedBoxView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8) // Adjust cornerRadius as needed
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5])) // Adjust lineWidth and dash pattern as needed
            .frame(width: 65, height: 90)
            .colorInvert()
    }
}

struct CheckMarkStatusView: View {
    let color: Color
    
    var body: some View {
        Text("✓")
            .font(.system(size: 30))
            .foregroundColor(color)
    }
}
struct XMarkStatusView: View {
    let color: Color
    
    var body: some View {
        Text("X")
            .font(.system(size: 30))
            .foregroundColor(color)
    }
}

struct Game: Hashable {
    let name: String
    let rating: String
}

struct Pathway: Hashable {
    let name: String
}

struct GameView: View {
    @ObservedObject var matchManager: MatchManager = MatchManager()
    @State var isPlayer1Confirmed = false
    @State var isPlayer2Confirmed = false
    @State private var tradeCompleted = false
    // For button confirmation window
    
    @State private var buttonColor: Color = .green
    
    //    var games: [Game] = [
    //            .init(name: "g1", rating: "23"),
    //            .init(name: "g2", rating: "34"),
    //            .init(name: "g3", rating: "23"),
    //            .init(name: "g4", rating: "34")]
    var pathway: [Pathway] = [
        .init(name: "first"),
        .init(name: "second")]
    
    @State private var path = NavigationPath()
    
    @State private var isPlayerReady = false // Declare isPlayerReady as @State

    var body: some View {
        NavigationStack(path: $path) {

            VStack {
                
                OpponentView()
                
                MiddleView()

                // Text("Player is ready: \(isPlayerReady ? "Yes" : "No")")
                            
                //MiddleView(isPlayerReady: $isPlayerReady) // Pass
                
                PlayerView()

            }
            .padding(.bottom, 40)
            .background(Color.red)
            .foregroundColor(Color.red)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
        //GameView()
    }
}

// NAVIGATION IMPLEMENTATION INFORMATION
//            if isPlayer1Confirmed {
//
//
//            NavigationLink(destination: TradeCompleteView(matchManager: matchManager)) {
//                Text("to do")
//            }
//            if isPlayer1Confirmed {
//                NavigationLink(value: pathway[1]) {
//                    Text("to the games")
//                }
//                //            .navigationTitle("THE TOP")
//                //
//                .navigationDestination(for: Pathway.self) { game in
//                    VStack(spacing: 20) {
//                        Text("\(game.name)")
//
//                        Button("next") {
//                            path.append(pathway[1])
//                        }
//
//                        Button("home") {
//                            path.removeLast(path.count)
//                        }
//                    }
//                }
//            }


// POP UP WINDOW IMPLEMENTATION
//
//@State private var showingAlert = false
//@State private var name = ""
//
//var body: some View {
//    Button("Enter name") {
//        showingAlert.toggle()
//    }
//    .alert("Deal Confirmed", isPresented: $showingAlert) {
//        //TextField("Enter your name", text: $name)
//        Button("Download Now", action: submit)
//    } message: {
//        //Text("Xcode will print whatever you type.")
//    }
//}
//
//func submit() {
//    print("You entered \(name)")
//}
