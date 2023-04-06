//
//  SimpleGradientView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/4/6.
//

import SwiftUI

public struct SimpleGradientView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                LinearGradient(gradient: Gradient(stops: [
                     Gradient.Stop(color: .white, location: 0.45),
                     Gradient.Stop(color: .black, location: 0.55),
                 ]), startPoint: .top, endPoint: .bottom)
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)

                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 180)
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 400)
        .background(.blue.opacity(0.1))
    }
}

 
