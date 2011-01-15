//
//  MusicPlayerViewController.m
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/14/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import "MusicPlayerViewController.h"
#import "MusicPlayer.h"

@implementation MusicPlayerViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


//*/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	sharedMusicPlayer = [MusicPlayer sharedMusicPlayer];
	[sharedMusicPlayer loadMusicWithKey:@"dove" soundFile:@"dove-loop.aif"];
	[sharedMusicPlayer loadMusicWithKey:@"intro" soundFile:@"themeIntro.mp3"];
	[sharedMusicPlayer playMusicWithKey:@"intro" timesToRepeat:0];
	
}
//*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
