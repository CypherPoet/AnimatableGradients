#if os(iOS) || os(tvOS)


import SwiftUI


extension Shape {

    public func animatableRadialGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        startRadius: CGFloat? = nil,
        endRadius: CGFloat? = nil,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableRadialGradientModifier(
                baseShape: self,
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

