//
//  SimpleActionSheetView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/6/10.
//

import SwiftUI

public struct SimpleActionSheetView: View {
    
    public init() {}
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    public var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@mayun")
                Spacer()
                Button(action: {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                    
                })
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(
                    Image("cui_mayun")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                )
            
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // add code to share post
        }
//        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
//            // add code to report this post
//        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // add code to delete this post
        }
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What woud you like to do?")
        
        switch actionSheetOption {
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, cancelButton])
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, deleteButton, cancelButton])
        }
        
        
        //return ActionSheet(title: Text("This is the title!"))
        
//        let button1: ActionSheet.Button = .default(Text("DEFAULT"))
//        let button2: ActionSheet.Button = .destructive(Text("DESTRUCTIVE"))
//        let button3: ActionSheet.Button = .cancel()
//
//        return ActionSheet(
//            title: Text("This is the title!"),
//            message: Text("This is the message."),
//            buttons: [button1, button1, button1, button1, button1, button2, button3])
    }
}

struct SimpleActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleActionSheetView()
    }
}
