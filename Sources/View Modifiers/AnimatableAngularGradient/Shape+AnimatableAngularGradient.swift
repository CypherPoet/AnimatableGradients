import SwiftUI


extension Shape {

    public func animatableAngularGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        centerPoint: UnitPoint = .center,
        startAngle: Angle,
        endAngle: Angle,
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
