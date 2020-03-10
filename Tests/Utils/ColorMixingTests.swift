import Foundation
import SwiftUI
import XCTest

@testable import AnimatableGradient



final class ColorMixingTests: XCTestCase {
    
    static let red = UIColor.red
    
    
    override class func setUp() {
        
    }
}


extension ColorMixingTests {
    
    func testEvenNumberOfColors() {
        let startColors: [UIColor] = [.red, .blue]
        let endColors: [UIColor] = [.yellow, .green]
        
        let interpolated = UIColor.red.interpolate(between: .blue, by: 0.5)
    }
}
