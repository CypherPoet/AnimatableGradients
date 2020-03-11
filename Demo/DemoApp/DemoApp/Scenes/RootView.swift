//
//  RootView.swift
//  DemoApp
//
//  Created by CypherPoet on 3/8/20.
// ✌️
//

import SwiftUI


struct RootView {

}


// MARK: - View
extension RootView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink(destination: ShapesExample()) {
                        Text("Using with Shapes")
                    }
                    
                    NavigationLink(destination: ViewsExample()) {
                        Text("Using with Views")
                    }
//                    
//                    NavigationLink(destination: ViewsExample()) {
//                        Text("Custom Gradient Directions")
//                    }
                }
                
                Section(header: Text("Gradient Varieties")) {
                    NavigationLink(destination: LinearGradientsExample()) {
                        Text("Linear Gradients")
                    }
                    
                    NavigationLink(destination: RadialGradientsExample()) {
                        Text("Radial Gradients")
                    }
                    
                    NavigationLink(destination: AngularGradientsExample()) {
                        Text("Angular Gradients")
                    }
                }
                
                Section(header: Text("Scratchpads")) {
                    NavigationLink(destination: ScratchPad1View()) {
                        Text("ScratchPad 1")
                    }
                    NavigationLink(destination: ScratchPad2View()) {
                        Text("ScratchPad 2")
                    }
                }
            }
            .navigationBarTitle("Animatable Gradient")
        }
    }
}


// MARK: - Computeds
extension RootView {
}


// MARK: - View Variables
extension RootView {
}


// MARK: - Private Helpers
private extension RootView {
}



// MARK: - Preview
struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        RootView()
    }
}
