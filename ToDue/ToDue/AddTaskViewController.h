//
//  AddTaskViewController.h
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tasks;

@interface AddTaskViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *taskNameInput;

@property (strong, nonatomic) Tasks *taskName;

@end
