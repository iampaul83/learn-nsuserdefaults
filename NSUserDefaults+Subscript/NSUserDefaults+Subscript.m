//
//  NSUserDefaults+Subscript.m
//  NSUserDefaults
//
//  Created by Paul on 4/8/15.
//  Copyright (c) 2015 Paul. All rights reserved.
//

#import "NSUserDefaults+Subscript.h"

@implementation NSUserDefaults (Subscript)

- (id)objectForKeyedSubscript:(NSString *)key {
    return [self objectForKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key {
    return [self setObject:obj forKey:key];
}

@end