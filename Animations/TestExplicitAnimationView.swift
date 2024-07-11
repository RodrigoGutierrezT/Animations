//
//  TestExplicitAnimationView.swift
//  Animations
//
//  Created by Rodrigo on 11-07-24.
//

import SwiftUI

struct TestExplicitAnimationView: View {
    @State var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap Me!") {
            withAnimation(.spring(duration: 0.8, bounce: 0.3)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount),axis: (x: 0, y: 0, z: 1))
        
    }
}

#Preview {
    TestExplicitAnimationView()
}
