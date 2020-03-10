#if os(iOS) || os(tvOS)

import SwiftUI


extension Shape {

    /// - Parameters:
    ///   - fullSpanStartAngle: Setting this property will cause the gradient to being at
    ///         the specified offset, and then span the entire circumference. (Default: `nil`)
    public func animatableAngularGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        fullSpanStartAngle: Angle,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableAngularGradientModifier(
                baseShape: self,
                startColors: startColors,
                endColors: endColors,
                centerPoint: centerPoint,
                fullSpanStartAngle: fullSpanStartAngle,
                completionPercentage: completionPercentage
            )
        )
    }
    
    
    
    
    public func animatableAngularGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        startAngle: Angle = .zero,
        endAngle: Angle = .radians(2 * .pi),
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableAngularGradientModifier(
                baseShape: self,
                startColors: startColors,
                endColors: endColors,
                centerPoint: centerPoint,
                startAngle: startAngle,
                endAngle: endAngle,
                completionPercentage: completionPercentage
            )
        )
    }
}

#endif
