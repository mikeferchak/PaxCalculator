//
//  ContentView.swift
//  PAX calculator (watchOS) WatchKit Extension
//
//  Created by Mike Ferchak on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .KM
    
    var body: some View {
        NavigationView {
            ListView()
        }
    }
    
    func toggleIndex() {
        let _indexType = indexType
        if(_indexType == .solo) {
            indexType = .proSolo
        } else {
            indexType = .solo
        }
        
        let selectedIndex = indexType == .solo ? solo2024 : proSolo2024
        let paxIndexValues = Dictionary(uniqueKeysWithValues: selectedIndex.map {key,value in value.map{$0}}.flatMap{$0})
        
        if(paxIndexValues[inputClass] == nil) {
            inputClass = .AM
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
