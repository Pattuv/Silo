//
//  SetupWelcomeView.swift
//  Silo
//

import SwiftUI

struct SetupWelcomeView: View {
    let onContinue: () -> Void

    @State private var showGreeting = false
    @State private var showSubtitle = false
    @State private var showButton = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 5) {
                Text("👋 Hello!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(showGreeting ? 1 : 0)
                    .offset(y: showGreeting ? 0 : 50)

                Text("Let's get you set up.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(showSubtitle ? 1 : 0)
                    .offset(y: showSubtitle ? 0 : 50)
            }

            Spacer()

            MainButtonComponent(title: "Yeah!", action: onContinue)
                .opacity(showButton ? 1 : 0)
                .offset(y: showButton ? 0 : 12)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6).delay(0.7)) {
                showGreeting = true
            }

            withAnimation(.easeOut(duration: 0.6).delay(1.7)) {
                showSubtitle = true
            }

            withAnimation(.easeOut(duration: 0.8).delay(2.1)) {
                showButton = true
            }
        }
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
