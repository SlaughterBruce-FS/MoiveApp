//
//  Divider.swift
//  MoiveApp
//
//  Created by J C on 11/11/23.
//

import SwiftUI

struct DividerGrade: View {
    var colors: [Color]
    var width: CGFloat = 2
    
    var body: some View {
        Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
            }
}

#Preview {
    DividerGrade(colors: [Color.red, Color.blue])
}
