//
//  MyTableViewController.m
//  MyGoner
//
//  Created by Mike Smith on 4/17/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        characters = [NSMutableArray arrayWithObjects:
                      @"Scarlett O’Hara",	//apostrophe: Unicode \u2019
                      @"Rhett Butler",
                      @"Ashley Wilkes",
                      @"Melanie Hamilton",
                      @"Scarlett’s father",
                      @"Scarlett’s mother",
                      @"Mammy (Scarlett’s slave)",
                      @"Big Sam (Scarlett’s slave)",
                      @"Charles Hamilton (1st husband)",
                      @"Frank Kennedy (2nd husband)",
                      @"Bonnie Butler (S’s daughter)",
                      @"Belle Watling",
                      nil
                      ];
        
        doomed = [NSSet setWithObjects:
                         @"Melanie Hamilton",
                         @"Scarlett’s father",
                         @"Scarlett’s mother",
                         @"Charles Hamilton (1st husband)",
                         @"Frank Kennedy (2nd husband)",
                         @"Bonnie Butler (S’s daughter)",
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
    
	//Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
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
	return characters.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
	static NSString *cellIdentifier = @"characters";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
	}
    
	// Configure the cell...
	cell.textLabel.text = [characters objectAtIndex: indexPath.row];
	return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath: (NSIndexPath *) indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		// Delete the row from the data source
		// Delete the row from the data source
		[characters removeObjectAtIndex: indexPath.row];
		[tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationLeft];//UITableViewRowAnimationFade];
	}
	else if (editingStyle == UITableViewCellEditingStyleInsert) {
		// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}
}


/*
 // Override to support rearranging the table view.
 - (void) tableView: (UITableView *) tableView moveRowAtIndexPath: (NSIndexPath *) fromIndexPath toIndexPath: (NSIndexPath *) toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL) tableView: (UITableView *) tableView canMoveRowAtIndexPath: (NSIndexPath *) indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (UITableViewCellEditingStyle) tableView: (UITableView *) tableView
            editingStyleForRowAtIndexPath: (NSIndexPath *) indexPath
{
    
    
	UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
	NSString *text = cell.textLabel.text;
	if ([doomed containsObject: text]) {
		return UITableViewCellEditingStyleDelete;
	}
	return UITableViewCellEditingStyleNone;
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
