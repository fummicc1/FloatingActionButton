import SwiftUI

public enum Edge {
    case topLeading
    case bottomLeading
    case topTrailing
    case bottomTrailing

    var anchor: UnitPoint {
        switch self {
        case .topLeading:
            return .topLeading
        case .bottomLeading:
            return .bottomLeading
        case .bottomTrailing:
            return .bottomTrailing
        case .topTrailing:
            return .topTrailing
        }
    }
}

public struct EdgeSpacing {
    public let kind: Edge
    public let horizontalEdgeSpacing: CGFloat
    public let verticalEdgeSpacing: CGFloat

    public init(
        kind: Edge = .bottomTrailing,
        horizontalEdgeSpacing: CGFloat = 16,
        verticalEdgeSpacing: CGFloat = 16
    ) {
        self.kind = kind
        self.horizontalEdgeSpacing = horizontalEdgeSpacing
        self.verticalEdgeSpacing = verticalEdgeSpacing
    }
}
