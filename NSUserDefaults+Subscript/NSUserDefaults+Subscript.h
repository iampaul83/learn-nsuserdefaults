//
//  NSUserDefaults+Subscript.h
//  NSUserDefaults
//
//  Created by Paul on 4/8/15.
//  Copyright (c) 2015 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UserDefault(key) [NSUserDefaults standardUserDefaults][key]
#define UserDefaultSet(key, value) [NSUserDefaults standardUserDefaults][key] = value

@interface NSUserDefaults (Subscript)

- (id)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;

@end
