//
//  TestGesturesView.swift
//  Animations
//
//  Created by Rodrigo on 12-07-24.
//

import SwiftUI

struct TestGesturesView: View {
    let letters = Array("Hello SwiftUI")
    
    @State private var dragAmount = CGSize.zero
    @State private var textDragAmount = CGSize.zero
    @State private var enabled = false
    
    
    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
        
        Spacer()
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(enabled ? .blue : .red)
                    .offset(textDragAmount)
                    .animation(.linear.delay(Double(num)/20), value: textDragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { textDragAmount = $0.translation }
                .onEnded { _ in
                    textDragAmount = .zero
                    enabled.toggle()
                }
        )
        
        Spacer()
    }
}

#Preview {
    TestGesturesView()
}
