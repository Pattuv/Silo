//
//  SetupPasscodeView.swift
//  Silo
//
//  Created by Gaurav Verma on 5/22/26.
//

import SwiftUI

struct SetupPasscodeView: View {
    let onContinue: () -> Void

    @State private var passcode = ""
    @FocusState private var isPasscodeFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 15) {
                Text("Let's get you set up.")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundStyle(.white)

                Text("1. Passcode")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                passcodeInput
            }

            Spacer()

            MainButtonComponent(title: "Continue", action: onContinue)
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
        .onAppear {
            isPasscodeFocused = true
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

        SetupPasscodeView {}
    }
    .tracking(-1.5)
    .preferredColorScheme(.dark)
}
