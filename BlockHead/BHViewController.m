//
//  BHViewController.m
//  BlockHead
//
//  Created by Joshua Howland on 6/13/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "BHViewController.h"

@interface BHViewController ()

@property (nonatomic, copy) NSArray *(^stringArray)(NSString *);
@property (nonatomic, copy) void (^someBlock)(int);

@end

@implementation BHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *stringLiteral = @"string";

    
    
    // Block as Local Variable no Return Type
    
    void (^block)() = ^{
        NSLog(@"%@",stringLiteral);
    };

    block();
    
    
    // Block as Local Variable with Return Type
    
    int (^multiply)(int, int) = ^(int one, int two) {
        int multiple = one * two;
        NSLog(@"%d", multiple);
        return multiple;
    };
    
    multiply(5, 4);


    // Property set to a block literal
    
    self.stringArray = ^(NSString *string){
        return @[string];
    };
    
    NSArray *strings = self.stringArray(stringLiteral);
    if ([strings.firstObject isEqualToString:stringLiteral]) {
        NSLog(@"Success");
    }
    
    self.someBlock = ^(int value){
        NSLog(@"%d blocked", value);
    };
    
    self.someBlock(25);
 
    
    // Using blocks as arguments in a method call
    
    [self someMethodThatTakesABlockWithParameter:^(int parameter) {
        NSLog(@"%d integer method called", parameter);
    }];
    
    [self someMethodThatTakesABlock:^{
        NSLog(@"Method without parameter called");
    }];
    
}

// Methods with blocks as the parameter

- (void)someMethodThatTakesABlockWithParameter:(void (^)(int parameter))block {
    block(100);
}

- (void)someMethodThatTakesABlock:(void (^)())block {
    block();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
