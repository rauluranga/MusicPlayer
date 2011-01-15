//
//  MusicPlayerAppDelegate.h
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/14/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicPlayerViewController;

@interface MusicPlayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MusicPlayerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MusicPlayerViewController *viewController;

@end

