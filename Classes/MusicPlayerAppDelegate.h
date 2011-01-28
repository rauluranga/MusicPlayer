//
//  MusicPlayerAppDelegate.h
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/27/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicPlayerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

