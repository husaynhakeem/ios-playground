//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Husayn Hakeem on 2/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var alert = Alert()
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.bold))
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    
                    VStack(spacing: 15) {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(alert.title, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text(alert.message)
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 10
            alert = Alert(title: "Correct", message: "Your score is \(score)")
        } else {
            alert = Alert(title: "Wrong", message: "That's the flag of \(countries[number])")
        }
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct Alert {
    let title: String
    let message: String
    
    init() {
        self.init(title: "", message: "")
    }
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
