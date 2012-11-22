//
//  MethodsToTest.m
//  MemoryAllocTest
//
//  Created by Benny on 11/22/12.
//  Copyright (c) 2012 gardenofwine. All rights reserved.
//

#import "MethodsToTest.h"

@implementation MethodsToTest


-(void)test1{
    for (int i = 0 ; i < 10000; i++) {
        NSArray *arr = [[NSArray alloc] initWithObjects:@"1", nil];
        [arr count];
        arr = nil;
    }
}
-(void)test2{
    for (int i = 0 ; i < 10000; i++) {
        NSArray *arr = [NSArray arrayWithObjects:@"1",nil];
        [arr count];
        arr = nil;
    }
}
-(void)test3{
    
}
-(void)test4{
    
}

@end
