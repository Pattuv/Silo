//
//  SetupContentView.swift
//  Silo
//

import SwiftUI

struct SetupContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            SetupWelcomeView {}
        }
        .tracking(-1.5)
    }
}

#Preview {
    SetupContentView()
        .preferredColorScheme(.dark)
}
