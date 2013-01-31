//
//  Tasks.h
//  ToDue
//
//  Created by Andrew Wirth on 1/31/13.
//  Copyright (c) 2013 Andrew Wirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject

@property (weak, nonatomic) NSString *taskName;

-(id)initWithName:(NSString *)taskName;

@end
