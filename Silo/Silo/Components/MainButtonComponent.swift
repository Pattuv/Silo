//
//  MainButtonComponent.swift
//  Silo
//

import SwiftUI

struct MainButtonComponent: View {
    enum Style {
        case filled
        case outline
    }

    let title: String
    var style: Style = .filled
    let action: () -> Void

    @State private var hapticTrigger = false

    var body: some View {
        Button {
            hapticTrigger.toggle()
            action()
        } label: {
            Text(title)
                .font(.headline)
                .tracking(-1)
                .foregroundStyle(style == .filled ? .black : .white)
                .padding(.horizontal, 24)
                .frame(minHeight: 48)
                .background {
                    if style == .filled {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                    }
                }
                .overlay {
                    if style == .outline {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    }
                }
        }
        .sensoryFeedback(.impact(weight: .light), trigger: hapticTrigger)
    }
}
