//
//  NSObject+Expand.m
//  RunTimeApply
//
//  Created by 王晓东 on 16/2/24.
//  Copyright © 2016年 Ericdong. All rights reserved.
//

#import "NSObject+Expand.h"
#import <objc/runtime.h>

@implementation NSObject (Expand)
/**
 *  获取类名字符串
 *
 *  @return 类名字符串
 */
+(NSString *)getClass {
    Class class = [self class];
    return NSStringFromClass(class);
}
/**
 *  获取类中的所有的属性
 *
 *  @return 属性数组
 */
- (NSArray *)getPropertys {
    NSMutableArray *propertyArr = [NSMutableArray array];
    u_int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = ivar_getName(ivars[i]);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        [propertyArr addObject:propertyName];
    }
    return propertyArr;
}
/**
 *  判断类中是否有该属性
 *
 *  @param property 属性名称
 *
 *  @return 判断结果
 */
- (BOOL)hasProperty:(NSString *)property {
    BOOL flag = NO;
    u_int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = ivar_getName(ivars[i]);
        NSString *propertyString = [NSString stringWithUTF8String:propertyName];
        if ([propertyString isEqualToString:property]) {
            flag = YES;
        }
    }
    return flag;
}
@end
