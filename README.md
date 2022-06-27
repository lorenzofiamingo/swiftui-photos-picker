# SwiftUI PhotosPicker 🌇

`PhotosPicker` is a photos picker sheet, based on `PHPickerViewController`. Currently supports only iOS and Mac Catalyst.

## Usage

`PhotosPicker` has similar API and behavior as other [Presentation Modifiers](https://developer.apple.com/documentation/swiftui/view-presentation).
```swift
import SwiftUI
import PhotosPicker

struct ContentView: View {
    
    @State private var showingPicker = false
    
    var body: some View {
        Button("Choose image") {
            showingPicker = true
        }
        .photosPicker(isPresented: $showingPicker) { photos in
            if photos.count > 0 {
                print("Selected \(photos)")
            }
        }
    }
}
```

## Installation

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/lorenzofiamingo/swiftui-photos-picker`) and click **Next**.
3. Click **Finish**.


## Other projects

[SwiftUI AsyncButton 🖲️](https://github.com/lorenzofiamingo/swiftui-async-button)

[SwiftUI MapItemPicker 🗺️](https://github.com/lorenzofiamingo/swiftui-map-item-picker)

[SwiftUI CachedAsyncImage 🗃️](https://github.com/lorenzofiamingo/swiftui-cached-async-image)

[SwiftUI VerticalTabView 🔝](https://github.com/lorenzofiamingo/swiftui-vertical-tab-view)

[SwiftUI SharedObject 🍱](https://github.com/lorenzofiamingo/swiftui-shared-object)
