#if os(iOS) || os(tvOS)


import SwiftUI


struct AnimatableLinearGradientModifier<BaseShape: Shape>: AnimatableGradientModifier {

    var baseShape: BaseShape
    
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    var startPoint: UnitPoint = .topLeading
    var endPoint: UnitPoint = .bottomTrailing
    
    var completionPercentage: CGFloat
}


extension AnimatableLinearGradientModifier {
    
    func gradientFill(in geometry: GeometryProxy) -> some ShapeStyle {
        LinearGradient(
            gradient: self.gradient,
            startPoint: self.startPoint,
            endPoint: self.endPoint
        )
    }
}

#endif
