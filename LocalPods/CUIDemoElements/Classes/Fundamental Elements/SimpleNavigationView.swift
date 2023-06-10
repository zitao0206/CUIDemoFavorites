//
//  SimpleNavigationView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/6/10.
//

import SwiftUI

public struct SimpleNavigationView: View {
    public init() {}
    public var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, world!",
                               destination: MyOtherScreen())
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }


                ,
                trailing:
                    NavigationLink(
                    destination: MyOtherScreen(),
                    label: {
                        Image(systemName: "gear")
                    })
                    .accentColor(.red)
            )
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen!")
                //.navigationBarHidden(true)
            
            VStack {
                Button("BACK BUTTON") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Click here", destination: Text("3rd screen!"))
            }
        }
    }
}

struct SimpleNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleNavigationView()
    }
}
