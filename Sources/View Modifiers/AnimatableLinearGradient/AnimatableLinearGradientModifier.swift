import SwiftUI


struct AnimatableLinearGradientModifier<BaseShape: Shape>: AnimatableGradientModifier {

    var baseShape: BaseShape
    
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    var completionPercentage: CGFloat
}


extension AnimatableLinearGradientModifier {
    
    func gradientFill(in geometry: GeometryProxy) -> some ShapeStyle {
        LinearGradient(
            gradient: self.gradient,
            startPoint: self.startPoint,
            endPoint: self.endPoint
        )
    }
}
