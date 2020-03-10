//
//  ShapesExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/8/20.
// ✌️
//

import SwiftUI
import AnimatableGradient


struct ShapesExample {
    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension ShapesExample: View {

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height * 0.05) {
                RoundedRectangle(cornerRadius: 24)
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                   
                
                Capsule(style: .circular)
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 36)
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.animationCompletion = 1.0
            }
        }
        .navigationBarTitle(Text("Shapes + Gradients"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension ShapesExample {
}



// MARK: - Computeds
extension ShapesExample {
}


// MARK: - View Variables
extension ShapesExample {
}


// MARK: - Private Helpers
private extension ShapesExample {
}



// MARK: - Preview
struct ShapesExample_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ShapesExample()
        }
    }
}
