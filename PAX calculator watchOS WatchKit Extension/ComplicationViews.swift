//
//  ComplicationViews.swift
//  PAX calculator watchOS WatchKit Extension
//
//  Created by Mike Ferchak on 3/23/22.
//

import SwiftUI
import ClockKit

struct ConeCircularGraphic: View {
    var padding: EdgeInsets
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.background)
                .opacity(0.1)
            Image("PaxCone")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.orange)
                .complicationForeground()
                .padding(padding)
        }
    }
}

struct ComplicationGraphicCircular: View {
    var body: some View {
        ConeCircularGraphic(padding: EdgeInsets(top: 9, leading: 1, bottom: 14, trailing: 0))
    }
}

struct ComplicationGraphicCorner: View {
  var body: some View {
      ConeCircularGraphic(padding: EdgeInsets(top: 9, leading: 1, bottom: 12, trailing: 0))
  }
}

struct ComplicationGraphicCircularXL: View {
  var body: some View {
      ConeCircularGraphic(padding: EdgeInsets(top: 20, leading: 1, bottom: 30, trailing: 0))
  }
}

struct ComplicationGraphicBezel: View {
    var body: some View {
        ConeCircularGraphic(padding: EdgeInsets(top: 9, leading: 1, bottom: 12, trailing: 0))
    }
}

struct ComplicationViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicCircularView(
                ComplicationGraphicCircular()
            ).previewContext()
            
            CLKComplicationTemplateGraphicCornerCircularView(
                ComplicationGraphicCorner()
            ).previewContext()
            
            CLKComplicationTemplateGraphicExtraLargeCircularView(
                ComplicationGraphicCircularXL()
            ).previewContext()
        }
    }
}
