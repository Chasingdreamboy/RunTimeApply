//
//  NSObject+Expand.h
//  RunTimeApply
//
//  Created by 王晓东 on 16/2/24.
//  Copyright © 2016年 Ericdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Expand)
- (NSArray *)getPropertys;
+(NSString *)getClass;
- (BOOL)hasProperty:(NSString *)property;

@end
