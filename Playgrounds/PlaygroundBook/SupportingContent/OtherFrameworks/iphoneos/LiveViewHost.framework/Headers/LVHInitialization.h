//
//  LVHInitialization.h
//  LiveViewHost
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/// \brief Initializes the LiveViewHost framework.
///
/// This function is automatically called by \c LiveViewHost.AppDelegate.
/// If you do not use \c LiveViewHost.AppDelegate, then you should call this function.
FOUNDATION_EXPORT void LVHInitialize(void);
