//
//  SimpleTextEditorView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/6/10.
//

import SwiftUI

public struct SimpleTextEditorView: View {
    
    public init() {}
    
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    public var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 120)
                    //.foregroundColor(.red)
                    //.background(Color.red)
                    .colorMultiply(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(10)
                Button(action: {
                    savedText = textEditorText
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Text(savedText)
                
                Spacer()
            }
            .padding()
            //.background(Color.green)
            .navigationTitle("Simple TextEditor!")
        }
    }
}

struct SimpleTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextEditorView()
    }
}
