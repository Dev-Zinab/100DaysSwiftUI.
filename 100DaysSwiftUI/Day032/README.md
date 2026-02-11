





# 📚 Day 032: Animations in SwiftUI
> **Source:** [100 Days of SwiftUI - Day 1](https://www.hackingwithswift.com/100/swiftui/32)

## Topics
* **Implicit Animations:** Using `.animation()` to animate changes automatically.
* **Repeating Animations:** Using `.repeatForever()` and `.repeatCount()`.
* **View Lifecycle:** Triggering animation with `.onAppear`.
* **Layering Views:** Using `.overlay()` to draw views above others.
* **Animatable State:** Using `@State` for values that change.
* **Visual Modifiers:** Using `.scaleEffect()`, `.opacity()`, and `.blur()`.
* **Shapes:** Using `.stroke()` with `Circle()`.
* **SwiftUI Rendering Rule:** `body` must return a single View.


## 🎯 Key Takeaway
* **SwiftUI is declarative:** We describe the final state, and SwiftUI animates the change.
* **Animations happen when state changes.**
* **@State allows SwiftUI to track value changes.**
* **onAppear triggers animation when the view loads.**
## Important Modifiers
* **`.animation()`** → Animates value changes
* **`.repeatForever()`** → Infinite animation
* **`.repeatCount(x)`** → Repeats animation a fixed number of times
* **`.scaleEffect()`** → Changes view size
* **`.opacity()`** → Controls transparency
* **`.blur(radius:)`** → Adds blur effect
* **`.overlay()`** → Places a view above another
* **`.stroke()`** → Draws shape outline
* **`.clipShape()`** → Clips view to shape
* **`.onAppear()`** → Runs code when view appears

## 📒 Notes
* You must use **@State** for animatable values.
* `animationAmount` started at **1.0**.
* In `.onAppear`, it changed to **2**, triggering animation.
* Opacity was calculated using:
opacity = 2 - animationAmount
When `animationAmount = 2`, opacity becomes **0**.

* Boolean values **can animate** if they cause visual changes.
* If you use a variable in body **like calling print()** make sure to use **return**.


## 💻 Code Snippet

```swift
@State private var animationAmount = 1.0

Button("Press Me") {}
    .padding(50)
    .background(.blue)
    .foregroundColor(.white)
    .clipShape(Circle())
    .overlay(
        Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(
                .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                value: animationAmount
            )
    )
    .onAppear {
        animationAmount = 2
    }
