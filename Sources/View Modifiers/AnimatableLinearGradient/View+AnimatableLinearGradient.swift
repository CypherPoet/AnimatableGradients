import SwiftUI


extension View {
    
    public func animatableLinearGradient<BaseShape: Shape>(
        baseShape: BaseShape,
        startColors: [UIColor],
        endColors: [UIColor],
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        percentage completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableLinearGradientModifier(
                baseShape: baseShape,
                startColors: startColors,
                endColors: endColors,
                startPoint: startPoint,
                endPoint: endPoint,
                percentage: completionPercentage
            )
        )
    }
}
