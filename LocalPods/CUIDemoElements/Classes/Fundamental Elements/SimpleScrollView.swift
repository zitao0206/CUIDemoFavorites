//
//  SimpleScrollView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/6/3.
//

import SwiftUI

public struct SimpleScrollView: View {
    
    public init() {}
    
    public var body: some View {
        
        //ScrollView 1
//        ScrollView {
//            VStack {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(height: 300)
//                }
//            }
//        }
        
        
        //ScrollView 2
        
//        ScrollView(.vertical, showsIndicators: true, content: {
//            VStack {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(height: 300)
//                }
//            }
//        })
        
        //ScrollView 3
        
//        ScrollView(.horizontal, showsIndicators: true, content: {
//            VStack {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(height: 300)
//                }
//            }
//        })
        
        //ScrollView 4
        ScrollView {
           LazyVStack {
               ForEach(0..<100) { index in
                   ScrollView(.horizontal, showsIndicators: false, content: {
                       LazyHStack {
                           ForEach(0..<20) { index in
                               RoundedRectangle(cornerRadius: 25.0)
                                   .fill(Color.white)
                                   .frame(width: 200, height: 50)
                                   .shadow(radius: 10)
                                   .padding()
                           }
                       }
                   })
               }
           }
        }
        .background(.blue.opacity(0.1))
    }
}

struct SimpleScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleScrollView()
    }
}
