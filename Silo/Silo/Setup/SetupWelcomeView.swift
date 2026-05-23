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
                Text("Silo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(showGreeting ? 1 : 0)
                    .offset(y: showGreeting ? 0 : 8)

                Text("Let's get you set up.")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .opacity(showSubtitle ? 1 : 0)
                    .offset(y: showSubtitle ? 0 : 8)
            }

            Spacer()

            MainButtonComponent(title: "Yeah!", action: onContinue)
                .opacity(showButton ? 1 : 0)
                .offset(y: showButton ? 0 : 8)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
        .onAppear {
            let entranceAnimation = Animation.spring(response: 0.65, dampingFraction: 0.88)

            withAnimation(entranceAnimation.delay(0.25)) {
                showGreeting = true
            }

            withAnimation(entranceAnimation.delay(0.42)) {
                showSubtitle = true
            }

            withAnimation(entranceAnimation.delay(0.6)) {
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
