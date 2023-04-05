//
//  SimpleLineView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/4/5.
//

import SwiftUI

public enum PELineDirection {
    case horizontal, vertical
}

public struct PELine: Shape {
    public var direction: PELineDirection

    public init(direction: PELineDirection) {
        self.direction = direction
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        if direction == .horizontal {
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        } else {
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
        return path
    }
}

public struct SimpleLineView: View {
    
    public init() {}
    
    public var body: some View {
        if #available(iOS 15.0, *) {
            HStack(alignment: .center, spacing: 50) {
                HStack {
                    PELine(direction: .vertical)
                        .stroke(style: StrokeStyle(lineWidth: 5))
                        .foregroundColor(.blue)
                        .frame(width: 2.0, height: 180)
                }
                
                HStack {
                    PELine(direction: .vertical)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
                        .foregroundColor(.blue)
                        .frame(width: 2.0, height: 180)
                }
                
                HStack {
                    PELine(direction: .vertical)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3, 6]))
                        .foregroundColor(.blue)
                        .frame(width: 2.0, height: 180)
                }
                HStack {
                    PELine(direction: .vertical)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6, 6]))
                        .foregroundColor(.blue)
                        .frame(width: 2.0, height: 180)
                }
                HStack {
                    PELine(direction: .vertical)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [0.1, 0.1]))
                        .foregroundColor(.blue)
                        .frame(width: 2.0, height: 180)
                }
                HStack {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 1.0, height: 180)
                        .padding(.leading, 20)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 200)
            .background(.red.opacity(0.1))
        } else {
            // Fallback on earlier versions
        }

   }
}
