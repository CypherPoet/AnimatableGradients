#if os(iOS) || os(tvOS)


import SwiftUI


struct AnimatableRadialGradientModifier<BaseShape: Shape>: AnimatableGradientModifier {
    var baseShape: BaseShape
    
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    var centerPoint: UnitPoint = .center
    var startRadius: CGFloat? = nil
    var endRadius: CGFloat? = nil
    
    var completionPercentage: CGFloat
}


extension AnimatableRadialGradientModifier {
    
    func gradientFill(in geometry: GeometryProxy) -> some ShapeStyle {
        let startRadius = self.startRadius ?? 0.0
        let endRadius = self.endRadius ?? min(geometry.size.width, geometry.size.height) / 2
        
        return RadialGradient(
            gradient: gradient,
            center: centerPoint,
            startRadius: startRadius,
            endRadius: endRadius
        )
    }
}

#endif
