//
//  SharedViews.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/14/22.
//

import Foundation
import SwiftUI




struct SharedViews {
    
    
    let mainBackground = LinearGradient(colors: [.blue, .cyan, .blue, .cyan], startPoint: .top, endPoint: .bottom)
    

}

struct DecimalFormattedText: View {
    
    let text: String
    let numOfDecimalPoints: Int
    var body: some View {
        Text(String(format: "%.\(numOfDecimalPoints)f", "\(text) ℃"))
    }
}

struct RoundedBackgroundModifier: ViewModifier {
    
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: radius))
}
}

struct IconModifier: ViewModifier {
    let diameter: CGFloat
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: diameter, height: diameter, alignment: .center)
            .clipShape(Circle())
    }
}

extension View {
    func iconed(_ diameter: CGFloat) -> some View {
        modifier(IconModifier(diameter: diameter))
    }
    
    func roundedBoxed(_ radius: CGFloat) -> some View {
        modifier(RoundedBackgroundModifier(radius: radius))
    }
}




