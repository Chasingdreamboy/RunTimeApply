//
//  Student.m
//  RunTimeApply
//
//  Created by 王晓东 on 16/2/24.
//  Copyright © 2016年 Ericdong. All rights reserved.
//

#import "Student.h"

@implementation Student
{
    NSString *_wife;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _wife = @"潘金莲";
    }
    return self;
}
@end
