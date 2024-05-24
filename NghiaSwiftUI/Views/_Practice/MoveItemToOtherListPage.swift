//
//  MoveItemToOtherListPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/25/24.
//

import SwiftUI

struct MoveItemToOtherListPage: View {
    @State var users1 = ["Paul", "Taylor", "Adele"]
    @State var users2 = ["Pauline", "Tom", "Adam"]

    var body: some View {

        VStack {

            HStack {
                Spacer()
                Text("Users")
                    .font(.headline)
                Spacer()
                EditButton()
                Spacer()
                    .frame(width: 10)
            }

            HStack(spacing: 0) {
                DroppableList("Users 1", users: $users1) { dropped, index in
                    users1.insert(dropped, at: index)
                    users2.removeAll { $0 == dropped }
                }
                DroppableList("Users 2", users: $users2)  { dropped, index in
                    users2.insert(dropped, at: index)
                    users1.removeAll { $0 == dropped }
                }
            }
        }
    }
}

struct DroppableList: View {
    let title: String
    @Binding var users: [String]

    //this action is performed when a drop is made
    //parameters are:
    //  the dropped String
    //  the index where it was dropped
    //it's Optional in case we don't need to anything else
    let action: ((String, Int) -> Void)?

    init(_ title: String, users: Binding<[String]>, action: ((String, Int) -> Void)? = nil) {
        self.title = title
        self._users = users //assign to the Binding, nont the WrappedValue
        self.action = action
    }

    var body: some View {
        List {
            Text(title)
                .font(.subheadline)
            ForEach(users, id: \.self) { user in
                Text(user)
                    .onDrag { NSItemProvider(object: user as NSString) }
            }
            .onMove(perform: moveUser)
            .onInsert(of: ["public.text"], perform: dropUser)
        }
    }

    func moveUser(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }

    func dropUser(at index: Int, _ items: [NSItemProvider]) {
        for item in items {
            _ = item.loadObject(ofClass: String.self) { droppedString, _ in
                if let ss = droppedString, let dropAction = action {
                    DispatchQueue.main.async {
                        dropAction(ss, index)
                    }
                }
            }
        }
    }
}

#Preview {
    MoveItemToOtherListPage()
}
