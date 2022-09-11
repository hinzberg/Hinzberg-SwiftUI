//  HorizontalColorLabelDivider.swift
//  Created by Holger Hinzberg on 03.11.21.

import SwiftUI

@available(iOS 14, *)

public struct HorizontalColorLabelDivider: View {
    
    public var height: CGFloat = 1
    public var color: Color = .gray
    public var opacity: Double = 1
    public var text : String = "Label"
    public var horizontalPadding : CGFloat = 0
    public var font : Font = .footnote
    
    public init(height: CGFloat = 1, color: Color = .gray, opacity: Double = 1) {
        self.height = height
        self.color = color
        self.opacity = opacity
    }
    
    public var body: some View {
        HStack {
            HorizontalColorDivider(height: self.height, color: self.color, opacity: self.opacity)
                .padding(self.horizontalPadding)
            
            Text(self.text).foregroundColor(self.color).font(self.font)
            
            HorizontalColorDivider(height: self.height, color: self.color, opacity: self.opacity)
                .padding(self.horizontalPadding)
        }
    }
}

struct HorizontalColorLabelDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalColorLabelDivider()
    }
}
