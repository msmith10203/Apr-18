//
//  main.m
//  MyPath
//
//  Created by Mike Smith on 4/13/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PathAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:10 inSection:20];
        NSLog(@"section == %d", indexPath.section);
        NSLog(@"row==%d\n\n", indexPath.row);
        
        NSUInteger indexes[] = {10, 20, 30, 40, 50};
        const size_t length = sizeof indexes / sizeof indexes[0];
        indexPath = [NSIndexPath indexPathWithIndexes: indexes length:length];
        for(NSUInteger position=0; position<indexPath.length;++position){
            NSLog(@"index %u == %u", position, [indexPath indexAtPosition:position]);
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PathAppDelegate class]));
    }
}
