#if os(iOS) || os(tvOS)


import SwiftUI


extension View {
    
    public func animatableRadialGradient<BaseShape: Shape>(
        baseShape: BaseShape,
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        startRadius: CGFloat? = nil,
        endRadius: CGFloat? = nil,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableRadialGradientModifier(
                baseShape: baseShape,
                startColors: startColors,
                endColors: endColors,
                centerPoint: centerPoint,
                startRadius: startRadius,
                endRadius: endRadius,
                completionPercentage: completionPercentage
            )
        )
    }
}


#endif
