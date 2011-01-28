//
//  RootViewController.h
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/27/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDXML.h"
@class MusicPlayer;

@interface RootViewController : UITableViewController {
	MusicPlayer *sharedMusicPlayer;
	DDXMLDocument *xmlDocument;
}

@end
