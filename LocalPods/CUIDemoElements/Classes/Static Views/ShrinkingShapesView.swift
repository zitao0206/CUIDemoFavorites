//
//  ShrinkingShapesView.swift
//  AKOCommonToolsKit
//
//  Created by lizitao on 2023-09-24.
//

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in stride(from: 1, to: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            
            path.addRect(insetRect)
        }
        return path
    }
}

struct ShrinkingCircles: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in stride(from: 1, to: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            
            // 添加圆形
            let center = CGPoint(x: insetRect.midX, y: insetRect.midY)
            let radius = min(insetRect.width, insetRect.height) / 2
            let circleRect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
            path.addEllipse(in: circleRect)
        }
        return path
    }
}

struct ShrinkingStars: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in stride(from: 1, to: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            
            // 添加五角星形
            let star = starPath(in: insetRect)
            path.addPath(star)
        }
        return path
    }
    
    // 创建五角星形路径
    private func starPath(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let numberOfPoints = 5
        let angleIncrement = .pi * 2.0 / Double(numberOfPoints)
        var angle = -.pi / 2.0 // Start angle pointing upwards
        
        for _ in 0..<numberOfPoints * 2 {
            let point = CGPoint(x: center.x + cos(angle) * rect.width / 2, y: center.y + sin(angle) * rect.height / 2)
            if path.isEmpty {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
            angle += angleIncrement
        }
        path.closeSubpath()
        
        return path
    }
}

public struct ShrinkingShapesView: View {
    
    public init() {}
    
    public var body: some View {
        HStack {
            ShrinkingSquares()
                .stroke()
                .frame(width: 100, height: 100)
            ShrinkingCircles()
                .stroke()
                .frame(width: 100, height: 100)
            ShrinkingStars()
                .stroke()
                .frame(width: 100, height: 100)
        }
    }
}

struct ShrinkingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShrinkingShapesView()
    }
}
