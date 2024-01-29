//
//  ListView.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import SwiftUI
import Combine


struct ListView: View {
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    
    var body: some View {
        let selectedIndex = indexType == .solo ? solo2024 : proSolo2024
        let groups = selectedIndex.map {key, value in key}.sorted { $0.rawValue < $1.rawValue }
        
        let paxIndexValues = Dictionary(uniqueKeysWithValues: selectedIndex.map {key,value in value.compactMap{$0}}.flatMap{$0})
        let inputPax = paxIndexValues[inputClass] ?? 1.0
        
        
        List(groups) { group in
            Section(group.rawValue) {
                let groupItems = (selectedIndex[group] ?? [:]).compactMap {$0}.sorted { $0.key.rawValue < $1.key.rawValue }
                ForEach(groupItems, id: \.key) {groupItem in
                    let outputPax = groupItem.value
                    let outputTime = inputTime * (inputPax / outputPax)
                    let className = String(groupItem.key.rawValue)
                    let isSelected = inputClass.rawValue == className
                    
                    ListRow(className: className, outputPax: outputPax, outputTime: outputTime, isSelected: isSelected).listRowBackground(isSelected ? Color.secondary.opacity(0.05) : nil)
                }
            }
        }.listStyle(.plain)
    }
}

struct ListRow: View {
    @FocusState private var isFocused: Bool
    
    @AppStorage("inputTimeString") private var inputTimeString = ""
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    
    var className: String
    var outputPax: Double
    var outputTime: Double
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(className)
                .fontWeight(isSelected ? .black : .bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)

            Helpers.timeText(outputPax)
                .dynamicTypeSize(.small)
                .foregroundColor(.secondary)
            Spacer()
            
            if(isSelected) {
                TextField("Input time", text: $inputTimeString)
                    .focused($isFocused)
                    .lineLimit(1)
                    .keyboardType(.decimalPad)
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
                    .font(Font.body.weight(.black))
                    .multilineTextAlignment(.trailing)
            } else {
                Helpers.timeText(outputTime).font(Font.body.weight(.bold))
            }
        }
        .onTapGesture {
            self.isFocused = true
            let selectedClass = SoloClass.allCases.filter {$0.rawValue == className}.first ?? SoloClass.AS
            self.inputClass = selectedClass
            self.inputTime = outputTime
            self.inputTimeString = String(format: "%.3f", outputTime)
        }
    }
}
