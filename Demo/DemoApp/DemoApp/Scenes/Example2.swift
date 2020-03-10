//
//  Example2.swift
//  DemoApp
//
//  Created by CypherPoet on 3/9/20.
// ✌️
//

import SwiftUI


struct Example2 {
    private var startColors: [UIColor] = [
        #colorLiteral(red: 1, green: 0.877946794, blue: 0, alpha: 1),
        #colorLiteral(red: 1, green: 0.589461267, blue: 0.2027931213, alpha: 1),
        #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
        #colorLiteral(red: 1, green: 0.40607512, blue: 0.9373921752, alpha: 1),
    ]
    
    private var endColors: [UIColor] = [
        #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
        #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
        #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
    ]
    
    @State var animationCompletion: CGFloat = 0.0
}


// MARK: - View
extension Example2: View {

    var body: some View {
        VStack {
            Spacer()
            
            Color
                .clear
                .animatableLinearGradient(
                        baseShape: Rectangle(),
                        startColors: startColors,
                        endColors: endColors,
                        percentage: animationCompletion
                )
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            Spacer()
            
            Text("Text Background")
                .font(.largeTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .animatableLinearGradient(
                            startColors: startColors,
                            endColors: endColors,
                            percentage: animationCompletion
                        )
                )
            
            Spacer()
        }
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.animationCompletion = 1.0
            }
        }
    }
}




// MARK: - Computeds
extension Example2 {
}



// MARK: - Computeds
extension Example2 {
}


// MARK: - View Variables
extension Example2 {
}


// MARK: - Private Helpers
private extension Example2 {
}



// MARK: - Preview
struct Example2_Previews: PreviewProvider {

    static var previews: some View {
        Example2()
    }
}
