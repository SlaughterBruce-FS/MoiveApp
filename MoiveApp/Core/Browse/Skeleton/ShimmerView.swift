//
//  ShimmerView.swift
//  MoiveApp
//
//  Created by J C on 11/11/23.
//

import SwiftUI

struct ShimmerView: View {
    @State private var gradientPosition = -200.0

    var body: some View {
        LinearGradient(
                    gradient: Gradient(colors: [Color.clear, Color.gray.opacity(0.5), Color.clear]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Rectangle()
                        .frame(width: 150, height: 250) // Adjust the size to match your skeleton view
                )
                .offset(x: gradientPosition, y: 0)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        gradientPosition = 200.0 // Move the gradient across the view
                    }
                }
    }
}

#Preview {
    ShimmerView()
}
