//
//  SimpleShapeView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/5/1.
//

import SwiftUI

public struct SimpleShapeView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                Circle()
                    //.fill(Color.green)
                    //.foregroundColor(.pink)
                    //.stroke()
                    //.stroke(Color.red)
                    //.stroke(Color.blue, lineWidth: 30)
                    //.stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [10]))
                    //.stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
                    //.trim(from: 0.2, to: 1.0)
                    .stroke(Color.purple, lineWidth: 5)
                    .frame(width: 50, height: 100)
                    .padding()
                
                Ellipse()
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
                    .frame(width: 50, height: 100)
                    .padding()
                
                Capsule(style: .circular)
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: 50, height: 100)
                    .padding()
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 100)
                
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 200)
        }
        .background(.blue.opacity(0.1))
    }
}

struct SimpleShapeView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleShapeView()
    }
}
