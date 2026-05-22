//
//  SetupPasscodeView.swift
//  Silo
//
//  Created by Gaurav Verma on 5/22/26.
//

import SwiftUI

struct SetupPasscodeView: View {
    let onContinue: () -> Void

    var body: some View {
        EmptyView()
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
