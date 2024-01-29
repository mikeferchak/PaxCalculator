//
//  ListView.swift
//  PAX calculator (watchOS) WatchKit Extension
//
//  Created by Mike Ferchak on 3/9/22.
//

import SwiftUI

struct ListView: View {
    var newInputTime: Double?
    
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .KM
    
    var body: some View {
        let selectedIndex = indexType == .solo ? solo2024 : proSolo2024
        let groups = selectedIndex.map {key, value in key}.sorted { $0.rawValue < $1.rawValue }
        
        let paxIndexValues = Dictionary(uniqueKeysWithValues: selectedIndex.map {key,value in value.compactMap{$0}}.flatMap{$0})
        let inputPax = paxIndexValues[inputClass] ?? 0.0
        
        List {
            ForEach(groups) {group in
                Section(header: Text(group.rawValue)) {
                    let groupItems = (selectedIndex[group] ?? [:]).compactMap {$0}.sorted { $0.key.rawValue < $1.key.rawValue }
                    ForEach(groupItems, id: \.key) {groupItem in
                        let outputPax = groupItem.value
                        let outputTime = inputTime * (inputPax / outputPax)
                        let className = String(groupItem.key.rawValue)
                        let isSelected = inputClass.rawValue == className
                        
                        ListRow(soloClass: groupItem.key, outputPax: outputPax, outputTime: outputTime, isSelected: isSelected)
                    }
                }
            }
            
            Section {
                Button(action: toggleIndex) {
                    HStack() {
                        Spacer()
                        ScootImage()
                        Text(indexType.rawValue).font(.headline)
                        if(indexType == .proSolo) {
                            ScootImage()
                        }
                        Spacer()
                    }
                }.foregroundColor(.primary)
            }
            
        }
        .navigationTitle(indexType.rawValue)
        .onAppear {
            if let newInputTime = newInputTime {
                inputTime = newInputTime
            }
        }
    }
    
    func toggleIndex() {
        let _indexType = indexType
        if(_indexType == .solo) {
            indexType = .proSolo
        } else {
            indexType = .solo
        }
    }
}

struct ScootImage: View {
    var body: some View {
        Image(systemName: "scooter").dynamicTypeSize(.xSmall)
            .foregroundColor(.secondary)
    }
}

struct ListRow: View {
    @FocusState private var isFocused: Bool
    
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    
    var soloClass: SoloClass
    var outputPax: Double
    var outputTime: Double
    var isSelected: Bool
    
    var body: some View {
        
        NavigationLink(destination: TimeInputView(selectedClass: soloClass, initialTime: outputTime)) {
            HStack {
                Text(soloClass.rawValue)
                    .dynamicTypeSize(.xLarge)
                    .font(Font.body.weight(.bold))
                    .foregroundColor(isSelected ? .primary : nil)
                    .lineLimit(1)

                Helpers.timeText(outputPax)
                    .dynamicTypeSize(.xSmall)
                    .foregroundColor(.secondary)
                Spacer()
                
                Helpers.timeText(outputTime)
                    .dynamicTypeSize(.xLarge)
                    .font(Font.body.weight(.bold))
                    .foregroundColor(isSelected ? .primary : nil)
                    .lineLimit(1)
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
                .environment(\.sizeCategory, .extraSmall)
            ListView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            ListView()
                .previewDevice("Apple Watch Series 5 - 40mm")
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
