//
//  Day036_1.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 08/04/2026.
//

import SwiftUI

struct Secondview: View {
    @Environment(\.dismiss) var dismiss

    let name : String
    var body: some View {
        Text("Hello,\(name)!.")
Button("Dismiss") {
            dismiss()
        }

    }
}
struct Day036_1: View {
    @State var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        } .sheet(isPresented:$showSheet){
            Secondview(name: "zinab")
        }
    }
}
#Preview {
    Day036_1()
}
