//
//  ContentView.swift
//  WeSplit
//
//  Created by Marvin John on 03.08.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var selected = "2 people"
    
    var people = ["2 people", "3 people", "4 people", "5 people",]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Bill Amount", text: $billAmount)
                
                Picker("Number of people", selection: $selected) {
                    ForEach(people, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
