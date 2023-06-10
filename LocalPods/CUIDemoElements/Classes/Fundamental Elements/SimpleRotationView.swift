//
//  SimpleRotationView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/6/9.
//

import SwiftUI

public struct SimpleRotationView: View {
    
    public init() {}
    
    @State var isAnimated: Bool = false
    
    public var body: some View {
        VStack {
            
            Button("Button") {
                isAnimated.toggle()
            }
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 50 : 150,
                    height: isAnimated ? 50 : 150)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 150 : 0)
                .animation(Animation.default.repeatForever(autoreverses: true), value: isAnimated)
            Spacer()
            
        }
    }
}

struct SimpleRotationView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleRotationView()
    }
}
