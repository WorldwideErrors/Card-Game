//
//  ContentView.swift
//  Card Game
//
//  Created by Jeffrey on 25/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard: String = "back"
    @State var cpuCard: String = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack(){
            Image("background-plain")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        
            VStack(spacing: 30) {
                Image("logo")
                    
                // Card Section
                HStack{
                    Spacer()
                    Image(playerCard)
                        .shadow(radius: 20)
                    Spacer()
                    Image(cpuCard)
                        .shadow(radius: 20)
                    Spacer()
                }
                
                Button{
                    dealCards()
                } label:{
                    Image("button")
                }
                
                // Score Section
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)
                        Text("\(playerScore)")
                            .font(Font.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        Text("\(cpuScore)")
                            .font(Font.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
            }
            .padding()
        }
    }
    
    func dealCards(){
        // Randomize card values
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        // Set values to cards
        playerCard = "card" + String(playerValue)
        cpuCard = "card" + String(cpuValue)
        
        // Calculate scores
        calculateScores(playerValue: playerValue, cpuValue: cpuValue)
    }
    
    func calculateScores(playerValue: Int, cpuValue: Int){
        if playerValue > cpuValue {
            playerScore += 1
        } else if cpuValue > playerValue {
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
