//
//  AngularGradientsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/10/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct AngularGradientsExample {
    @Environment(\.colorScheme) private var colorScheme

    @State private var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension AngularGradientsExample: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height * 0.05) {
                RoundedRectangle(cornerRadius: 24)
                    .animatableAngularGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    
                
                Capsule(style: .circular)
                    .animatableAngularGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        centerPoint: .center,
                        startAngle: .radians(.pi),
                        endAngle: .radians(.pi * 3),
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableAngularGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
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
extension AngularGradientsExample {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
}



// MARK: - Computeds
extension AngularGradientsExample {
}


// MARK: - View Variables
extension AngularGradientsExample {
}


// MARK: - Private Helpers
private extension AngularGradientsExample {
}



// MARK: - Preview
struct AngularGradientsExample_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            AngularGradientsExample()
        }
    }
}
