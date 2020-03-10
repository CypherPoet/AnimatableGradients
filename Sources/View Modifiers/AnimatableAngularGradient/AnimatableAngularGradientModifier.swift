#if os(iOS) || os(tvOS)


import SwiftUI


struct AnimatableAngularGradientModifier<BaseShape: Shape>: AnimatableGradientModifier {
    var baseShape: BaseShape
    
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    var centerPoint: UnitPoint = .center
    var startAngle: Angle = .zero
    var endAngle: Angle = .radians(2 * .pi)
    
    /// Setting this property will cause the gradient to being at the specified offset, and
    /// then span the entire circumference.
    var fullSpanStartAngle: Angle? = nil
    
    var completionPercentage: CGFloat
}


extension AnimatableAngularGradientModifier {
    
    func gradientFill(in geometry: GeometryProxy) -> some ShapeStyle {
        if let fullSpanStartAngle = fullSpanStartAngle {
            return AngularGradient(gradient: gradient, center: centerPoint, angle: fullSpanStartAngle)
        } else {
            return AngularGradient(
                gradient: gradient,
                center: centerPoint,
                startAngle: startAngle,
                endAngle: endAngle
            )
        }
    }
}

#endif
