//
//  CustomViewModifiers.swift
//  TheFakeFactoty_SwiftUI
//
//  Created by lizbeth.alejandro on 31/07/24.
//

import SwiftUI

extension View {
    func roundedButtonStyle() -> some View {
        modifier(RoundedButton())
    }
}

struct RoundedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 96, height: 8)
            .foregroundStyle(.customPurple)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.customGray)
            )
    }
}

