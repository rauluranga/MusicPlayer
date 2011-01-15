//
//  MusicPlayer.h
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/14/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicPlayer : NSObject <AVAudioPlayerDelegate> {
	AVAudioPlayer *player; 
	
	NSMutableDictionary *musicLibrary;
}

+ (MusicPlayer *)sharedMusicPlayer;

- (void)loadMusicWithKey:(NSString*)aSoundKey soundFile:(NSString*)aSoundFile;
- (void)playMusicWithKey:(NSString*)aMusicKey timesToRepeat:(NSUInteger)aRepeatCount;

@end
