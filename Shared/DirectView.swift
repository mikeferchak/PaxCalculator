//
//  DirectView.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import SwiftUI
import Combine

struct DirectView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    @AppStorage("outputClass") var outputClass: SoloClass = .DS
    @AppStorage("inputTimeString") private var inputTimeString = ""
    
    @State var inputClassSelection: String = "SSC"
    @State var outputClassSelection: String = "DS"
    
    @FocusState private var focused: Bool
    
    var body: some View {
        let selectedIndex = indexType == .solo ? solo2024 : proSolo2024
        let paxIndexValues = Dictionary(uniqueKeysWithValues: selectedIndex.map {key,value in value.map{$0}}.flatMap{$0})
        
        let inputPax = paxIndexValues[inputClass] ?? 1.0
        let outputPax = paxIndexValues[outputClass] ?? 1.0
        
        let outputTime = inputTime * (inputPax / outputPax)
        let sortedClasses = SoloClass.allCases.filter({ paxIndexValues.keys.contains($0)}).sorted { $0.rawValue < $1.rawValue }
        
        let vTiny = verticalSizeClass == .compact
          
        VStack {
            Divider()
            Spacer()
            HStack {
                OutputTime(time: outputTime, selectedClass: outputClass, pax: outputPax, focused: $focused)
                if(vTiny) {
                    Menu {
                        Picker("output", selection: $outputClass) {
                            ForEach(sortedClasses, id: \.self) { sortedClass in
                                Text(sortedClass.rawValue).tag(sortedClass)
                            }
                        }
                        .onChange(of: outputClass) { selection in
                            self.outputClassSelection = selection.rawValue
                        }
                    }
                    label: {
                        Text(outputClass.rawValue)
                            .font(.system(size: 24, weight: .black))
                            .frame(width: 100, height: 50, alignment: .trailing)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                    .foregroundColor(.secondary)
                } else {
                    Picker("output", selection: $outputClass) {
                        ForEach(sortedClasses, id: \.self) { sortedClass in
                            Text(sortedClass.rawValue).tag(sortedClass)
                        }
                    }
                    .pickerStyle(.wheel)
                    .onAppear {
                        self.outputClassSelection = outputClass.rawValue
                    }
                    .onChange(of: outputClassSelection) { selection in
                        let selectedClass = SoloClass.allCases.filter {$0.rawValue == selection}.first ?? SoloClass.AS
                        self.outputClass = selectedClass
                    }
                    .frame(minWidth: 100, idealWidth: 100, maxWidth: 120, alignment: .center)
                }
            }
            .frame(minWidth: 0, idealWidth: 400, maxWidth: 600, minHeight: 0, idealHeight: 300, maxHeight: 300, alignment: .center)
            .onTapGesture {
                focused = false
            }

            DiffView(inputClassSelection: $inputClassSelection, outputClassSelection: $outputClassSelection, outputTime: outputTime)
            HStack {
                InputTime(focused: $focused, inputPax: inputPax)
                Spacer()
                if(vTiny) {
                    Menu {
                        Picker("input", selection: $inputClass) {
                            ForEach(sortedClasses, id: \.self) { sortedClass in
                                Text(sortedClass.rawValue).tag(sortedClass)
                            }
                        }
                        .onChange(of: inputClass) { selection in
                            self.inputClassSelection = selection.rawValue
                        }
                    }
                    label: {
                        Text(inputClass.rawValue)
                            .font(.system(size: 24, weight: .black))
                            .frame(width: 100, height: 50, alignment: .trailing)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                    .foregroundColor(.secondary)
                } else {
                    Picker("input", selection: $inputClassSelection) {
                        ForEach(sortedClasses, id: \.rawValue) { sortedClass in
                            Text(sortedClass.rawValue).tag(sortedClass)
                        }
                    }
                    .pickerStyle(.wheel)
                    .onAppear {
                        self.inputClassSelection = inputClass.rawValue
                    }
                    .onChange(of: inputClassSelection) { selection in
                        let selectedClass = SoloClass.allCases.filter {$0.rawValue == selection}.first ?? SoloClass.AS
                        self.inputClass = selectedClass
                    }
                    .frame(minWidth: 100, idealWidth: 100, maxWidth: 120, alignment: .center)
                }
            }
            .frame(minWidth: 0, idealWidth: 400, maxWidth: 600, minHeight: 0, idealHeight: 300, maxHeight: 300, alignment: .center)
            Spacer()
        }
    }
}

struct OutputTime: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var time: Double
    var selectedClass: SoloClass
    var pax: Double
    
    var focused: FocusState<Bool>.Binding
    
    var body: some View {
        let vTiny = verticalSizeClass == .compact
        VStack {
            HStack {
                Helpers.timeText(time)
                    .font(.system(size: vTiny && focused.wrappedValue ? 24 : 80))
                    .fontWeight(.bold)
                    .minimumScaleFactor(vTiny && focused.wrappedValue ? 1.0 : 0.1)
                    .lineLimit(1)
                Spacer()
            }
            if(verticalSizeClass != .compact) {
                HStack {
                    Text("\(selectedClass.rawValue)").foregroundColor(.secondary).padding(.leading, 5)
                    Helpers.timeText(pax)
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct InputTime: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    @AppStorage("inputTimeString") private var inputTimeString = ""
    
    var focused: FocusState<Bool>.Binding
    
    var inputPax: Double
    
    var body: some View {
        let vTiny = verticalSizeClass == .compact
        VStack {
            TextField("Input time", text: $inputTimeString)
                .font(.system(size: vTiny && focused.wrappedValue ? 24 : 80, weight: .bold))
                .minimumScaleFactor(vTiny && focused.wrappedValue ? 1.0 : 0.1)
                .lineLimit(1)
                .keyboardType(.decimalPad)
                .focused(focused)
                .onAppear {
                    self.inputTimeString = String(format: "%.3f", inputTime)
                }
                .onReceive(Just(inputTimeString)) { newValue in
                    let filtered = String(newValue.filter { "0123456789.".contains($0) }.prefix(7))
                    if filtered != newValue {
                        self.inputTimeString = filtered
                    }
                    let numeric = Double(self.inputTimeString)
                    if(numeric != nil) {
                        self.inputTime = numeric ?? 0
                    }
            }
            if(!vTiny) {
                HStack {
                    Text("\(inputClass.rawValue)").foregroundColor(.secondary).padding(.leading, 5)
                    Helpers.timeText(inputPax)
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct DiffView: View {
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    @AppStorage("outputClass") var outputClass: SoloClass = .DS
    @AppStorage("inputTimeString") private var inputTimeString = ""
    
    @Binding var inputClassSelection: String
    @Binding var outputClassSelection: String
    
    var outputTime: Double
    
    var body: some View {
        let difference = inputTime - outputTime
        
        let labelText = inputTimeString.contains("69.") ? "NICE" : String(format: "%.3f", abs(difference))
        
        ZStack {
            Divider()
            ZStack {
                Label(labelText, systemImage: difference == 0.0 ? "equal.circle.fill" : difference.sign == .minus ? "arrow.up.circle.fill" : "arrow.down.circle.fill")
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                    .onTapGesture(perform: {
                        let _outputClass = outputClass
                        let _inputClass = inputClass
                        let _outputTime = outputTime
                        let _inputClassSelection = inputClassSelection
                        let _outputClassSelection = outputClassSelection
                        inputTimeString = String(format: "%.3f", _outputTime)
                        inputTime = _outputTime
                        inputClass = _outputClass
                        outputClass = _inputClass
                        outputClassSelection = _inputClassSelection
                        inputClassSelection = _outputClassSelection
                    })
                    .dynamicTypeSize(inputTimeString == "69.420" ? .xLarge : .xSmall)
            }
            
        }.frame(minHeight: 0, idealHeight: 10, maxHeight: 10, alignment: .center)
    }
}
