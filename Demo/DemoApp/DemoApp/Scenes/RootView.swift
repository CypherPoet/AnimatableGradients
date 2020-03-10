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
                    NavigationLink(destination: Example1()) {
                        Text("Using with Shapes")
                    }
                    
                    NavigationLink(destination: Example2()) {
                        Text("Using with Views")
                    }
                    
                    NavigationLink(destination: Example2()) {
                        Text("Custom Gradient Directions")
                    }
                }
                
                Section(header: Text("Gradient Varieties")) {
                    NavigationLink(destination: Example2()) {
                        Text("Linear Gradients")
                    }
                    
                    NavigationLink(destination: Example2()) {
                        Text("Radial Gradients")
                    }
                    
                    NavigationLink(destination: Example2()) {
                        Text("Angular Gradients")
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
