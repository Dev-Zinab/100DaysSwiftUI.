//
//  Day035_1.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 05/04/2026.
//
import SwiftUI

struct Day035_1: View {
    @Environment(\.dismiss) var dismiss
    @State var num1 = 0
    @State var num2 = 0
    @State var correctAnswer = 0
@State private var userAnswer: String = ""
@State private var currentQuestionNumber: Int = 0
@State private var score: Int = 0
@State private var showAlert: Bool = false
@State private var finalAlert: Bool = false
@State private var scoreTitle: String = ""

    let selectedMultiplicationTable: Int
    let numberOfQuestions: Int
    var body: some View {
        VStack {
            
            
            Text("\(num1) x \(num2) = ?")
                .font(.largeTitle)
                .padding()
                .background(Color.pink)
                .cornerRadius(10)
                .padding()
            TextField("Enter answer", text: $userAnswer)
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(.largeTitle)
            Button("Check") {
                guard numberOfQuestions >  currentQuestionNumber else {
                    finalAlert = true
                    scoreTitle = "Game Over"
                    return
                }
                if let answer = Int(userAnswer.trimmingCharacters(in: .whitespaces))
                {
                    if Int(answer) == (correctAnswer) {
                        score += 1
                        
                        scoreTitle = "Correct"
                    }
                    else {
                        scoreTitle = "Wrong"
                    }
                    currentQuestionNumber += 1
                    generateRandomQuestion()
                    userAnswer = ""
                    
                }
                showAlert = true

            }.alert(scoreTitle,isPresented: $showAlert) {
                
            } message: {
                Text ("Your score is: \(score)")
            }
            .alert(scoreTitle,isPresented: $finalAlert) {
                Button ("Restart", action: Restart)

            } message: {
                Text ("Your score is: \(score)")
            }
            


        }.onAppear {
            
            generateRandomQuestion()
    }
        }
    func generateRandomQuestion() {
        if currentQuestionNumber < numberOfQuestions {
            
            
            num1 = selectedMultiplicationTable
            num2 = Int.random(in: 1...12)
            correctAnswer = num1 * num2
        }
            }
    func Restart () {
dismiss()
    }

}
#Preview {
    Day035_1(selectedMultiplicationTable: 5, numberOfQuestions: 5)
}
