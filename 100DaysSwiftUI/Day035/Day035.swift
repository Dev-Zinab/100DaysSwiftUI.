//
//  Untitled.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 11/03/2026.
//
/*
 The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
 The player should be able to select how many questions they want to be asked: 5, 10, or 20.
 You should randomly generate as many questions as they asked for, within the difficulty range they asked for.

 */

import SwiftUI

struct Day035: View {
    @State var numberOfQuestions: Int = 5
    @State var selectedMultiplicationTable: Int = 2
    var body: some View {
        NavigationStack {
            VStack{
                Text("Day 035")
                Stepper("choose a tabela", value: $selectedMultiplicationTable, in: 2...12)
                Text("Multiplication Table \(selectedMultiplicationTable)")
                
                Text("Questions")
                
                Picker("number of questions", selection: $numberOfQuestions) {
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("15").tag(15)
                }.pickerStyle(SegmentedPickerStyle())
                
                NavigationLink {
                    Day035_1(
                        selectedMultiplicationTable: selectedMultiplicationTable,
                        numberOfQuestions: numberOfQuestions
                    )
                }
                
                label: {
                    Text("Start")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    
                }
                
            }
        }
    }
}

#Preview {
    Day035()
}
