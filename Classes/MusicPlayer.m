//
//  MusicPlayer.m
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/14/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import "MusicPlayer.h"
#import "SynthesizeSingleton.h"

@implementation MusicPlayer

- (void)dealloc {
	
	if (player) {
		[player release];
	}
	
	[musicLibrary release];
	
	[super dealloc];
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		musicLibrary = [[NSMutableDictionary alloc] init];
	}
	return self;
}


// Make this class a singleton class
SYNTHESIZE_SINGLETON_FOR_CLASS(MusicPlayer);

- (void)loadMusicWithKey:(NSString*)aSoundKey soundFile:(NSString*)aSoundFile {
	
	NSString *fileName = [[aSoundFile lastPathComponent] stringByDeletingPathExtension];
	NSString *filyType = [aSoundFile pathExtension];
	
	NSString *path = [musicLibrary objectForKey:aSoundKey];
	
	if (path != nil) {
		NSLog(@"MusicPlayer: Music with the key '%@' already exists", aSoundKey);
		return;
	}
	
	path = [[NSBundle mainBundle] pathForResource:fileName ofType:filyType];
	
	if (!path) {
		NSLog(@"Warning - MusicPlayer:cannot find file '%@.%@'", fileName, filyType);
		return;
	}
	
	[musicLibrary setObject:path forKey:aSoundKey];
}

- (void)playMusicWithKey:(NSString*)aMusicKey timesToRepeat:(NSUInteger)aRepeatCount {
	
	NSError *error;
	
	if (player) {
		[player release];
	}	
	
	NSString *path = [musicLibrary objectForKey:aMusicKey];
	if (!path) {
		NSLog(@"Error - MusicPlayer: the music key '%@' could not be found", aMusicKey);
		return;
	}
	
	player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
	player.delegate = self;
	
	[player setNumberOfLoops:aRepeatCount];
	[player setVolume:1.0f];
	[player play];
}

#pragma mark -
#pragma mark AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	
	if (!flag) {
		NSLog(@"ERROR - MusicPlayer: Music finished playing due to an error.");
		return;
	}
	NSLog(@"audioPlayerDidFinishPlaying");	
}


@end
