//
//  LaunchScreenManager.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import Foundation

enum LauncScreenPhase {
    case first
    case second
    case completed
}


final class LaunchScreenManager: ObservableObject {
    @Published private(set) var state: LauncScreenPhase = .first
    
    func dismiss() {
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .completed
        }
    }
}
