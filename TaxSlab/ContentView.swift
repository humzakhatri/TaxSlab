//
//  ContentView.swift
//  TaxSlab
//
//  Created by Humza on 05/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValue: Double = 0
    @State var color: Color = .red
    @State var taxValue: Double = 0
    var body: some View {
        VStack {
            Text(
                String(format: "%.0f", sliderValue)
            ).foregroundColor(color).padding()
            Slider(value: $sliderValue,
                   in: 0...1000000,
                   step: 5000.0,
                   onEditingChanged: { _ in
                taxValue = sliderChanged()/12
            }).padding()
            Text("Tax value: ").padding()
            Text(String(taxValue)).padding()
        }
    }
    private struct TaxSlab{
        let taxPercentage: Double
        let yearlySalary: Double
        let fixedTax: Double
    }

    //tax slabs for 2021-2022
    private let TaxSlabs: [TaxSlab] = [
        TaxSlab(taxPercentage: 35, yearlySalary: 75000000, fixedTax: 21420000),
        TaxSlab(taxPercentage: 32.5, yearlySalary: 50000000, fixedTax: 13295000),
        TaxSlab(taxPercentage: 30, yearlySalary: 30000000, fixedTax: 7295000),
        TaxSlab(taxPercentage: 27.5, yearlySalary: 12000000, fixedTax: 2345000),
        TaxSlab(taxPercentage: 25, yearlySalary: 8000000, fixedTax: 1345000),
        TaxSlab(taxPercentage: 22.5, yearlySalary: 5000000, fixedTax: 670000),
        TaxSlab(taxPercentage: 20, yearlySalary: 3500000, fixedTax: 370000),
        TaxSlab(taxPercentage: 17.5, yearlySalary: 2500000, fixedTax: 195000),
        TaxSlab(taxPercentage: 15, yearlySalary: 1800000, fixedTax: 90000),
        TaxSlab(taxPercentage: 10, yearlySalary: 1200000, fixedTax: 30000),
        TaxSlab(taxPercentage: 5, yearlySalary: 600000, fixedTax: 0)
    ]
    
    func sliderChanged() -> Double{
        let yearlySalary = sliderValue * 12
        var i: Int = 0
        while(i < TaxSlabs.count){
            if(yearlySalary > TaxSlabs[i].yearlySalary){
                return calcTax(fixedAmmount: TaxSlabs[i].fixedTax, difference: yearlySalary-TaxSlabs[i].yearlySalary, perct: TaxSlabs[i].taxPercentage)
            }
            i = i+1
        }
        return 0
    }
    
    func calcTax(fixedAmmount: Double, difference: Double, perct: Double) -> Double{
        let variableTax = (difference/100)*perct;
        return variableTax + fixedAmmount
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
