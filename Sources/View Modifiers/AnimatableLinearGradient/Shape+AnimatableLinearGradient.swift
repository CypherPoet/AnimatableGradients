import SwiftUI


extension Shape {

    public func animatableLinearGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        percentage completionPercentage: CGFloat
    ) -> some View {
        self.modifier(
            AnimatableLinearGradientModifier(
                baseShape: self,
                startColors: startColors,
                endColors: endColors,
                startPoint: startPoint,
                endPoint: endPoint,
                percentage: completionPercentage
            )
        )
    }
}
