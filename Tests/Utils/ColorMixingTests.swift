#if os(iOS) || os(tvOS)


import Foundation
import SwiftUI
import XCTest

@testable import AnimatableGradients


final class ColorMixingTests: XCTestCase {
}


extension ColorMixingTests {
    
    func testInterpolatingHalfwayBetween0And100RBG() {
        let startColor = UIColor(red: 10, green: 10, blue: 10, alpha: 1)
        let endColor = UIColor(red: 100, green: 100, blue: 100, alpha: 1)
        
        let interpolated = startColor.interpolate(between: endColor, by: 0.5)
        
        // 🤔 This was a bit of trial and error to discover. I'd love to find
        // a more reliable way to come up with an "expected" `Color` value here.
//        let expected = Color(UIColor(red: 55, green: 55, blue: 55, alpha: 1))
        let expected = "#36C936C936C9FF"
        let actual = interpolated.description
        
        XCTAssertEqual(actual, expected)
    }
    
    
    func testInterpolatingFullyBetween10And100RBG() {
        let startColor = UIColor(red: 10, green: 10, blue: 10, alpha: 1)
        let endColor = UIColor(red: 100, green: 100, blue: 100, alpha: 1)
        
        let interpolated = startColor.interpolate(between: endColor, by: 1.0)
        
        let expected = "#639C639C639CFF"
        let actual = interpolated.description
        
        XCTAssertEqual(actual, expected)
    }

    
    
    func testInterpolatingBetweenBlackAndWhite() {
        let startColor = UIColor.white
        let endColor = UIColor.black
        
        let interpolated = startColor.interpolate(between: endColor, by: 0.5)
        
        let expected = "#808080FF"
        let actual = interpolated.description
        
        XCTAssertEqual(actual, expected)
    }
    

    func testInterpolatingWithANegativePercentage() {
        let startColor = UIColor.white
        let endColor = UIColor.black
        
        let interpolated = startColor.interpolate(between: endColor, by: -0.5)
        
        let expected = "#FFFFFFFF"
        let actual = interpolated.description
        
        XCTAssertEqual(actual, expected)
    }
    
    
    func testInterpolatingBeyondAllowablePercentageRange() {
        let startColor = UIColor.white
        let endColor = UIColor.black
        
        let interpolated = startColor.interpolate(between: endColor, by: 999)
        
        let expected = "#000000FF"
        let actual = interpolated.description
        
        XCTAssertEqual(actual, expected)
    }
    
}

#endif
