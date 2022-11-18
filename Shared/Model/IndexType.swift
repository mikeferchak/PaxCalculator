//
//  IndexType.swift
//  PAX calculator
//
//  Created by Mike Ferchak on 1/9/22.
//

import Foundation

enum IndexType: String, CaseIterable, Identifiable {
    case solo = "Solo", proSolo = "ProSolo"
    
    var id: String {
        get {
            rawValue
        }
    }
}
