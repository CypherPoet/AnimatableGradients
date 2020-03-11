//
//  LinearGradientsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct LinearGradientsExample {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var animationCompletion: CGFloat = 0.0
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
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                   
                
                Capsule(style: .circular)
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing,
                        completionPercentage: self.animationCompletion
                    )
                    .shadow(color: self.shadowColor, radius: 10, x: 3, y: 3)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)

                
                Circle()
                    .animatableLinearGradient(
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        startPoint: .top,
                        endPoint: .bottom,
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
        .navigationBarTitle(Text("Linear Gradients"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension LinearGradientsExample {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
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
        Group {
            NavigationView {
                LinearGradientsExample()
            }
            .colorScheme(.dark)
            
            
            NavigationView {
                LinearGradientsExample()
            }
            .colorScheme(.light)
        }
    }
}
