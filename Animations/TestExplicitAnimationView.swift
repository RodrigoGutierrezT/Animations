//
//  TestExplicitAnimationView.swift
//  Animations
//
//  Created by Rodrigo on 11-07-24.
//

import SwiftUI

struct TestExplicitAnimationView: View {
    @State var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        Spacer()
        
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
        
        Spacer()
        
        // animation Stack
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(nil, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        
        Spacer()
        
    }
}

#Preview {
    TestExplicitAnimationView()
}
