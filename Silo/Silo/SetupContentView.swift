//
//  SetupContentView.swift
//  Silo
//

import SwiftUI

struct SetupContentView: View {
    @State private var currentPage = 0

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
                SetupPasscodeView {
                    goToNextPage()
                }

            default:
                MainContentView()
            }
        }
        .tracking(-1.5)
    }

    private func goToNextPage() {
        currentPage += 1
    }
}

#Preview {
    SetupContentView()
        .preferredColorScheme(.dark)
}
