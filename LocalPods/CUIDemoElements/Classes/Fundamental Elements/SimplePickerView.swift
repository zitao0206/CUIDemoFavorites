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
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}
