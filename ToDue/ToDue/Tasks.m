//
//  Tasks.m
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks

-(id)initWithName:(NSString *)taskName completed:(NSString *)completed
{
    self = [super init];
    if (self) {
        _taskName = taskName;
        _completed =  @"no";
        return self;
    }
    return nil;
}

-(void)setCompleted:(NSString *)completed
{
    
    if ([completed isEqual: @"yes"]) {
        _completed = @"no";
    }
    else if ([completed isEqual: @"no"]){
        _completed = @"yes";
    }
        }

@end
