//
//  MainButtonComponent.swift
//  Silo
//

import SwiftUI

struct MainButtonComponent: View {
    let title: String
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
                .foregroundStyle(.black)
                .padding(.horizontal, 24)
                .frame(minHeight: 48)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .sensoryFeedback(.impact(weight: .light), trigger: hapticTrigger)
    }
}
