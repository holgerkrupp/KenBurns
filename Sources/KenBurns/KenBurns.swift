import SwiftUI

public struct KenBurns: ViewModifier {
    
    private let duration: Double
    private let maxScale: CGFloat
    
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var trigger: Int = 0
    
    public init(duration: Double = 10.0, maxScale: CGFloat = 1.2) {
        precondition(maxScale > 1.0, "maxScale must be greater than 1.0 for a zoom effect.")
        self.duration = duration
        self.maxScale = maxScale
    }

    public func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .scaledToFill()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .scaleEffect(scale)
                .offset(offset)
                .animation(
                    .linear(duration: duration).repeatForever(autoreverses: true),
                    value: trigger
                )
                .onAppear {
                    randomizeInitialState(for: proxy.size)
                    trigger += 1
                }
        }
        .clipped()
    }
    
    private func randomizeInitialState(for size: CGSize) {
        
        scale = maxScale
        
        let maxOffsetX = (size.width * scale - size.width) / 2
        let maxOffsetY = (size.height * scale - size.height) / 2
        
        let extremeOffsets: [CGSize] = [
            CGSize(width: maxOffsetX, height: maxOffsetY),
            CGSize(width: -maxOffsetX, height: maxOffsetY),
            CGSize(width: maxOffsetX, height: -maxOffsetY),
            CGSize(width: -maxOffsetX, height: -maxOffsetY)
        ]
        
        offset = extremeOffsets.randomElement() ?? .zero
    }
}

extension View {
    public func kenBurns(duration: Double = 10.0, maxScale: CGFloat = 1.2) -> some View {
        self.modifier(KenBurns(duration: duration, maxScale: maxScale))
    }
}
