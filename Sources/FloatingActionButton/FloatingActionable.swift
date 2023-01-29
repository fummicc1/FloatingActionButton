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
        fab fabContent: FABContent,
        color: Color = .accentColor,
        content: @escaping () -> Content,
        didPress: @escaping () -> Void
    ) {
        self.init(
            edge,
            FABContainer(fabContent, color: color),
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
            fab: .image(Image(systemName: "plus")),
            color: .red
        ) {
            VStack {
                Text("BottomTrailing FAB")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding()
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("Tap")
                }
                .foregroundColor(.white)
                .background(Color.red)
                .buttonStyle(.bordered)
                .cornerRadius(16)
                .padding()
            }
        } didPress: {
            AudioServicesPlaySystemSound(1000)
        }

        NavigationView {
            FloatingActionable(
                .topLeading,
                fab: .image(Image(systemName: "minus")),
                color: .indigo
            ) {
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("Tap")
                }
                .foregroundColor(.white)
                .background(Color.indigo)
                .buttonStyle(.bordered)
                .cornerRadius(16)
                .padding()
            } didPress: {
                AudioServicesPlaySystemSound(1000)
            }
            .navigationTitle("TopLeading FAB")
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
                    Text("Tap")
                }
                .foregroundColor(.white)
                .background(Color.accentColor)
                .buttonStyle(.bordered)
                .cornerRadius(16)
                .padding()
            } didPress: {
                AudioServicesPlaySystemSound(1000)
            }
            .navigationTitle("Extended FAB")
        }
    }
}
