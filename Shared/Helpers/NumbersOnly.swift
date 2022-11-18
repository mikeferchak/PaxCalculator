//
//  NumbersOnly.swift
//  PAX calculator (iOS)
//
//  Created by Mike Ferchak on 1/11/22.
//

import Foundation

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
