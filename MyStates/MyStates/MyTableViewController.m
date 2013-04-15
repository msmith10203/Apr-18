//
//  MyTableViewController.m
//  MyStates
//
//  Created by Mike Smith on 4/13/13.
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
		states = [NSArray arrayWithObjects:
                  @"Alabama",
                  @"Alaska",
                  @"Arizona",
                  @"Arkansas",
                  @"California",
                  @"Colorado",
                  @"Connecticut",
                  @"Delaware",
                  @"Florida",
                  @"Georgia",
                  @"Hawaii",
                  @"Idaho",
                  @"Illinois",
                  @"Indiana",
                  @"Iowa",
                  @"Kansas",
                  @"Kentucky",
                  @"Louisiana",
                  @"Maine",
                  @"Maryland",
                  @"Massachusetts",
                  @"Michigan",
                  @"Minnesota",
                  @"Mississippi",
                  @"Missouri",
                  @"Montana",
                  @"Nebraska",
                  @"Nevada",
                  @"New Hampshire",
                  @"New Jersey",
                  @"New Mexico",
                  @"New York",
                  @"North Carolina",
                  @"North Dakota",
                  @"Ohio",
                  @"Oklahoma",
                  @"Oregon",
                  @"Pennsylvania",
                  @"Rhode Island",
                  @"South Carolina",
                  @"South Dakota",
                  @"Tennessee",
                  @"Texas",
                  @"Utah",
                  @"Vermont",
                  @"Virginia",
                  @"Washington",
                  @"West Virginia",
                  @"Wisconsin",
                  @"Wyoming",
                  nil
                  ];
        
		//Three default values from class UIScrollView.
		self.tableView.bounces = YES;
		self.tableView.scrollsToTop = YES;
		self.tableView.decelerationRate = UIScrollViewDecelerationRateNormal;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return states.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"states";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier: identifier];
	}
    
	// Configure the cell...
	//The .textLabel and .detailTextLabel properties are UILabels.
	//The .imageView property is a UIImage.
	cell.textLabel.text = [states objectAtIndex: indexPath.row];
	NSString *fileName = [cell.textLabel.text stringByAppendingString: @".jpg"];
	cell.imageView.image = [UIImage imageNamed: fileName];	//nil if .jpg file doesn't exist    
    if ([cell.textLabel.text isEqualToString: @"Wyoming"]) {
		NSLog(@"cell.frame == (%g, %g), %g × %g",
              cell.frame.origin.x,
              cell.frame.origin.y,
              cell.frame.size.width,
              cell.frame.size.height
              );
        
		NSLog(@"font == %@ %g",
              cell.textLabel.font.fontName,
              cell.textLabel.font.pointSize
              );
	}
    cell.detailTextLabel.text = [NSString stringWithFormat:
                                 @"%@ is state number %d of %u",
                                 cell.textLabel.text, indexPath.row + 1, states.count];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    
	cell.accessoryType = cell.accessoryType == UITableViewCellAccessoryNone
    ? UITableViewCellAccessoryCheckmark
    : UITableViewCellAccessoryNone;
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
