import Foundation
import AVFoundation
import SwiftUI

public struct FloatingActionable<Content: View>: View {

    let edge: Edge
    let content: () -> Content
    let didPress: () -> Void
    let fabContainer: FABContainer

    public init(
        _ edge: Edge = .bottomTrailing,
        _ fabContent: FABContent,
        content: @escaping () -> Content,
        didPress: @escaping () -> Void
    ) {
        self.init(
            edge,
            FABContainer(fabContent),
            content: content,
            didPress: didPress
        )
    }

    public var body: some View {
        ZStack {
            content()
            FABLayout(edge) {
                Button(action: didPress) {
                    fabContainer.buildContent()
                }
            }
        }
    }
}

// MARK: Extended
public extension FloatingActionable {
    private init(
        _ edge: Edge = .bottomTrailing,
        _ fabContainer: FABContainer,
        content: @escaping () -> Content,
        didPress: @escaping () -> Void
    ) {
        self.edge = edge
        self.content = content
        self.fabContainer = fabContainer
        self.didPress = didPress
    }

    static func extended(
        _ edge: Edge = .bottomTrailing,
        text: Text,
        image: Image,
        color baseColor: Color = .accentColor,
        content: @escaping () -> Content,
        didPress: @escaping () -> Void
    ) -> FloatingActionable {
        let container = FABContainer.extended(
            text: text,
            image: image,
            color: baseColor
        )
        return .init(
            edge,
            container,
            content: content,
            didPress: didPress
        )
    }
}

struct FloatingActionable_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionable(
            .bottomTrailing,
            .image(Image(systemName: "plus"))
        ) {
            VStack {
                Text("Simple FAB")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding()
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("タップ")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        } didPress: {
            AudioServicesPlaySystemSound(1000)
        }

        NavigationView {
            FloatingActionable(
                .topLeading,
                .image(Image(systemName: "minus"))
            ) {
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("タップ")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            } didPress: {
                AudioServicesPlaySystemSound(1000)
            }
            .navigationTitle("Navigation FAB")
        }

        NavigationView {
            FloatingActionable.extended(
                .bottomLeading,
                text: Text("subtract"),
                image: Image(systemName: "minus")
            ) {
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("タップ")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            } didPress: {
                AudioServicesPlaySystemSound(1000)
            }
            .navigationTitle("Extended FAB")
        }
    }
}
