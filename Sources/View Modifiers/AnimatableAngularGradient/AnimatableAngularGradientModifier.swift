import SwiftUI


struct AnimatableAngularGradientModifier<BaseShape: Shape>: AnimatableGradientModifier {
    var baseShape: BaseShape
    
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    let centerPoint: UnitPoint
    let startAngle: Angle
    let endAngle: Angle
    
    var completionPercentage: CGFloat
}


extension AnimatableAngularGradientModifier {
    
    func gradientFill(in geometry: GeometryProxy) -> some ShapeStyle {
        AngularGradient(
            gradient: gradient,
            center: centerPoint,
            startAngle: startAngle,
            endAngle: endAngle
        )
    }
}
