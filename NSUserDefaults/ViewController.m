//
//  ViewController.m
//  NSUserDefaults
//
//  Created by Paul on 4/8/15.
//  Copyright (c) 2015 Paul. All rights reserved.
//

#import "ViewController.h"
#import "NSUserDefaults+Subscript.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    
    #pragma mark - standard api
    
    [defs setObject:@"Hello NSUserDefaults" forKey:@"hello"];
    NSLog(@"%@", [defs objectForKey:@"hello"]);
    
    [defs setInteger:123 forKey:@"integer"];
    NSLog(@"%ld", [defs integerForKey:@"integer"]);
    NSLog(@"%@", [defs objectForKey:@"integer"]);
    NSLog(@"%ld", [[defs objectForKey:@"integer"] integerValue]);
    
    [defs setDouble:123.321 forKey:@"double"];
    NSLog(@"%f", [defs doubleForKey:@"double"]);
    NSLog(@"%@", [defs objectForKey:@"double"]);
    NSLog(@"%f", [[defs objectForKey:@"double"] doubleValue]);
    
    [defs setBool:NO forKey:@"BOOOOL"];
    NSLog(@"%@", [defs boolForKey:@"BOOOOL"] ? @"YES" : @"NO");
    //
    #warning 這行邏輯錯誤，`[defs objectForKey:@"BOOOOL"]` 只要`BOOOOL`這個key有value，則永遠都是true
    NSLog(@"%@", [defs objectForKey:@"BOOOOL"] ? @"YES" : @"NO");
    //
    NSLog(@"%@", [[defs objectForKey:@"BOOOOL"] boolValue] ? @"YES" : @"NO");
    
    NSMutableArray *mutableArray = @[].mutableCopy;
    [mutableArray addObject:@"1"];
    [mutableArray addObject:@"2"];
    [defs setObject:mutableArray forKey:@"mutable array"];
    //
    #warning NSUserDefaults 取出的資料不是mutable的，因此在這裡是`NSArray`
    NSMutableArray *fetchedMutableArray = [defs objectForKey:@"mutable array"];
    NSLog(@"%@", fetchedMutableArray);
    /* 這行會crash因為 fetchedMutableArray是NSArray不是NSMutableArray
    [fetchedMutableArray addObject:@"3"];
     */
    fetchedMutableArray = [[defs objectForKey:@"mutable array"] mutableCopy];
    [fetchedMutableArray addObject:@"3"];
    NSLog(@"%@", fetchedMutableArray);
    
    
    #pragma mark - subscripting
    
    defs[@"bool"] = @NO;
    NSLog(@"bool: %@",defs[@"bool"] ? @"YES" : @"NO");
    
    defs[@"string"] = @"hello NSUserDefaults";
    NSLog(@"string: %@",defs[@"string"]);
    
    defs[@"array"] = @[@{
                           @"name": @"Paul",
                           @"age" : @25
                        },
                       @{
                           @"name": @"Mandy",
                           @"age" : @25
                        }
                     ];
    NSLog(@"array: %@",defs[@"array"]);
    
    defs[@"dictionary"] = @{@"date": [NSDate date]};
    NSLog(@"dictionary: %@", defs[@"dictionary"]);
    
    defs[@"number"] = @8.8888;
    NSLog(@"number: %@", defs[@"number"]);
    
    #pragma mark - macros
    
    UserDefault(@"using macro") = @"hi";
    NSLog(@"%@", UserDefault(@"using macro"));
    
    UserDefaultSet(@"this is key", @"this is value");
    NSLog(@"%@",UserDefault(@"this is key"));
    
}

@end
