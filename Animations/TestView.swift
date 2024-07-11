//
//  TestView.swift
//  Animations
//
//  Created by Rodrigo on 10-07-24.
//

import SwiftUI

struct TestView: View {
    @State private var animationAmount = 1.0
    @State private var OverlayAmount = 1.0
    
    var body: some View {
        Spacer()
        
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
        
        Spacer()
        
        Button("overlay effect") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(OverlayAmount)
                .opacity(2 - OverlayAmount)
                .animation(
                    .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: OverlayAmount)
        )
        .onAppear {
            OverlayAmount = 2
        }
        
        Spacer()
    }
}

#Preview {
    TestView()
}
