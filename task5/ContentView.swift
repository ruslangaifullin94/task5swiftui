//
//  ContentView.swift
//  task5
//
//  Created by Руслан Гайфуллин on 12.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset = CGSize.zero
    private let height = UIScreen.main.bounds.height / 4
    private let width = UIScreen.main.bounds.width
    
    var gesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    offset = .zero
                }
            }
    }
    
    var rectangle: some View {
        Rectangle()
            .foregroundColor(.white)
            .blendMode(.difference)
            .overlay(Rectangle().blendMode(.hue))
            .overlay(Rectangle().foregroundStyle(.white).blendMode(.overlay))
            .overlay(Rectangle().foregroundStyle(.black).blendMode(.overlay))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                ))
            .frame(width: 150, height: 150)
            .offset(offset)
            .gesture(gesture)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundStyle(.white)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundStyle(.pink)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundStyle(.yellow)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundStyle(.black)
            }
            rectangle
        }
    }
}

#Preview {
    ContentView()
}
