//
//  TimeText.swift
//  PAX calculator (iOS)
//
//  Created by Mike Ferchak on 1/10/22.
//

import SwiftUI

func timeText(_ time: Double) -> Text {
    return Text("\(time, specifier: "%.3f")")
}
