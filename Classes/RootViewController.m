//
//  RootViewController.m
//  MusicPlayer
//
//  Created by Raúl Uranga on 1/27/11.
//  Copyright 2011 GrupoW. All rights reserved.
//

#import "RootViewController.h"
#import "MusicPlayer.h"

// Private methods
@interface RootViewController ()
-(void)parseXML:(NSString*)source;
@end

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

//*/
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	sharedMusicPlayer = [MusicPlayer sharedMusicPlayer];
	
	NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"playlist" ofType:@"xml"] encoding:NSUTF8StringEncoding error:&error];
	
	[self parseXML:content];
	
	/*/
	NSArray *results = [xmlDocument nodesForXPath:@"/playlist/trackList/track[1]" error:&error];
	NSLog(@"%@",results);
	NSLog(@"%i",results.count);
	//*/
}
//*/

-(void)parseXML:(NSString*)source {
	
	NSError *error = nil;
	
	xmlDocument = [[DDXMLDocument alloc] initWithXMLString:source options:0 error:&error];
	
	NSArray *results = [xmlDocument nodesForXPath:@"//track" error:&error];
	
	for (DDXMLElement *track in results) {
		NSString *name = [[track childAtIndex:0] stringValue];
		NSString *location = [[track childAtIndex:2] stringValue];
		NSLog(@"%@ : %@",name,location);
		[sharedMusicPlayer loadMusicWithKey:name soundFile:location];
	}
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSError *error = nil;
	NSArray *results = [xmlDocument nodesForXPath:@"//track" error:&error];
    return results.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
   	
	//indexPath.row
	NSString *xpath = [NSString stringWithFormat:@"/playlist/trackList/track[%i]",(indexPath.row + 1)];
	NSError *error = nil;
	NSArray *results = [xmlDocument nodesForXPath:xpath error:&error];
	DDXMLElement *track = [results objectAtIndex:0];
	//DDXMLNode *node = [book childAtIndex:0];
	
	// Configure the cell.
	cell.textLabel.text = [[track childAtIndex:0] stringValue];
	cell.detailTextLabel.text = [[track childAtIndex:1] stringValue];
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	NSString *xpath = [NSString stringWithFormat:@"/playlist/trackList/track[%i]",(indexPath.row + 1)];
	NSError *error = nil;
	NSArray *results = [xmlDocument nodesForXPath:xpath error:&error];
	DDXMLElement *track = [results objectAtIndex:0];
	DDXMLNode *title = [track childAtIndex:0];
	
	[sharedMusicPlayer playMusicWithKey:[title stringValue] timesToRepeat:0];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

