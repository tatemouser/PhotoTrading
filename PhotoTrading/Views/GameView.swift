//
//  GameView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/9/23.
//

import SwiftUI
import Combine

struct ConfirmDenyButton: View {
    var color: Color
    var symbol: String
    @Binding var isConfirmed: Bool
    
    var body: some View {
        Button(action: {
            // Toggle the confirmation status for the corresponding player
            self.isConfirmed.toggle()
        }) {
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

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}

struct GameView: View {
    @ObservedObject var matchManager: MatchManager = MatchManager()
    @State var isPlayer1Confirmed = false
    @State var isPlayer2Confirmed = false
    @State private var tradeCompleted = false

    @State private var buttonColor: Color = .green // Initialize with the default color

    var platforms: [Platform] = [
        .init(name: "p1", imageName: "xbox.logo", color: .red),
        .init(name: "p2", imageName: "xbox.logo", color: .blue)]
    var games: [Game] = [
        .init(name: "g1", rating: "23"),
        .init(name: "g2", rating: "34"),
        .init(name: "g3", rating: "23"),
        .init(name: "g4", rating: "34")]

    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Text(platform.name) // Use Text view instead of Label
                                .foregroundColor(platform.color)
                        }
                    }
                }
                ForEach(games, id: \.name) { game in
                    NavigationLink(value: game) {
                        Text(game.name)
                    }
                }
            }
            .navigationTitle("THE TOP")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    VStack {
                        Text(platform.name) // Use Text view instead of Label
                            .foregroundColor(platform.color)
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                VStack(spacing: 20) {
                    Text("\(game.name) - \(game.rating)")

//                    Button("next") {
//                        path.append(platforms.randomElement()!)
//                        path.append(platforms.)!)
//                    }
                    Button("next") {
                        path.append(games[1])
                    }

                    Button("home") {
                        path.removeLast(path.count)
                    }
                }
            }
        }
    }
}
//        VStack {
//            //_________________________________________________________________________________________
//            // First View - Opponent Image
//            VStack {
//                HStack(alignment: .top) {
//                    Text("NAME HERE")
//                        .font(.system(size: 26))
//                        .bold()
//                        .underline()
//                        .padding(.leading, 30)
//                    Spacer()
//                }
//                ZStack {
//                    HStack {
//                        DottedBoxView()
//                        DottedBoxView()
//                        DottedBoxView()
//                        DottedBoxView()
//                        DottedBoxView()
//                    }
//                    .padding(.bottom, 15)
//                }
//            }
//            .padding(.top, 40)
//            .frame(width: .infinity, height: 200)
//            .background(Color.black)
//
//            Spacer()
//
//
//
//
//            //_________________________________________________________________________________________
//            // Second View - Main Image
//            VStack {
//                HStack {
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//
//                    if isPlayer2Confirmed {
//                        CheckMarkStatusView(color: .green)
//                    } else {
//                        XMarkStatusView(color: .red)
//                    }
//                    //                CheckMarkStatusView()
//                    //                XMarkStatusView()
//                }
//                //.padding(.trailing, 50)
//
//                HStack {
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//
//                    if isPlayer1Confirmed {
//                        CheckMarkStatusView(color: .green)
//
//                    } else {
//                        XMarkStatusView(color: .red)
//                    }
//                    //                CheckMarkStatusView()
//                    //                XMarkStatusView()
//                }
//                //.padding(.trailing, 50)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.black)
//
//            .frame(width: .infinity, height: 250)
//            .background(Color("LightBlue1"))
//
//            Spacer()
//
//
//
//            //_________________________________________________________________________________________
//            // Third View - Player Image
//            VStack {
//                HStack {
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//                    DottedBoxView()
//                }
//                .padding(.top, 20)
//
//                HStack {
//                    if isPlayer1Confirmed {
//                        ConfirmDenyButton(color: .red, symbol: "Reject", isConfirmed: $isPlayer1Confirmed)
//                    } else {
//                        ConfirmDenyButton(color: .green, symbol: "Confirm", isConfirmed: $isPlayer1Confirmed)
//                    }
//                }
//
//                Rectangle()
//                    .frame(height: 13)
//                    .foregroundColor(Color.red)
//                    .edgesIgnoringSafeArea(.bottom)
//                // Seperates trade now button
//                    .padding(.top, 30)
//
//                //            Rectangle()
//                //            .frame(height: 5)
//                //            .foregroundColor(Color.red)
//                //            .edgesIgnoringSafeArea(.bottom)
//            }
//            //.padding(.bottom, 30)
//            .background(Color.black)
//            .frame(width: .infinity, height: 250)
//            .background(Color.black)
//
//            Spacer()
//
//        }
//        .padding(.bottom, 40)
//        .background(Color.red)
//        .foregroundColor(Color.red)
//    }
//}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
        //GameView()
    }
}
