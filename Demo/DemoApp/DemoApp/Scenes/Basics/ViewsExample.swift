//
//  ViewsExample.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct ViewsExample {
    @Environment(\.colorScheme) private var colorScheme

    @State private var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension ViewsExample: View {

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Color
                .clear
                .animatableLinearGradient(
                        baseShape: Rectangle(),
                        startColors: Constants.Appearance.gradientStartColors,
                        endColors: Constants.Appearance.gradientEndColors,
                        completionPercentage: animationCompletion
                )
                .frame(maxWidth: .infinity, maxHeight: 300)
                .overlay(
                    Text("Gradients on a clear Color View")
                        .font(.largeTitle)
                )
            

            Text("Gradients as Text Backgrounds")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .animatableLinearGradient(
                            startColors: Constants.Appearance.gradientStartColors,
                            endColors: Constants.Appearance.gradientEndColors,
                            completionPercentage: animationCompletion
                        )
                )
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.animationCompletion = 1.0
            }
        }
        .navigationBarTitle(Text("Views + Gradients"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension ViewsExample {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
}



// MARK: - Computeds
extension ViewsExample {
}


// MARK: - View Variables
extension ViewsExample {
}


// MARK: - Private Helpers
private extension ViewsExample {
}



// MARK: - Preview
struct ViewsExample_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ViewsExample()
        }
    }
}
