//
//  SimplePickerView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/3/31.
//

import Foundation
import SwiftUI

public struct SimplePickerView: View {
    
    public init() {}
    
    let students = ["Harry", "Hermione", "Ron"]
    
    @State private var selectedStudent = "Harry"
    
    public var body: some View {
        VStack {
            Form {
                VStack(alignment: .center, spacing: 20) {
                    
                    VStack {
                        Picker("Select your student", selection: $selectedStudent) {
                            ForEach(students, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(.red.opacity(0.3))
                    }
                    VStack {
                        Picker("Select your student", selection: $selectedStudent) {
                            ForEach(students, id: \.self) {
                                Text($0)
                            }
                        }
                        .background(.yellow.opacity(0.3))
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 500)
        .background(.green.opacity(0.1))
       
    }
}
