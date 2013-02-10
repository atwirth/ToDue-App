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
@property (nonatomic) NSString *completed;

-(id)initWithName:(NSString *)taskName completed:(NSString *)completed;
-(void)setCompleted:(NSString *)completed;

@end
