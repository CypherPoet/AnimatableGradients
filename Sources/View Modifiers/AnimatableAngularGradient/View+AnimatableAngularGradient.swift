import SwiftUI


extension View {
    
    public func animatableAngularGradient<BaseShape: Shape>(
        baseShape: BaseShape,
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        startAngle: Angle,
        endAngle: Angle,
        completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableAngularGradientModifier(
                baseShape: baseShape,
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
