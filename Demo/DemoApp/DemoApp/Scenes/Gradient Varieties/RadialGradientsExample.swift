//
//  RadialGradientsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct RadialGradientsExample {
    @Environment(\.colorScheme) private var colorScheme

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
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    
                
                Capsule(style: .circular)
                    .animatableRadialGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableRadialGradient(
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
extension RadialGradientsExample {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
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
