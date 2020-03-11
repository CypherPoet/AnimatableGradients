# AnimatableGradient (WIP)


<p>
    <img src="https://img.shields.io/badge/Swift-5.1-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://github.com/CypherPoet/AnimatableGradient/actions">
      <img src="https://github.com/CypherPoet/AnimatableGradient/workflows/Builds/badge.svg" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


_A collection of SwiftUI View Modifiers for creating animated color gradients._


<div align="center">
  <img src="./Assets/Screenshots/linear-gradient-recording-2.gif" width="400px">
</div>


- 🔗Clone or download this repo and play around with the [Demo app](./Demo/).
- 🔗[Swift Playgrounds Book]().


## Features

- [x] Linear Gradients
- [x] Radial Gradients
- [x] Angular Gradients
- [x] Direct ViewModifier Usage on Shapes
- [x] Direct ViewModifier Usage on Views -- when a custom Shape is defined.
- [x] Interpolate between as many start and end colors as you want.



## Requirements

- iOS 13.0+
- iPadOS 13.0+
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

The view modifiers exposed by `AnimatableGradient` all conform to its `AnimatableGradientModifier` protocol. (You can view the implementation [here](https://github.com/CypherPoet/AnimatableGradient/blob/master/Sources/Protocols/AnimatableGradientModifier.swift).)

<details>
<summary>AnimatableGradientModifier Protocol</summary>

```swift
protocol AnimatableGradientModifier: AnimatableModifier {
    associatedtype BaseShape: Shape
    associatedtype GradientShapeStyle: ShapeStyle

    var baseShape: BaseShape { get }
    var startColors: [UIColor] { get }
    var endColors: [UIColor] { get }

    var completionPercentage: CGFloat { get set }

    func gradientFill(in geometry: GeometryProxy) -> GradientShapeStyle
}

```

</details>


To use these modifiers, `AnimatableGradient` provides the following extensions on `View`s and `Shape`s:

- animatableLinearGradient
- animatableRadialGradient
- animatableAngularGradient

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

Taken together, a minimal, complete example could look like this:

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
}

```

But now for some more detail...


### Animatable Linear Gradients

#### Usage on Shapes

```swift
extension Shape {

    public func animatableLinearGradient (
        startColors: [UIColor],
        endColors: [UIColor],
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        completionPercentage: CGFloat
    ) -> some View {
      ...
    }
}
```
<div align="center">What you're using 👆</div>


```swift
  RoundedRectangle(cornerRadius: 24)
      .animatableLinearGradient(
          startColors: [.red, .blue, .purple, .white],
          endColors: [.green, .yellow, .orange, .black],
          completionPercentage: self.animationCompletion
      )
```
<div align="center">How to use it 👆</div>



<div align="center">
  <img src="" width="400px">
</div>




#### Usage on Views



### Animatable Radial Gradients

#### Usage on Shapes
#### Usage on Views


### Animatable Angular Gradients

#### Usage on Shapes
#### Usage on Views


### ⚠️ Edge Cases

- If you pass a `completionPercentage` value less than 0, or greater than 1, it will automatically be clamped to the closer endpoint.
- Behind the scenes, the `startColors` and `endColors` arrays get zipped before the interpolated colors are computed. This means that if their sizes are different, the larger array will be trimmed down to the size of the smaller array, and the excess colors in the larger array won't be used.
  - As such, if either or both of the `startColors` and `endColors` arrays are empty, the gradient will have no colors passed to it and it will appear completely clear.


## Contributing

Contributions to `AnimatableGradient` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.



## Roadmap

- Mac Catalyst Support (?)
- watchOS Support (?)



## License

AnimatableGradient is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
