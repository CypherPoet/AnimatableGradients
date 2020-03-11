//
//  ScratchPad2View.swift
//  DemoApp
//
//  Created by CypherPoet on 3/10/20.
// ✌️
//

import SwiftUI
import AnimatableGradients


struct ScratchPad2View {
    @Environment(\.colorScheme) private var colorScheme

    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension ScratchPad2View: View {

    var body: some View {
        VStack {
            Color.clear
                .animatableRadialGradient(
                        baseShape: RoundedRectangle(cornerRadius: 24),
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
        .navigationBarTitle(Text("Animatable Radial Gradient"), displayMode: .inline)
    }
}




// MARK: - Computeds
extension ScratchPad2View {
    
    var shadowColor: Color {
        colorScheme == .dark ? .clear : Color.gray.opacity(0.77)
    }
}



// MARK: - Computeds
extension ScratchPad2View {
}


// MARK: - View Variables
extension ScratchPad2View {
}


// MARK: - Private Helpers
private extension ScratchPad2View {
}



// MARK: - Preview
struct ScratchPad2View_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ScratchPad2View()
        }
    }
}
