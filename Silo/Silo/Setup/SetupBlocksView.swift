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
    @State private var showSelectApps = false
    @State private var showBlockList = false
    @State private var showButton = false

    var body: some View {
        VStack(spacing: 15) {
            Text("Let's get you set up.")
                .fontWeight(.semibold)
                .font(.title2)
                .foregroundStyle(.white)
                .opacity(showIntro ? 1 : 0)
                .offset(y: showIntro ? 0 : 8)

            Text("2. Blocks")
                .fontWeight(.semibold)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 8)
            
            Text("Pick as many apps as you’d like to block.")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 8)
                .foregroundStyle(.white.opacity(0.7))


            Button { } label: {
                HStack {
                    Text("Select Apps")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, minHeight: 70)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white.opacity(0.1))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                }
            }
            .buttonStyle(.plain)
            .padding(.top, 15)
            .opacity(showSelectApps ? 1 : 0)
            .offset(y: showSelectApps ? 0 : 8)

            
            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text("Block List")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
            
                Text("Select the apps you want to block.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
                Spacer()
            }
            .padding(.horizontal, -120)
            .padding(.vertical, 22)
            .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.1))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            }
            .padding(.vertical, 16)
            .opacity(showBlockList ? 1 : 0)
            .offset(y: showBlockList ? 0 : 8)
       
           
            
            HStack(spacing: 12) {
                MainButtonComponent(title: "Back", style: .outline, action: onBack)
                MainButtonComponent(title: "Continue", action: onContinue)
            }
            .opacity(showButton ? 1 : 0)
            .offset(y: showButton ? 0 : 8)
            
        }
        .padding(.horizontal, 48)
        .padding(.bottom, 32)
        .padding(.top, 32)
        .onAppear {
            let entranceAnimation = Animation.spring(response: 0.65, dampingFraction: 0.88)

            withAnimation(entranceAnimation.delay(0.25)) {
                showIntro = true
            }

            withAnimation(entranceAnimation.delay(0.42)) {
                showTitle = true
            }

            withAnimation(entranceAnimation.delay(0.59)) {
                showSelectApps = true
            }

            withAnimation(entranceAnimation.delay(0.76)) {
                showBlockList = true
            }

            withAnimation(entranceAnimation.delay(0.93)) {
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
