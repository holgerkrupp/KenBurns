
Apply the `.kenBurns()` modifier to any `Image` or `View` you want to animate. **Ensure the view has a size defined** by its parent container (e.g., a `.frame()` or `VStack`/`HStack` constraint).

```swift
import SwiftUI
import KenBurns

struct ContentView: View {
    var body: some View {
        Image("CoolImage")
            .resizable()
            .scaledToFill() // Optional: Ensures it covers the frame completely
            .frame(width: 400, height: 400) // Define the frame for the animation area
            
            // Apply the Ken Burns effect
            .kenBurns(duration: 15.0, maxScale: 1.3)
            
            .clipped() // Important to prevent overflow
    }
}
