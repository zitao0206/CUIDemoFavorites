//
//  CircularProgressView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-21.
//

import SwiftUI

public struct CircularProgressView: View {
    public init() {}
    
    @State private var currentProgress: CGFloat = 0.0 // Initialization progress value
    
    public var body: some View {
        Spacer()
        CircularProgressContentView(progress: $currentProgress)
          .padding()

        Slider(value: $currentProgress, in: 0...1) // External incoming progress value
          .padding()
        Spacer()
    }
}

struct CircularProgressContentView: View {
    
    @Binding var progress: CGFloat // Progress value, 0.0 represents 0%, 1.0 represents 100%

    var body: some View {
        VStack {
            Circle()
                .stroke(lineWidth: 10.0) // Set the width of the ring
                .fill(Color.gray.opacity(0.2)) // Set the color of the unfilled portion
                .frame(width: 100, height: 100) // Set the size of the circle
                .overlay(
                    Circle()
                        .trim(from: 0.0, to: progress) //Intercept a part of the circle based on the progress value
                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue) // Set the color of the filled part
                        .rotationEffect(.degrees(-90)) // Start filling from the top
//                        .animation(.easeInOut) // Add animation effects
    
                )
            
            Text("\(Int(progress * 100))%") // Show progress percentage
                .font(.headline)
                .padding(.top, 8)
                .foregroundColor(Color(hue: Double(progress), saturation: 1.0, brightness: 1.0)) // Use gradient colors
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
