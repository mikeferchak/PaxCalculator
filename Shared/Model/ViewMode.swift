//
//  ViewMode.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import Foundation

enum ViewMode: String, CaseIterable, Identifiable {
    case direct = "Direct", list = "List"
    
    var id: String {
        get {
            rawValue
        }
    }
}
