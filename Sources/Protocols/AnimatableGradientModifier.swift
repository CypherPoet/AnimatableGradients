#if os(iOS) || os(tvOS)


import SwiftUI


protocol AnimatableGradientModifier: AnimatableModifier {
    associatedtype BaseShape: Shape
    associatedtype GradientShapeStyle: ShapeStyle
    
    var baseShape: BaseShape { get }
    var startColors: [UIColor] { get }
    var endColors: [UIColor] { get }
 
    var completionPercentage: CGFloat { get set }
    
    func gradientFill(in geometry: GeometryProxy) -> GradientShapeStyle
}


// MARK: - Animatable Data
extension AnimatableGradientModifier {
    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK - Default Body
extension AnimatableGradientModifier {
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            self.baseShape
                .fill(self.gradientFill(in: geometry))
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


// MARK: - Computeds
extension AnimatableGradientModifier {
    
    var gradient: Gradient {
        Gradient(colors: self.gradientColors)
    }
    
    
    var gradientColors: [Color] {
        zip(startColors, endColors).map { (startColor, endColor) in
            startColor.interpolate(between: endColor, by: completionPercentage)
        }
    }
}



#endif
