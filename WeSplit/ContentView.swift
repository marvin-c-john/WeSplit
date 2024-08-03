//
//  ContentView.swift
//  WeSplit
//
//  Created by Marvin John on 03.08.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var selectedPeople = "2 people"
    @State private var selectedTip = 10
    
    var people = [2, 3, 4, 5]
    var tips = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Bill Amount", text: $billAmount)
                
                Picker("Number of people", selection: $selectedPeople) {
                    ForEach(people, id: \.self){
                        Text("\($0) people")
                    }
                }
                
                Section {
                    Picker("", selection: $selectedTip) {
                        ForEach(tips, id: \.self){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("How much tip would you like to leave?")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
