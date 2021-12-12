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
    @State var isCheckButtonShowing = true
    @State var numberOfPhrasesShown: Int = 1
    @State var numberOfCorrectAnswers: Int = 0
    @State var numberOfWrongAnswers: Int = 0
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
                        isCheckButtonShowing = false
                        if numberOfWrongAnswers == 0 {
                            numberOfCorrectAnswers += 1
                        }
                    } else {
                        numberOfWrongAnswers += 1
                    }
                }
            },
                   label: {
                Text("Check")
            })
                .buttonStyle(.bordered)
                .opacity(isCheckButtonShowing ? 1.0 : 0.0)
            
            // Output
            Text(currentPhrase.englishTranslation)
                .font(.title)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            // Input
            Button(action: {
                isAnswerShowing = false
                isCheckButtonShowing = true
                currentPhrase = listOfWords.randomElement()!
                inputTranslation = ""
                numberOfPhrasesShown += 1
                numberOfWrongAnswers = 0
            },
                   label: {
                Text("Another")
            })
                .buttonStyle(.bordered)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            // Output
            Text("\(numberOfCorrectAnswers) correct out of \(numberOfPhrasesShown) question(s)")
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
