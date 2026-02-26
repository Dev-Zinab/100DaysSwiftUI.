//
//  Day034.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 18/02/2026.


//Challnge
//When you tap a flag, make it spin around 360 degrees on the Y axis.
//Make the other two buttons fade out to 25% opacity.
//Add a third effect of your choosing to the two flags the user didn’t choose – maybe make them scale down? Or flip in a different direction? Experiment!
import SwiftUICore

struct viewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}
struct test: View {
  var body: some View {
        Text("Hello, World!")
          .title()
    }
}
extension View {
    func title()-> some View {
        modifier(viewModifier())
    }
}


import SwiftUI
struct FlagImage: View {
    let imageName: String

var body: some View {
    Image (imageName)
        .clipShape(.capsule)
        .shadow(radius: 5)
    

}
}

struct Day034: View {
    static  var allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var countries = allCountries
    @State  var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingfinalAlert = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    // 1) Track which flag was tapped (drives all visual effects).
    @State private var selectedAnswer: Int?
    @State private var currentQuestionNumber = 0
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                
                    .init(color: .blue, location: 0.3),
                    .init(color: .purple, location: 0.3)
                                                 ]
                           , center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea(.all)
            VStack{
                Spacer()

                Text("Guess the flag!")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                Spacer()

                VStack {
                    VStack(spacing:15) {
                        Text("Tap the flag of:")
                            .foregroundStyle(.secondary)
                            .font(.headline.weight(.heavy))
                        Text("\(countries[correctAnswer])")
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach (0..<3) { number in
                        // 2) Animate the selection change using `withAnimation` when updating `selectedAnswer`. لان بدونه يسير التحرك غير سلس ومباشر

                        Button {
                            withAnimation {
                                selectedAnswer = number
                            }
                            flagTapped(number)
                        }
                        label: {
                            // 3) Apply effects based on `selectedAnswer`
                            // so the animation affects the label's content correctly
                            FlagImage(imageName: countries[number])
                                .opacity(selectedAnswer == nil || selectedAnswer == number ? 1 : 0.25)
                                .rotation3DEffect(.degrees(selectedAnswer == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .scaleEffect( selectedAnswer == number ? 1.2 : 1)
                        }
                        
                    } .alert(scoreTitle,isPresented: $showingScore) {
                        Button ("Continue", action: askQuestion)
                    } message: {
                        Text("Your score: \(score)")
                    }
                    .alert("The End",isPresented: $showingfinalAlert) {
                        Button ("Restart", action: Restart)
                    } message: {
                        Text("Your final score: \(score)")
                    }

                    
                } .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding()
                Spacer()
                Spacer()

            }
            
        }
    }
     func flagTapped(_ number: Int) {
         guard currentQuestionNumber < 8 else {return}
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score = score + 1
            currentQuestionNumber = currentQuestionNumber + 1
        } else {
            let chosenCountry = countries[number]
            scoreTitle = "Wrong! That's the flag of \(chosenCountry)."
            currentQuestionNumber = currentQuestionNumber + 1



        }
        showingScore = true
    }
    func askQuestion () {
        
        if currentQuestionNumber < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            countries.remove(at: correctAnswer)
            //3:return the value to nill each turn
            selectedAnswer = nil
        }
        
        else {
            showingfinalAlert = true
        }

    }
    
    func Restart() {
        currentQuestionNumber = 0
        score = 0
        countries = Self.allCountries
        correctAnswer = Int.random(in: 0...2)
        showingfinalAlert = false
        selectedAnswer = nil
    }
}

#Preview {
    Day034()
}
