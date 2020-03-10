#if os(iOS) || os(tvOS)


import SwiftUI


extension View {
    
    public func animatableLinearGradient<BaseShape: Shape>(
        baseShape: BaseShape,
        startColors: [UIColor],
        endColors: [UIColor],
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableLinearGradientModifier(
                baseShape: baseShape,
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
