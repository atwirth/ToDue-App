//
//  ToDueDataController.h
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tasks;


@interface ToDueDataController : NSObject



@property (nonatomic, copy) NSMutableArray *masterTaskList;

- (NSUInteger)countOfList;
- (Tasks *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addTaskWithTask:(Tasks *)newTask;
- (void)removeItem:(Tasks *)task;



@end
