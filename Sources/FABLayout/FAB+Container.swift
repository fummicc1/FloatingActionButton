import SwiftUI

public struct FABContainer {

    public let contents: [FABContent]
    public let backgroundColor: Color
    public let foregroundColor: Color
    public let isExtended: Bool
    public let shape: Shape

    public init(
        _ content: FABContent,
        color baseColor: Color = .accentColor
    ) {
        self.init(
            contents: [content],
            isExtended: false,
            baseColor: baseColor
        )
    }

    public static func extended(
        text: Text,
        image: Image,
        color baseColor: Color = .accentColor
    ) -> FABContainer {
        FABContainer(
            contents:  [
                .image(image),
                .text(text),
            ],
            isExtended: true,
            baseColor: baseColor
        )
    }

    internal init(
        contents: [FABContent],
        isExtended: Bool,
        baseColor: Color
    ) {
        self.contents = contents
        self.isExtended = isExtended
        self.shape = isExtended ?  .extended : .circle
        self.backgroundColor = baseColor.opacity(0.11)
        self.foregroundColor = baseColor
    }

    public func buildContent() -> some View {
        HStack(spacing: .zero) {
            Group {
                ForEach(contents.indices, id: \.self) { id in
                    let content = contents[id]
                    switch content {
                    case .text(let text):
                        text
                    case .image(let image):
                        image
                    }
                }
            }
            .foregroundColor(foregroundColor)
            .padding(2)
        }
        .padding()
        // TODO: convert dp into pt
        .zIndex(6)
        .background(backgroundColor)
        .shape(shape: shape)
        .background(
            // TODO: Support variant
            // Current: surface variant
            Rectangle()
                .fill(backgroundColor)
                .shape(shape: shape)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 3, x: 0, y: 1
                )
                .blur(radius: 3)
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 8, x: 0, y: 4
                )
                .blur(radius: 8)
        )
    }
}

private struct ShapeModifier: ViewModifier {
    let fabShape: FABContainer.Shape
    func body(content: Content) -> some View {
        switch fabShape {
        case .circle:
            return AnyView(erasing: content.clipShape(RoundedRectangle(cornerRadius: 16)))
        case .extended:
            return AnyView(erasing: content.clipShape(RoundedRectangle(cornerRadius: 16)))
        }
    }
}

private extension View {
    func shape(shape fabShape: FABContainer.Shape) -> some View {
        modifier(ShapeModifier(fabShape: fabShape))
    }
}

public extension FABContainer {
    enum Shape {
        case circle
        case extended
    }
}

public enum FABContent {
    case text(Text)
    case image(Image)
}
