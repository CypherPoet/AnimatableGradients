//
//  ScratchPad1View.swift
//  DemoApp
//
//  Created by CypherPoet on 3/10/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct ScratchPad1View {
    @Environment(\.colorScheme) private var colorScheme

    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension ScratchPad1View: View {

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 24)
                .animatableAngularGradient(
                    startColors: Constants.Appearance.gradientStartColors,
                    endColors: Constants.Appearance.gradientEndColors,
                    completionPercentage: animationCompletion
                )
                .shadow(color: shadowColor, radius: 10, x: 3, y: 3)
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            Spacer()
        }
        .padding()
        .padding()
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.animationCompletion = 1.0
            }
        }
        .navigationBarTitle(Text("Animatable Angular Gradient"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension ScratchPad1View {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
}



// MARK: - Computeds
extension ScratchPad1View {
}


// MARK: - View Variables
extension ScratchPad1View {
}


// MARK: - Private Helpers
private extension ScratchPad1View {
}



// MARK: - Preview
struct ScratchPad1View_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ScratchPad1View()
        }
    }
}
