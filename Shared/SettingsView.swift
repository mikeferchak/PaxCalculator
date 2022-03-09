//
//  SettingsView.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("indexType") var indexType: IndexType = .solo
    @AppStorage("viewMode") var viewMode: ViewMode = .direct
    
    var body: some View {
        VStack {
            List {
                Picker("Index", selection: $indexType) {
                    ForEach(IndexType.allCases) { element in
                        Text(element.rawValue).tag(element)
                    }
                }
                Picker("View mode", selection: $viewMode) {
                    ForEach(ViewMode.allCases) { element in
                        let systemImage = element == .direct ? "arrow.up.arrow.down.circle" : "list.bullet.circle"
                        Label(element.rawValue, systemImage: systemImage).tag(element)
                    }
                }            }
        }.navigationTitle("Settings")
    }
}
