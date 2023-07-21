//
//  TimeView.swift
//  Units
//
//  Created by J. Daniel F. Ruano on 7/21/23.
//

import SwiftUI

struct TimeView: View {
    let units: [UnitDuration] = [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    
    
    @State private var fromUnit = 0
    @State private var toUnit = 0
    @State private var fromValue = 0.0
    @State private var toValue = 0.0
    
    @FocusState private var fromIsFocused: Bool
    @FocusState private var toIsFocused: Bool
    
    func convertValue(value: Double, from: UnitDuration, to: UnitDuration) -> Double {
        let current = Measurement(value: value, unit: from)
        let converted = current.converted(to: to)
        return converted.value
    }
    
    func labelForOption(index: Int) -> String {
        let option = units[index]
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        return formatter.string(from: option)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("From", value: Binding(
                            get: { self.fromValue },
                            set: {
                                if (self.fromValue != $0) {
                                    toValue = convertValue(value: $0, from: units[fromUnit], to: units[toUnit])
                                }
                                self.fromValue = $0
                            }
                        ), format: .number).keyboardType(.decimalPad).focused($fromIsFocused)
                        Divider()
                        Picker("", selection: $fromUnit) {
                            ForEach(0 ..< units.count, id:\.self) {
                                Text(labelForOption(index: $0))
                            }
                        }
                        .onChange(of: fromUnit) {newValue in
                            fromIsFocused = false
                            toIsFocused = false
                            toValue = convertValue(value: fromValue, from: units[newValue], to: units[toUnit])
                            
                        }
                        .frame(maxWidth: 80)
                    }
                } header: {
                    Text("From")
                }
                Section {
                    HStack {
                        TextField("From", value: Binding(
                            get: { self.toValue },
                            set: {
                                if (self.toValue != $0) {
                                    fromValue = convertValue(value: $0, from: units[toUnit], to: units[fromUnit])
                                }
                                self.toValue = $0
                            }
                        ), format: .number).keyboardType(.decimalPad).focused($toIsFocused)
                        Divider()
                        Picker("", selection: $toUnit) {
                            ForEach(0 ..< units.count, id:\.self) {
                                Text(labelForOption(index: $0))
                            }
                        }
                        .onChange(of: toUnit) {newValue in
                            fromIsFocused = false
                            toIsFocused = false
                            toValue = convertValue(value: fromValue, from: units[fromUnit], to: units[newValue])
                        }
                        .frame(maxWidth: 80)
                    }
                } header: {
                    Text("To")
                }
            }
            .navigationTitle("Time")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        fromIsFocused = false
                        toIsFocused = false
                    }
                }
            }
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
