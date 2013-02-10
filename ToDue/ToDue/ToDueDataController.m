//
//  ToDueDataController.m
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "ToDueDataController.h"
#import "Tasks.h"

@interface ToDueDataController ()
- (void)initializeDefaultDataList;
@end

@implementation ToDueDataController

- (void)initializeDefaultDataList {
    NSMutableArray *taskList = [[NSMutableArray alloc] init];
    self.masterTaskList = taskList;
    Tasks *newTaskItem;
    newTaskItem = [[Tasks alloc] initWithName:@"Task #1" completed: @"yes"];
    [self addTaskWithTask:newTaskItem];
   
}

- (void)setMasterTaskList:(NSMutableArray *)newList {
    if (_masterTaskList != newList) {
        _masterTaskList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil; 
}

- (NSUInteger)countOfList {
    return [self.masterTaskList count];
}

- (Tasks *)objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterTaskList objectAtIndex:theIndex];
}

- (void)addTaskWithTask:(Tasks *)newTask{
    [self.masterTaskList addObject:newTask];
}

- (void)removeItem:(Tasks *)task{
    [self.masterTaskList removeObjectIdenticalTo:task];
}


@end
