//
//  ComplicationProvider.swift
//  PAX calculator watchOS WatchKit Extension
//
//  Created by Mike Ferchak on 3/23/22.
//

import Foundation
import ClockKit
import SwiftUI

final class ComplicationProvider {
    func getGraphicCircular() -> CLKComplicationTemplate {
        return CLKComplicationTemplateGraphicCircularView(
            ComplicationGraphicCircular()
        )
    }
    
    func getCornerCircular() -> CLKComplicationTemplate {
        return CLKComplicationTemplateGraphicCornerCircularView(
            ComplicationGraphicCorner()
        )
    }
    
    func getGraphicCircularXL() -> CLKComplicationTemplate {
        return CLKComplicationTemplateGraphicExtraLargeCircularView(
            ComplicationGraphicCircularXL()
        )
    }
}
