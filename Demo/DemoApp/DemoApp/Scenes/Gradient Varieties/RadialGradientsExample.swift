//
//  RadialGradientsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI


struct RadialGradientsExample {
    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension RadialGradientsExample: View {

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height * 0.05) {
                RoundedRectangle(cornerRadius: 24)
                    .animatableRadialGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    
                
                Capsule(style: .circular)
                    .animatableRadialGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableRadialGradient(
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
        .navigationBarTitle(Text("Radial Gradients"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension RadialGradientsExample {
}



// MARK: - Computeds
extension RadialGradientsExample {
}


// MARK: - View Variables
extension RadialGradientsExample {
}


// MARK: - Private Helpers
private extension RadialGradientsExample {
}



// MARK: - Preview
struct RadialGradientsExample_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            RadialGradientsExample()
        }
    }
}
