//
//  GameView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/9/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack() {
            
            // First View - Opponent Image
            OpponentImageBoxView()
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: .infinity, height: 200)
                .background(Color.black)
                Spacer()
            // Second View - Main Image
            MainImageBoxView()
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: .infinity, height: 250)
                .background(Color("LightBlue1"))
                Spacer()
            
            // Third View - Player Image
            PlayerImageBoxView()
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: .infinity, height: 250)
                .background(Color.black)
                Spacer()
        }
        .padding(.bottom, 40)
        .background(Color.red)
        .foregroundColor(Color.red)
        
//        ZStack {
//            OpponetImageBoxView()
//
//            MainImageBoxView()
//
//            PlayerImageBoxView()
//
//            //OpponetImageBoxView (exit button on top)
//            //MainImageBoxView (shows accept / decline status)
//            //PlayerImageBoxView (has accept and decline)
//        }
    }
}

/*
var countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = false
    
    func makeGuess() {
        guard drawingGuess != "" else { return }
        matchManager.sendString("guess:\(drawingGuess)")
        drawingGuess = ""
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlyDrawing ? "drawerBg" : "guesserBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.1)
                
                VStack {
                    topBar
                    
                    ZStack {
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 10))
                        
                        VStack {
                            HStack {
                                Spacer()
                                
                                if matchManager.currentlyDrawing {
                                    Button {
                                        eraserEnabled.toggle()
                                    } label: {
                                        Image(systemName: eraserEnabled ?
                                              "eraser.fill" : "eraser")
                                        .font(.title)
                                        .foregroundColor(Color.purple)
                                        .padding(.top, 10)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding()
                    }
                    pastGuesses
                }
                .padding(.horizontal, 30)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            
            VStack {
                Spacer()
                
                promptGroup
            }
            .ignoresSafeArea(.container)
        }
        .onReceive(countdownTimer) { _ in
            guard matchManager.isTimeKeeper else { return }
            matchManager.remainingTime -= 1
            
        }
    }
    
    var topBar: some View {
        ZStack {
            HStack {
                Button {
                    matchManager.match?.disconnect()
                    matchManager.resetGame()
                } label: {
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .tint(matchManager.currentlyDrawing ?
                              Color.green :
                                Color.red)
                }
                
                Spacer()
                
                Label("\(matchManager.remainingTime)", systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundColor(matchManager.currentlyDrawing ?
                                     Color.green :
                                        Color.red)
            }
            
            Text("Score: \(matchManager.score)")
                .bold()
                .font(.title)
                .foregroundColor(Color(matchManager.currentlyDrawing ? .blue :  .green))
            
        }
        .padding(.vertical, 15)
    }
    
    var pastGuesses: some View {
        ScrollView {
            ForEach(matchManager.pastGuesses) { guess in
                HStack {
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    
                    if guess.correct {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(matchManager.currentlyDrawing ?
                                             Color.green : Color.red
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            (matchManager.currentlyDrawing ?
             Color.green : Color.red)
        )
        .brightness(-0.2)
        .opacity(0.5)
        .cornerRadius(20)
        .padding(.vertical)
        .padding(.bottom, 130)
    }
    
    var promptGroup: some View {
        VStack {
            if matchManager.currentlyDrawing {
                Label("DRAW:", systemImage: "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text(matchManager.drawPrompt.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(Color.white)
            } else {
                HStack {
                    Label("GUESS THE DRAWING!:", systemImage: "exclamationmark.bubble.fill")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                HStack {
                    TextField("Type your guess", text: $drawingGuess)
                        .padding()
                        .background(
                            Capsule(style: .circular)
                                .fill(.white)
                        )
                        .onSubmit(makeGuess)
                        
                    
                    Button {
                        makeGuess()
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(Color.black)
                            .font(.system(size: 50))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.horizontal, .bottom], 30)
        .padding(.vertical)
        .background(
            (matchManager.currentlyDrawing ? Color.green : Color.red)
                .opacity(0.5)
                .brightness(-0.2)
        )
    }
}*/

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        //GameView(matchManager: MatchManager())
        GameView()
    }
}
