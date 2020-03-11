//
//  LiveViewHostViewController.h
//  LiveViewHost
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// \brief A view controller which is capable of directly hosting a live view.
///
/// \c LVHHostViewController should only be used directly if not using the default \c LiveViewHost.AppDelegate class.
@interface LVHHostViewController : UIViewController

@property (readwrite, nonatomic, nullable) UIViewController *liveView;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
