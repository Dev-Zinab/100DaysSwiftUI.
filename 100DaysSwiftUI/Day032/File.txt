# 📚 Day 001: First steps in Swift
> **Source:** [100 Days of SwiftUI - Day 1](https://www.hackingwithswift.com/100/swiftui/1)

## Topics
* **Variables & Constants:** Understanding the difference between `var` (dynamic) and `let` (immutable).
* **Strings:** Managing text, using multi-line strings `"""`, and mastering **String Interpolation** to inject data into text.
* **Numbers:** Working with `Int` for whole numbers and `Double` for decimal precision.
* **Type Safety:** Why Swift prevents mixing different data types (e.g., adding an Int to a Double).


🎯 Key Takeaway
"Swift is designed for safety. By defaulting to let, we prevent accidental changes to data, making our code more predictable and optimized."



## 💻 Code Snippet
```swift
import Foundation

// 1. Constants and Variables
let playerName = "Ariel"
var currentScore = 0
currentScore += 10

// 2. String Interpolation
let message = "Welcome, \(playerName)! Your current score is \(currentScore)."
print(message)

// 3. Decimals (Doubles)
let pi = 3.141
let radius = 5.0
let area = pi * radius * radius
