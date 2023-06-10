//
//  SimpleTransitionView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/6/9.
//

import SwiftUI

public struct SimpleTransitionView: View {
    
    public init() {}
    
    @State var showView: Bool = false
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    withAnimation(.easeInOut) { // <- animation here
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.3))
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                    
                    Text("Yout toast here...")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .bottom),
                    removal: AnyTransition.opacity.animation(.easeInOut)
                ))
                    
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SimpleTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTransitionView()
    }
}
