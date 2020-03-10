import SwiftUI


extension UIColor {
    
    /// Creates a `Color` instance that is the result of computing the
    /// interpolated Red, Green, and Blue components of the `UIColor`'s underlying
    /// `cgColor` by a given percentage.
    func interpolate(
        between secondColor: UIColor,
        by percentage: CGFloat
    ) -> Color {
        guard let firstComponents = self.cgColor.components else { return Color(self) }
        guard let secondComponents = secondColor.cgColor.components else { return Color(secondColor) }
        
        let firstRed = firstComponents[0]
        let secondRed = secondComponents[0]
        let redDiff: CGFloat = secondRed - firstRed
        let interpolatedRed = firstRed + (redDiff * percentage)

        
        let firstGreen = firstComponents[1]
        let secondGreen = secondComponents[1]
        let greenDiff: CGFloat = secondGreen - firstGreen
        let interpolatedGreen = firstGreen + (greenDiff * percentage)
        
        
        let firstBlue = firstComponents[2]
        let secondBlue = secondComponents[2]
        let blueDiff: CGFloat = secondBlue - firstBlue
        let interpolatedBlue = firstBlue + (blueDiff * percentage)
        
        
        return Color(
            red: Double(interpolatedRed),
            green: Double(interpolatedGreen),
            blue: Double(interpolatedBlue)
        )
    }
}
