//
//  Day036_4.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 08/04/2026.
//Archiving Swift objects with Codable

import SwiftUI

struct Emplyee:Codable {
    let fName: String
    let lName: String
}

struct Day036_4: View {
    @State private var employees = Emplyee(fName: "Zinab", lName: "Mohammad")
    var body: some View {
        
        Button ("Save User"){
            let coder = JSONEncoder()
            if let data = try? coder.encode(employees){
                UserDefaults.standard.set(data, forKey: "employee")
            }
                
            
        }
    }
}
#Preview {
    Day036_4()
}
