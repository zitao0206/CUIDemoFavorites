//
//  WaterRippleView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-23.
//

import SwiftUI

public struct WaterRippleView: View {
    
    @State private var animateActive = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Image(systemName: "antenna.radiowaves.left.and.right.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)

            Circle()
                .stroke()
                .frame(width: 340, height: 340)
                .foregroundColor(.blue)
                .scaleEffect(animateActive ? 1 : 0.3)
                .opacity(animateActive ? 0 : 1)

            Circle()
                .stroke()
                .frame(width: 240, height: 240)
                .foregroundColor(.blue)
                .scaleEffect(animateActive ? 1 : 0.3)
                .opacity(animateActive ? 0 : 1)

            Circle()
                .stroke()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .scaleEffect(animateActive ? 1 : 0.3)
                .opacity(animateActive ? 0 : 1)
            
        }.onAppear {
            withAnimation(.easeIn(duration: 3).repeatForever(autoreverses: false)){
                self.animateActive.toggle()
            }
        }

    }
}

struct WaterRippleView_Previews: PreviewProvider {
    static var previews: some View {
        WaterRippleView()
    }
}
