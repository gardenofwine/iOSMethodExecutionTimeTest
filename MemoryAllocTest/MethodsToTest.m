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
    NSArray *arr = [[NSArray alloc] init];
    [arr count];
}
-(void)test2{
    NSArray *arr = [NSArray arrayWithObjects:@"1",nil];
    [arr count];
}
-(void)test3{
    
}
-(void)test4{
    
}

@end
