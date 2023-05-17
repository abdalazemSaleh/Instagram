//
//  GFTextFiledModifier.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct GFTextFiledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}
