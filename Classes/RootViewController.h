//
//  RootViewController.h
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/17/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MusicPlayer;

@interface RootViewController : UITableViewController {
	MusicPlayer *sharedMusicPlayer;
}

@end
