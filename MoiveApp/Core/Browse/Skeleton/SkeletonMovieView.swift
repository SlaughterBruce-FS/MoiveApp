//
//  SkeletonMovieView.swift
//  MoiveApp
//
//  Created by J C on 11/11/23.
//

import SwiftUI

struct SkeletonMovieView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
                    .frame(width: 150, height: 250)
                   .redacted(reason: .placeholder)
                   .overlay(ShimmerView())
                   .clipShape(Rectangle())
    }
}

#Preview {
    SkeletonMovieView()
}
