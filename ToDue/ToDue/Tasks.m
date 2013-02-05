//
//  Tasks.m
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks

-(id)initWithName:(NSString *)taskName
{
    self = [super init];
    if (self) {
        _taskName = taskName;
        return self;
    }
    return nil;
}

@end
