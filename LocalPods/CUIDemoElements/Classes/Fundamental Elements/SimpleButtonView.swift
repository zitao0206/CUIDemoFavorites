//
//  SimpleButtonView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/4/6.
//

import SwiftUI

public struct SimpleButtonView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 50) {
                HStack {
                    Button("Button 1") {
                        print("Button 1 is clicked")
                    }
                    .background(.red.opacity(0.3))
                    
                    Button("Button 2", action: executeDelete)
                    .padding()
                    .background(.green.opacity(0.3))
                }
               
            }
                
            HStack(alignment: .center, spacing: 5) {
                HStack {
                    Button("Button 3") {
                        print("Button 3 is clicked")
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Button 4", role: .destructive) {
                        print("Button 4 is clicked")
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Button 5") {
                        print("Button 5 is clicked")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Button 6", role: .destructive) {
                        print("Button 6 is clicked")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                  
                        
                }
            }
            
            HStack {
                HStack {
                    Button {
                        print("Button 7 is clicked")
                    } label: {
                        Text("Button 7")
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    Button {
                        print("Button 8 is clicked")
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .background(.green.opacity(0.3))
                    
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Label("Button 9", systemImage: "pencil")
                    }
                    .background(.yellow.opacity(0.3))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 400)
        .background(.blue.opacity(0.1))

    }
    
    func executeDelete() {
        print("Button 2 is clicked")
    }
}

struct SimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButtonView()
    }
}
