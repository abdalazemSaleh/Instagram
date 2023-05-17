//
//  UserStackView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-12.
//

import SwiftUI

struct UserStackView: View {
    var body: some View {
        VStack {
            Text("3")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("state")
                .font(.footnote)
        }
    }
}

struct UserStackView_Previews: PreviewProvider {
    static var previews: some View {
        UserStackView()
    }
}
