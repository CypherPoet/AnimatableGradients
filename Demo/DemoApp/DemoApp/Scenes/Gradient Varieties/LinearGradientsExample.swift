//
//  LinearGradientsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI


struct LinearGradientsExample {
    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension LinearGradientsExample: View {

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
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: .gray, radius: 14, x: 2, y: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        startPoint: .top,
                        endPoint: .bottom,
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
        .navigationBarTitle(Text("Linear Gradients"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension LinearGradientsExample {
}



// MARK: - Computeds
extension LinearGradientsExample {
}


// MARK: - View Variables
extension LinearGradientsExample {
}


// MARK: - Private Helpers
private extension LinearGradientsExample {
}



// MARK: - Preview
struct LinearGradientsExample_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            LinearGradientsExample()
        }
    }
}
