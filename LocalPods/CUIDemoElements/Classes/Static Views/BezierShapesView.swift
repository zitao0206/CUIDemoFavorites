//
//  BezierShapesView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-24.
//

import SwiftUI

extension UIBezierPath {
    
    static var logo: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.534, y: 0.5816))
        path.addCurve(to: CGPoint(x: 0.1877, y: 0.088), controlPoint1: CGPoint(x: 0.534, y: 0.5816), controlPoint2: CGPoint(x: 0.2529, y: 0.4205))
        path.addCurve(to: CGPoint(x: 0.9728, y: 0.8259), controlPoint1: CGPoint(x: 0.4922, y: 0.4949), controlPoint2: CGPoint(x: 1.0968, y: 0.4148))
        path.addCurve(to: CGPoint(x: 0.0397, y: 0.5431), controlPoint1: CGPoint(x: 0.7118, y: 0.5248), controlPoint2: CGPoint(x: 0.3329, y: 0.7442))
        path.addCurve(to: CGPoint(x: 0.6211, y: 0.0279), controlPoint1: CGPoint(x: 0.508, y: 1.1956), controlPoint2: CGPoint(x: 1.3042, y: 0.5345))
        path.addCurve(to: CGPoint(x: 0.6904, y: 0.3615), controlPoint1: CGPoint(x: 0.7282, y: 0.2481), controlPoint2: CGPoint(x: 0.6904, y: 0.3615))
        return path
    }
    
    // 新的星形路径
    static var star: UIBezierPath {
        let path = UIBezierPath()
        let center = CGPoint(x: 0.5, y: 0.5)
        let numberOfPoints = 5
        let numberOfLineSegments = numberOfPoints * 2
        let angle = CGFloat.pi / CGFloat(numberOfPoints)
        
        for i in 0..<numberOfLineSegments {
            let radius = (i % 2 == 0) ? 0.45 : 0.2
            let x = center.x + CGFloat(cos(angle * Double(i))) * CGFloat(radius)
            let y = center.y + CGFloat(sin(angle * Double(i))) * CGFloat(radius)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.close()
        return path
    }
    
    static var triangle: UIBezierPath {
            let path = UIBezierPath()
            let topPoint = CGPoint(x: 0.5, y: 0.1)
            let bottomLeftPoint = CGPoint(x: 0.2, y: 0.9)
            let bottomRightPoint = CGPoint(x: 0.8, y: 0.9)
            path.move(to: topPoint)
            path.addLine(to: bottomLeftPoint)
            path.addLine(to: bottomRightPoint)
            path.close()

            return path
        }

}
 


struct ScaledBezier: Shape {
    
    let bezierPath: UIBezierPath
    
    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)
        //Figure out how big the path we need to fill the available space without clipping
        let multiplier = min(rect.width, rect.height)
        //Create an affine transform using the same multiplier for both dimensions
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        //Apply the ratio and return the result
        return path.applying(transform)
    }
}

public struct BezierShapesView: View {
    
    public init() {}
    
    public var body: some View {
        HStack {
            Spacer()
            
            ScaledBezier(bezierPath: .star)
                .stroke(lineWidth: 2)
                .frame(width: 100, height: 100)
            
            Spacer()
            
            ScaledBezier(bezierPath: .logo)
                .stroke(lineWidth: 2)
                .frame(width: 100, height: 100)
            
            Spacer()
            
            ScaledBezier(bezierPath: .triangle)
                .stroke(lineWidth: 2)
                .frame(width: 100, height: 100)
        }
    }
}

struct BezierShapesView_Previews: PreviewProvider {
    static var previews: some View {
        BezierShapesView()
    }
}
