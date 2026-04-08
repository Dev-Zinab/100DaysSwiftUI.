//
//  Day036.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 08/04/2026.
//

import SwiftUI
import Observation
// to mentor any change inside the class

@Observable
class User {
    var firstName = "Zinab"
    var lastName = "Mohammed"
}
struct Day036: View {
    @State private var user = User()
   var body: some View {
        VStack {
            Text("Your Name is \(user.firstName) \(user.lastName).")
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text:$user.lastName)

        }
    }
    
    

}
