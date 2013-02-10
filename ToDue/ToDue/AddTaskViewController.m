    //
//  AddTaskViewController.m
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "AddTaskViewController.h"
#import "Tasks.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController
/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
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

-(BOOL)textFieldShouldReturn: (UITextField *)textField {
    if(textField == self.taskNameInput) {
        [textField resignFirstResponder];
        [self performSegueWithIdentifier:@"ReturnInput" sender:self];
    }
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if([self.taskNameInput.text length]) {
            Tasks *tasking;
            tasking = [[Tasks alloc] initWithName:self.taskNameInput.text completed:@"no"];
            self.tasking = tasking;
            
        }
    }
}



#pragma mark - Table view data source




@end
