//
//  TableViewController.m
//  Reorder
//
//  Created by nyuguest on 4/13/13.
//  Copyright (c) 2013 nyuguest. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@end

@implementation TableViewController

- (id) initWithStyle: (UITableViewStyle) style
{
	self = [super initWithStyle: style];
	if (self) {
		// Custom initialization
		lines = [NSMutableArray arrayWithObjects:
                 @"T is for the tears she shed to save me",
                 @"M is for the million things she gave me,",
                 @"E is for her eyes, with love-light shining,",
                 @"R means right, & right she’ll always be,",
                 @"H is for her heart of purest gold;",
                 @"O means only that she’s growing old,",
                 
                 //Put them all together, they spell MOTHER,
                 //A word that means the world to me.
                 //--Howard Johnson
                 nil
                 ];
	}
	return self;
}

- (void) viewDidLoad
{
	[super viewDidLoad];
    
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
    
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (NSUInteger) supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskLandscapeLeft;
}


#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
	// Return the number of sections.
	return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
	// Return the number of rows in the section.
	return lines.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
	static NSString *CellIdentifier = @"Reorder";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
	}
    
	// Configure the cell...
	cell.textLabel.text = [lines objectAtIndex: indexPath.row];
	return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL) tableView: (UITableView *) tableView canEditRowAtIndexPath: (NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */


// Override to support rearranging the table view.
- (void) tableView: (UITableView *) tableView moveRowAtIndexPath: (NSIndexPath *) fromIndexPath toIndexPath: (NSIndexPath *)toIndexPath
{
	NSString *line = [lines objectAtIndex: fromIndexPath.row];
	[lines removeObjectAtIndex: fromIndexPath.row];
	[lines insertObject: line atIndex: toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
// Every line except T and H is rearrangeable.
- (BOOL) tableView: (UITableView *) tableView canMoveRowAtIndexPath: (NSIndexPath *) indexPath
{
	// Return NO if you do not want the item to be re-orderable.
	UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
	NSString *text = cell.textLabel.text;
	NSString *initial = [text substringToIndex: 1];
    
	return ![initial isEqualToString: @"T"] && ![initial isEqualToString: @"H"];
    
}


#pragma mark - Table view delegate

- (UITableViewCellEditingStyle) tableView: (UITableView *) tableView
			editingStyleForRowAtIndexPath: (NSIndexPath *) indexPath
{
	//No red minus signs or green plus signs.
	return UITableViewCellEditingStyleNone;
}


- (BOOL) tableView: (UITableView *) tableView shouldIndentWhileEditingRowAtIndexPath: (NSIndexPath *) indexPath
{
	//Since there are no red minuses or green plusses,
	//there's no reason to indent to make room for them.
	return NO;
}


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
	// Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName: @"<#Nib name#>" bundle: nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController: detailViewController animated: YES];
     */
}

@end
