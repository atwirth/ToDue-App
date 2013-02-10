//
//  ToDueMasterViewController.m
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "ToDueMasterViewController.h"
#import "ToDueDataController.h"
#import "Tasks.h"
#import "ToDueDetailViewController.h"
#import "AddTaskViewController.h"

@interface ToDueMasterViewController () {
   
    
}
@end

@implementation ToDueMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dataController = [[ToDueDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem.accessibilityHint = @"Adds a new task event";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:app];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    
    paths = [[NSMutableArray alloc] initWithObjects:self.dataController.masterTaskList, nil];
    [paths writeToFile:plistPath atomically:YES];
    
    
    if ([fileManager fileExistsAtPath:plistPath] == YES)
    {
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:plistPath];
        [self.dataController.masterTaskList setArray:array];      
        
    }
}

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    NSLog(@"Entering Background");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    [[NSDictionary dictionaryWithObjectsAndKeys:self.dataController.masterTaskList, @"text", nil] writeToFile:plistPath atomically:YES];
}

- (IBAction)setEditMode:(UIBarButtonItem *)sender {
    if (self.editing) {
        sender.title = @"Edit";
        [super setEditing:NO animated:YES];
    } else {
        sender.title = @"Done";
        [super setEditing:YES animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"taskCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Tasks *taskAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:taskAtIndex.taskName];

   
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
    }
}

-(IBAction)done:(UIStoryboardSegue *)segue
{
    if([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
    
        
        AddTaskViewController *addController = [segue sourceViewController];
        if (addController.tasking) {
            [self.dataController addTaskWithTask:addController.tasking];
            NSLog(@"%lu", (unsigned long)self.dataController.countOfList);
            [[self tableView] reloadData];
        
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
}

-(IBAction)cancel:(UIStoryboardSegue *)segue
{
    if([[segue identifier] isEqualToString:@"CancelInput"]) {
        
        [self dismissViewControllerAnimated:YES  completion:NULL];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%@", indexPath);
        ToDueDataController *data = [[ToDueDataController alloc] init];
        NSMutableArray *items = [data masterTaskList];
        Tasks *task = [items objectAtIndex:indexPath.row];
        NSLog(@"%@", task.taskName);
        NSLog(@"%@", task.completed);
        NSLog(@"Count before = %lu", (unsigned long)data.masterTaskList.count);
        
        [data removeItem:task];
        
        NSLog(@"Count after = %lu", (unsigned long)data.masterTaskList.count);
        
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];
        

        
        
    }
    [tableView reloadData];


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSMutableArray *list = self.dataController.masterTaskList;
    Tasks *task = [list objectAtIndex:indexPath.row];
    
    
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [cell.textLabel setTextColor:[UIColor redColor]];
        [task setCompleted:task.completed];
                
    }
    else if (cell.accessoryType ==UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell.textLabel setTextColor:[UIColor blackColor]];
        [task setCompleted:task.completed];
    }
}






@end
