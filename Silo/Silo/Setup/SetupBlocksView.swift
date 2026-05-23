//
//  SetupBlocksView.swift
//  Silo
//
//  Created by Gaurav Verma on 5/22/26.
//

import SwiftUI

struct SetupBlocksView: View {
    let onBack: () -> Void
    let onContinue: () -> Void
    
    @State private var showTitle = false
    @State private var showIntro = false
    @State private var showButton = false

    var body: some View {
        VStack(spacing: 15) {
            Text("Let's get you set up.")
                .fontWeight(.semibold)
                .font(.title2)
                .foregroundStyle(.white)
                .opacity(showIntro ? 1 : 0)
                .offset(y: showIntro ? 0 : 12)

            Text("2. Blocks")
                .fontWeight(.semibold)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 12)
            
            Text("Pick as many apps as you’d like to block.")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 12)
                .foregroundStyle(.white.opacity(0.7))

            
            Spacer()
            
            HStack(spacing: 12) {
                MainButtonComponent(title: "Back", style: .outline, action: onBack)
                MainButtonComponent(title: "Continue", action: onContinue)
            }
            .opacity(showButton ? 1 : 0)
            .offset(y: showButton ? 0 : 12)
            
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
        .padding(.top, 32)
        .onAppear {
            withAnimation(.easeOut(duration: 0.8).delay(0)) {
                showIntro = true
            }

            withAnimation(.easeOut(duration: 0.8).delay(0.4)) {
                showTitle = true
            }
            
            withAnimation(.easeOut(duration: 0.8).delay(0.8)) {
                showButton = true
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        SetupBlocksView(onBack: {}, onContinue: {})
    }
    .tracking(-1.5)
    .preferredColorScheme(.dark)
}
