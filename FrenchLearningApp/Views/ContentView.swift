//
//  ContentView.swift
//  FrenchLearningApp
//
//  Created by Joyce Tao on 2021-12-07.
//

import SwiftUI

struct ContentView: View {
    @State var currentPhrase: Card = listOfWords.randomElement()!
    @State var inputTranslation: String = ""
    @State var isAnswerShowing = false
    var body: some View {
        VStack(spacing: 25) {
            
            // Output
            Text(currentPhrase.frenchPhrase)
                .font(.largeTitle)
            // Input
            TextField("Translation",
                      text: $inputTranslation,
                      prompt: Text("Enter English translation here"))
            Button(action: {
                withAnimation {
                    if inputTranslation == currentPhrase.englishTranslation {
                        isAnswerShowing = true
                    }
                }
            },
                   label: {
                Text("Check")
            })
                .buttonStyle(.bordered)
            
            // Output
            Text(currentPhrase.englishTranslation)
                .font(.title)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            // Input
            Button(action: {
                isAnswerShowing = false
                currentPhrase = listOfWords.randomElement()!
                inputTranslation = ""
            },
                   label: {
                Text("Another")
            })
                .buttonStyle(.bordered)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            Spacer()
        }
        .padding()
        .navigationTitle("French Learning")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
