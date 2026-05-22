//
//  SetupWelcomeView.swift
//  Silo
//

import SwiftUI

struct SetupWelcomeView: View {
    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 5) {
                Text("👋 Hello!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                Text("Let's get you set up.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }

            Spacer()

            MainButtonComponent(title: "Yeah!", action: onContinue)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        SetupWelcomeView {}
    }
    .tracking(-1.5)
    .preferredColorScheme(.dark)
}
