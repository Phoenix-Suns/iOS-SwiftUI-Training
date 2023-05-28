//
//  ReceiveMessageView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/24/23.
//

import SwiftUI

struct ReceiveMessageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var callback: ((_ messageBack: String) -> ())?
    @Binding var messageBack: String
    
    var body: some View {
        VStack {
            Text("Calback Text")
            TextField(
                "Message",
                text: $messageBack
            )
            
            // Callback Message
            Button {
                // ===== Callback Text ====
                callback?(messageBack)
                presentationMode.wrappedValue.dismiss() // Go back
            } label: {
                Label("Send back message", systemImage: "arrowshape.turn.up.backward.2.fill")
            }
        }
    }
}

struct SendMessageView: View {
    @State private var message: String = ""
    
    var body: some View {
        HStack {
            TextField(
                "Message",
                text: $message
            )
            
            NavigationLink {
                // ===== Send Text =====
                ReceiveMessageView(messageBack: $message)
            } label: {
                Label("Send", systemImage: "paperplane.fill")
            }
        }
    }
}

struct ReceiveMessageView_Previews: PreviewProvider {
    @State var data = ""
    
    static var previews: some View {
        ReceiveMessageView(messageBack: .constant(""))
    }
}
