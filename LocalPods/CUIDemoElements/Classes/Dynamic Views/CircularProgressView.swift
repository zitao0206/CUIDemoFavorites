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


struct CircularProgressView2: View {
    @State var progress = 0.33
    let ringDiameter = 300.0
    
    private var rotationAngle: Angle {
        return Angle(degrees: (360.0 * progress))
    }
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.04, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9), lineWidth: 20.0)
                        .overlay() {
                            Text("\(progress, specifier: "%.1f")")
                                .font(.system(size: 78, weight: .bold, design:.rounded))
                        }
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.8),
                                style: StrokeStyle(lineWidth: 20.0, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 3)
                        .frame(width: 21, height: 21)
                        .offset(y: -ringDiameter / 2.0)
                        .rotationEffect(rotationAngle)
                }
                .frame(width: ringDiameter, height: ringDiameter)
                
                
                VStack {
                    Text("Progress: \(progress, specifier: "%.1f")")
                    Slider(value: $progress,
                           in: 0...1,
                           minimumValueLabel: Text("0.0"),
                           maximumValueLabel: Text("1.0")
                    ) {}
                }
                .padding(.vertical, 40)
                
                Spacer()
            }
            .padding(.vertical, 40)
            .padding()
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
