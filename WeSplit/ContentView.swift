//
//  ContentView.swift
//  WeSplit
//
//  Created by Marvin John on 03.08.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount: Double = 0
    @State private var selectedPeople = 2
    @State private var selectedTip = 10
    @State private var totalBill = 0.00
    @State private var amountPerPerson = 0.00
    
    var people = [2, 3, 4, 5]
    var tips: [Int] = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Bill Amount", value: $billAmount, format: .number)
                
                Picker("Number of people", selection: $selectedPeople) {
                    ForEach(people, id: \.self){
                        Text("\($0) people")
                    }
                }
                
                Section {
                    Picker("Select tip", selection: $selectedTip) {
                        ForEach(tips, id: \.self){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("How much tip would you like to leave?")
                }
               
                
                
                Section(header: Text("Total Bill")) {
                    TextField("$\(totalBill)", value: $totalBill, format: .number)
                        .disabled(true)
                }
                
                
                Section(header: Text("Amount per Person")) {
                    TextField("$\(amountPerPerson)", value: $amountPerPerson, format: .number)
                        .disabled(true)
                }
            }
            .navigationTitle("WeSplit")
            .onSubmit {
               totalBill = getTotalBill(amount: billAmount, percentage: Double(selectedTip))
                amountPerPerson = getAmountPerPerson(totalBill: totalBill)
            }
        }
    }
    
    func getTotalBill(amount: Double, percentage: Double) -> Double{
        return (amount * percentage) / 100
    }
    
    func getAmountPerPerson(totalBill: Double) -> Double{
        totalBill / Double(selectedPeople)
    }
}

#Preview {
    ContentView()
}
