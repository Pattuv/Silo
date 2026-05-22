//
//  SetupPasscodeView.swift
//  Silo
//
//  Created by Gaurav Verma on 5/22/26.
//

import SwiftUI

struct SetupPasscodeView: View {
    let onContinue: (String) -> Void

    @State private var passcode = ""
    @State private var showIntro = false
    @State private var showTitle = false
    @State private var showPasscodeInput = false
    @State private var showButton = false
    @FocusState private var isPasscodeFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 15) {
                Text("Let's get you set up.")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .opacity(showIntro ? 1 : 0)
                    .offset(y: showIntro ? 0 : 12)

                Text("1. Passcode")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .opacity(showTitle ? 1 : 0)
                    .offset(y: showTitle ? 0 : 12)

                passcodeInput
                    .opacity(showPasscodeInput ? 1 : 0)
                    .offset(y: showPasscodeInput ? 0 : 12)
                
                Text("Enter a unique, 4-digit PIN you can remember to get access to your blocks.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .opacity(showTitle ? 1 : 0)
                    .offset(y: showTitle ? 0 : 12)
                    .padding(.top, 16 )
                
            }

            Spacer()

            MainButtonComponent(title: "Continue") {
                guard passcode.count == 4 else { return }
                onContinue(passcode)
            }
            .opacity(showButton ? 1 : 0)
            .offset(y: showButton ? 0 : 12)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
        .onAppear {
            withAnimation(.easeOut(duration: 0.8).delay(0.4)) {
                showIntro = true
            }

            withAnimation(.easeOut(duration: 0.8).delay(0.8)) {
                showTitle = true
            }

            withAnimation(.easeOut(duration: 0.8).delay(1.2)) {
                showPasscodeInput = true
            }

            withAnimation(.easeOut(duration: 0.8).delay(1.6)) {
                showButton = true
            }
        }
    }

    private var passcodeInput: some View {
        ZStack {
            TextField("", text: $passcode)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isPasscodeFocused)
                .frame(width: 1, height: 1)
                .opacity(0.01)
                .onChange(of: passcode) { _, newValue in
                    passcode = String(newValue.filter(\.isNumber).prefix(4))
                }

            HStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { index in
                    passcodeBox(at: index)
                }
            }
        }
        .padding(.top, 18)
        .contentShape(Rectangle())
        .onTapGesture {
            isPasscodeFocused = true
        }
    }

    private func passcodeBox(at index: Int) -> some View {
        let digits = Array(passcode)
        let digit = index < digits.count ? String(digits[index]) : ""

        return Text(digit)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 52, height: 60)
            .background(.white.opacity(0.08))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white.opacity(index == digits.count ? 0.8 : 0.22), lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        SetupPasscodeView { _ in }
    }
    .tracking(-1.5)
    .preferredColorScheme(.dark)
}
