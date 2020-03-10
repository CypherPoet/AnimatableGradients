# AnimatableGradient


<p>
    <img src="https://img.shields.io/badge/Swift-5.1-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://github.com/CypherPoet/AnimatableGradient/actions">
      <img src="https://github.com/CypherPoet/AnimatableGradient/workflows/ci/badge.svg" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


_A SwiftUI View Modifier for creating gradients with animated colors_.


<div>
  <img src="./Assets/Screenshots/linear-gradient-recording-1.gif" width="400px">
</div>



## Features

- [x] Linear Gradients
- [x] Radial Gradients
- [x] Angular Gradients
- [x] Direct ViewModifier Usage on Shapes
- [x] Direct ViewModifier Usage on Views -- when a custom Shape is defined.
- [x] Interpolate between as many start and end colors as you want.


## Requirements

- iOS 13.0+
- tvOS 13.0+
- Xcode 11.3+ (for developing)



## Installation

`AnimatableGradient` can be used through the Swift Package Manager. You can add it as a dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/CypherPoet/AnimatableGradient", .branch("master")),
    ],
    //...
)
```

Then simply `import AnimatableGradient` wherever you’d like to use it.


## Usage

The view modifiers exposed by `AnimatableGradient` all conform to its `AnimatableGradientModifier` protocol -- which looks like this:

```swift

```

To use these modifiers, `AnimatableGradient` provides the following extensions on `View`s and `Shape`s:

-
-
-

(More detailed explanations of each can be found below.)

🔑 In order to achieve animation, your containing views will need to provide the aforementioned modifiers with a bound `CGFloat` state value that ranges between 0.0 and 1.0.

```swift
@State private var animationCompletion: CGFloat = 0.0
```

> This is the "animation completion" percentage that each `AnimatableGradientModifier` will use to generate interpolated color values during each rendered frame.

Additionally, the same containing views will need to animate the change of the animation completion. A common pattern consists of animating the value repeatedly from the containing view's `onAppear` modifier to create a continuous animation effect:

```swift
.onAppear {
    withAnimation(
        Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
    ) {
        self.animationCompletion = 1.0
    }
}
```

Taken together, a minimal, complete example would look like this:

```swift

struct ContentView {
    @State private var animationCompletion: CGFloat = 0.0

    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .animatableLinearGradient(
                startColors: [.red, .blue],
                endColors: [.green, .yellow],
                completionPercentage: self.animationCompletion
            )
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
                ) {
                    self.animationCompletion = 1.0
                }
            }
    }

```

But now for some more detail...


### Animatable Linear Gradients

#### Usage on Shapes

```swift
  RoundedRectangle(cornerRadius: 24)
      .animatableLinearGradient(
          startColors: [.red, .blue, .purple, .white],
          endColors: [.green, .yellow, .orange, .black],
          completionPercentage: self.animationCompletion
      )
```

#### Usage on Views



### Animatable Radial Gradients

#### Usage on Shapes
#### Usage on Views


### Animatable Angular Gradients

#### Usage on Shapes
#### Usage on Views


## Contributing

Contributions to `MyLibrary` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.





## License

AnimatableGradient is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
