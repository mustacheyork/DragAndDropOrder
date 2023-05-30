//
//  ContentView.swift
//  DragAndDropOrder
//
//  Created by Kanako Kobayashi on 2023/05/30.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var items = ["1個目", "2個目", "3個目", "4個目", "5個目", "6個目"]
    @State private var dragOverIndex: Int?
    @State private var draggedIndex: Int?

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 20) {
                ForEach(items.indices, id: \.self) { index in
                    Text(items[index])
                        .frame(width: 100, height: 100)
                        .background(Color.pink.opacity(dragOverIndex == index ? 0.5 : 1))
                        .onDrag {
                            self.draggedIndex = index
                            return NSItemProvider(object: String(index) as NSString)
                        }
                        .onDrop(of: [UTType.plainText], delegate: MyDropDelegate(draggedIndex: $draggedIndex, dropIndex: index, items: $items))
                }
            }
        }
    }
    
    struct MyDropDelegate: DropDelegate {
        @Binding var draggedIndex: Int?
        let dropIndex: Int
        @Binding var items: [String]

        func performDrop(info: DropInfo) -> Bool {
            if let draggedIndex = draggedIndex {
                let draggedItem = items[draggedIndex]
                items.remove(at: draggedIndex)
                items.insert(draggedItem, at: dropIndex)
            }
            return true
        }

        func validateDrop(info: DropInfo) -> Bool {
            return info.hasItemsConforming(to: [.plainText])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
