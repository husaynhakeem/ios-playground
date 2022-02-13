//
//  ContentView.swift
//  TimeConversion
//
//  Created by Husayn Hakeem on 2/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = TimeUnit.hour
    @State private var outputUnit = TimeUnit.hour
    @State private var inputValue = 0.0
    @FocusState private var inputValueIsFocused: Bool
    
    private var convertedValue: Double {
        let inputConversion = unitConversions[inputUnit] ?? 1
        let outputConversion = unitConversions[outputUnit] ?? 1
        return inputValue * inputConversion * (1 / outputConversion)
    }
    
    /// Time units and their conversion to hours, which represents the base unit.
    private let unitConversions: [TimeUnit:Double] = [
        TimeUnit.second: 1.0/3600,
        TimeUnit.minute: 1.0/60,
        TimeUnit.hour: 1.0,
        TimeUnit.day: 24.0,
    ]
    
    /// Array of the units, sorted from smallest to greatest.
    /// This approach is used because  calling `units.keys` does not guarantee the returns keys are sorted.
    private let sortedUnits: [TimeUnit] = [.second, .minute, .hour, .day]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputValueIsFocused)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(sortedUnits, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                }
                
                Section {
                    Text(convertedValue, format: .number)
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(sortedUnits, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Time Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputValueIsFocused = false
                    }
                }
            }
        }
    }
    
    enum TimeUnit: String {
        case second = "Second"
        case minute = "Minute"
        case hour = "Hour"
        case day = "Day"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
