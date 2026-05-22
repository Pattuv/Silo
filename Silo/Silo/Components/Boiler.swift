import SwiftUI

struct Boiler: View {
    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 0) {}
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        Boiler {}
    }
    .tracking(-1.5)
    .preferredColorScheme(.dark)
}
