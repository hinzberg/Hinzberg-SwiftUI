//  ColorHorizontalDivider.swift
//  Created by Holger Hinzberg on 03.11.21.

import SwiftUI
public struct HorizontalColorDivider: View {
    
    public var height: CGFloat = 1
    public var color: Color = .gray
    public var opacity: Double = 1
    
    public init(height: CGFloat = 1, color: Color = .gray, opacity: Double = 1) {
        self.height = height
        self.color = color
        self.opacity = opacity
    }
    
    public var body: some View {
        Group {
            Rectangle()
        }
        #if os(iOS)
        .frame(height: self.height / UIScreen.main.scale)
        #endif
        .foregroundColor(self.color)
        .opacity(self.opacity)
    }
}

struct HorizontalColorDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalColorDivider()
    }
}
