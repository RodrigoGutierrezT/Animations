//
//  TestTransitionView.swift
//  Animations
//
//  Created by Rodrigo on 12-07-24.
//

import SwiftUI

struct TestTransitionView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        Button("Tap me") {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        if isShowingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
}

#Preview {
    TestTransitionView()
}
