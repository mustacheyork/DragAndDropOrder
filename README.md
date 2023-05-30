# Drag and Drop Sample Application in SwiftUI
This repository contains a simple but comprehensive sample app illustrating the usage of SwiftUI's onDrag and onDrop view modifiers, along with SwiftUI's DropDelegate.

## Overview
This sample app showcases a list of items that users can reorder through drag and drop operations. The items in the list are fully draggable, and each item can accept a drop, which triggers a reordering of the list. This functionality is implemented using SwiftUI's onDrag and onDrop view modifiers, and the behavior upon drop is controlled via a custom DropDelegate.

## Key Concepts
### onDrag
This view modifier is used to initiate a drag operation. In this sample app, each item in the list is wrapped with an onDrag view modifier that begins a drag operation when the user starts a drag gesture on the item.

### onDrop
This view modifier is used to specify a drop operation. In this sample app, each item in the list is also wrapped with an onDrop view modifier that accepts the drop and triggers the reordering of the list.

### DropDelegate
This SwiftUI protocol is used to handle the drop operation. In this sample app, a custom DropDelegate is used to control what happens when an item is dropped. The custom DropDelegate modifies the order of the list according to the drag and drop operation.

The [DropDelegate](https://developer.apple.com/documentation/swiftui/dropdelegate) protocol is used in conjunction with the `onDrop` modifier. It provides methods that allow you to handle various stages of the drag and drop process.

In this application, we've created a custom `DropDelegate` (`MyDropDelegate`) that handles the reordering of the entities within the list. The `DropDelegate` updates the list of entities when a drop operation occurs, changing the order based on the position of the drop.

## Working Environment
iOS: This sample app requires iOS 15 or later.

## License
This project is licensed under the MIT License - see the [[LICENSE](LICENSE)](https://github.com/mustacheyork/DragAndDropOrder/blob/main/LICENSE) file for details
