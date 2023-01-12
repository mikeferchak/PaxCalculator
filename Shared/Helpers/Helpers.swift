//
//  Helpers.swift
//  PAX calculator (iOS)
//
//  Created by Mike Ferchak on 1/11/23.
//

import SwiftUI

class Helpers {
    static func timeText(_ time: Double) -> Text {
        return Text("\(time, specifier: "%.3f")")
    }
}
