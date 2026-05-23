//
//  SetupContentView.swift
//  Silo
//

import SwiftUI

struct SetupContentView: View {
    @State private var currentPage = 0
    @AppStorage("userPasscode") private var userPasscode = ""


    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            switch currentPage {
            case 0:
                SetupWelcomeView {
                    goToNextPage()
                }

            case 1:
                SetupPasscodeView { passcode in
                    userPasscode = passcode
                    goToNextPage()
                }
                
            case 2:
                SetupBlocksView(
                    onBack: goToPreviousPage,
                    onContinue: goToNextPage
                )
                

            default:
                MainContentView()
            }
        }
        .tracking(-1.5)
    }

    private func goToNextPage() {
        currentPage += 1
    }

    private func goToPreviousPage() {
        currentPage -= 1
    }
}

#Preview {
    SetupContentView()
        .preferredColorScheme(.dark)
}
