//
//  LineChartView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-24.
//

import SwiftUI

struct LineChartContentView: View {
     let dataPoints: [CGFloat] // data points
     let maxValue: CGFloat //The maximum value in the data
     let lineColor: Color //Color of polyline
     let gridColor: Color // Color of grid lines

     var body: some View {
         GeometryReader { geometry in
             let stepX = geometry.size.width / CGFloat(dataPoints.count - 1) // Declare stepX as a local variable
             ZStack {
                 // draw grid lines
                 Path { path in
                     for i in 0..<dataPoints.count {
                         let x = stepX * CGFloat(i)
                         path.move(to: CGPoint(x: x, y: 0))
                         path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                     }
                 }
                 .stroke(gridColor, lineWidth: 1)
                
                 // draw polyline
                 Path { path in
                     for i in 0..<dataPoints.count {
                         let x = stepX * CGFloat(i)
                         let y = geometry.size.height - (dataPoints[i] / maxValue) * geometry.size.height
                         if i == 0 {
                             path.move(to: CGPoint(x: x, y: y))
                         } else {
                             path.addLine(to: CGPoint(x: x, y: y))
                         }
                     }
                 }
                 .stroke(lineColor, lineWidth: 2)
                
                 // Draw axes and labels
                 Path { path in
                     // x-axis
                     path.move(to: CGPoint(x: 0, y: geometry.size.height))
                     path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                    
                     // y-axis
                     path.move(to: CGPoint(x: 0, y: 0))
                     path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
                 }
                 .stroke(Color.black, lineWidth: 2)
                
                 //Add x-axis labels
                 ForEach(0..<dataPoints.count, id: \.self) { i in
                     let x = stepX * CGFloat(i)
                     Text("\(i)")
                         .font(.footnote)
                         .position(x: x, y: geometry.size.height + 10)
                 }
                
                 //Add y-axis label
                 Text("0")
                     .font(.footnote)
                     .position(x: -10, y: geometry.size.height)
                
                 Text("\(Int(maxValue))")
                     .font(.footnote)
                     .position(x: -10, y: 0)
             }
         }
     }
}

public struct LineChartView: View {
    
    public init() {}
    
    public var body: some View {
        LineChartContentView (
            dataPoints: [0.2, 0.4, 0.7, 0.5, 0.9, 0.6],
            maxValue: 1.0,
            lineColor: Color.blue,
            gridColor: Color.gray
        )
        .frame(width: 200, height: 133)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
