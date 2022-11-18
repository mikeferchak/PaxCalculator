//
//  ContentView.swift
//  Shared
//
//  Created by Mike Ferchak on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("viewMode") var viewMode: ViewMode = .direct
    @AppStorage("indexType") var indexType: IndexType = .solo
    
    var body: some View {
        NavigationView {
            VStack {
                if(viewMode == .direct) {
                    DirectView()
                } else {
                    ListView()
                }
            }
            .navigationTitle("Calculator")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: toggleViewMode) {
                        if(viewMode == .direct) {
                            Image(systemName: "arrow.up.arrow.down.circle")
                        } else {
                            Image(systemName: "list.bullet.circle")
                        }
                    }.foregroundColor(.secondary)
                }
                ToolbarItem(placement: .principal) {
                    Button(action: toggleIndex) {
                        ScootImage()
                        Text(indexType.rawValue).font(.headline)
                        if(indexType == .proSolo) {
                            ScootImage()
                        }
                    }.foregroundColor(.primary)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func toggleViewMode() {
        let _viewMode = viewMode
        if(_viewMode == .direct) {
            viewMode = .list
        } else {
            viewMode = .direct
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
