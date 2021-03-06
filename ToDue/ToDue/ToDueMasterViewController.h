//
//  ToDueMasterViewController.h
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDueDataController;

@interface ToDueMasterViewController : UITableViewController

@property (strong, nonatomic) ToDueDataController *dataController;

-(IBAction)done:(UIStoryboardSegue *)segue;
-(IBAction)cancel:(UIStoryboardSegue *)segue;

@end
