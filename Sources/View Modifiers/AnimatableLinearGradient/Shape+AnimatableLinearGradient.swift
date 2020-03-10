#if os(iOS) || os(tvOS)


import SwiftUI


extension Shape {

    public func animatableLinearGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableLinearGradientModifier(
                baseShape: self,
                startColors: startColors,
                endColors: endColors,
                startPoint: startPoint,
                endPoint: endPoint,
                completionPercentage: completionPercentage
            )
        )
    }
}

#endif
