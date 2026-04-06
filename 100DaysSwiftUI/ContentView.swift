//
//  ContentView.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 10/02/2026.
//

import SwiftUI

        struct ContentView: View {
            var body: some View {
                HStack {
                    Text("My code works…I have absolutely no idea why this extremely long text behaves like this.")

                    Text("I fixed one bug and created others ^_^!.")

                   
                }
                .font(.largeTitle)
                .background(Color.yellow)
                .lineLimit(2)

            }
        }
#Preview {
    ContentView()
}
