import SwiftUI

public struct FABLayout: Layout {

    let edgeSpacing: EdgeSpacing

    public init(
        edgeSpacing: EdgeSpacing = .init()
    ) {
        self.edgeSpacing = edgeSpacing
    }

    public init(_ edgeKind: Edge) {
        self.edgeSpacing = .init(kind: edgeKind)
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let width = proposal.width, let height = proposal.height else {
            return .zero
        }
        return CGSize(width: width, height: height)
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var point: CGPoint
        switch edgeSpacing.kind {
        case .topLeading:
            point = CGPoint(x: bounds.minX, y: bounds.minY)
            point.x += edgeSpacing.horizontalEdgeSpacing
            point.y += edgeSpacing.verticalEdgeSpacing
        case .bottomLeading:
            point = CGPoint(x: bounds.minX, y: bounds.maxY)
            point.x += edgeSpacing.horizontalEdgeSpacing
            point.y -= edgeSpacing.horizontalEdgeSpacing
        case .bottomTrailing:
            point = CGPoint(x: bounds.maxX, y: bounds.maxY)
            point.x -= edgeSpacing.horizontalEdgeSpacing
            point.y -= edgeSpacing.horizontalEdgeSpacing
        case .topTrailing:
            point = CGPoint(x: bounds.maxX, y: bounds.minY)
            point.x -= edgeSpacing.horizontalEdgeSpacing
            point.y += edgeSpacing.horizontalEdgeSpacing
        }
        for view in subviews {
            view.place(at: point, anchor: edgeSpacing.kind.anchor, proposal: .unspecified)
        }
    }
}
