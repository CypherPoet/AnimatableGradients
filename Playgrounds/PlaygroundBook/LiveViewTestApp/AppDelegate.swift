//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Implements the application delegate for LiveViewTestApp with appropriate configuration points.
//

import UIKit
import PlaygroundSupport
import LiveViewHost
import BookCore

@UIApplicationMain
class AppDelegate: LiveViewHost.AppDelegate {
    override func setUpLiveView() -> PlaygroundLiveViewable {
        // This method should return a fully-configured live view. This method must be implemented.
        //
        // The view or view controller returned from this method will be automatically be shown on screen,
        // as if it were a live view in Swift Playgrounds. You can control how the live view is shown by
        // changing the implementation of the `liveViewConfiguration` property below.
        return BookCore.instantiateLiveView()
    }

    override var liveViewConfiguration: LiveViewConfiguration {
        // Make this property return the configuration of the live view which you desire to test.
        //
        // Valid values are `.fullScreen`, which simulates when the user has expanded the live
        // view to fill the full screen in Swift Playgrounds, and `.sideBySide`, which simulates when
        // the live view is shown next to or above the source code editor in Swift Playgrounds.
        return .fullScreen
    }
}
