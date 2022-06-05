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
                   in: 0...500000,
                   step: 5000.0,
                   onEditingChanged: { _ in
                taxValue = sliderChanged()/12
            }).padding()
            Text("Tax value: ").padding()
            Text(String(taxValue)).padding()
        }
    }
    //tax slab for year 2021-2022
    func sliderChanged() -> Double{
        let yearlySalary = sliderValue * 12
        
        if(yearlySalary > 75000000){
            return calcTax(fixedAmmount: 21420000, difference: yearlySalary-75000000, perct: 35)
        }
        else if(yearlySalary > 50000000){
            return calcTax(fixedAmmount: 13295000, difference: yearlySalary-50000000, perct: 32.5)
        }
        else if(yearlySalary > 30000000){
            return calcTax(fixedAmmount: 7295000, difference: yearlySalary-30000000, perct: 30)
        }
        else if(yearlySalary > 12000000){
            return calcTax(fixedAmmount: 2345000, difference: yearlySalary-12000000, perct: 27.5)
        }
        else if(yearlySalary > 8000000){
            return calcTax(fixedAmmount: 1345000, difference: yearlySalary-8000000, perct: 25)
        }
        else if(yearlySalary > 5000000){
            return calcTax(fixedAmmount: 670000, difference: yearlySalary-5000000, perct: 22.5)
        }
        else if(yearlySalary > 3500000){
            return calcTax(fixedAmmount: 370000, difference: yearlySalary-3500000, perct: 20)
        }
        else if(yearlySalary > 2500000){
            return calcTax(fixedAmmount: 195000, difference: yearlySalary-2500000, perct: 17.5)
        }
        else if(yearlySalary > 1800000){
            return calcTax(fixedAmmount: 90000, difference: yearlySalary-1800000, perct: 15)
        }
        else if(yearlySalary > 1200000){
            return calcTax(fixedAmmount: 30000, difference: yearlySalary-1200000, perct: 10)
        }
        else if(yearlySalary > 600000){
            return calcTax(fixedAmmount: 0, difference: yearlySalary-600000, perct: 5)
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
