//
//  Day036_2.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 08/04/2026.
//Deleting items using onDelete()


import SwiftUI

struct Day036_2: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack{
            
            
            VStack{
                List{
                    ForEach(numbers, id:\.self){
                        Text("Row \($0)")
                    }.onDelete(perform: removeRow)
                }
                
                Button("Add"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }.toolbar{
                EditButton()            }
        }
    }
    func removeRow(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    Day036_2()
}
