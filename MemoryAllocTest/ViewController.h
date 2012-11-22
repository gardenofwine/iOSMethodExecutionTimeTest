//
//  ViewController.h
//  MemoryAllocTest
//
//  Created by Benny on 11/22/12.
//  Copyright (c) 2012 gardenofwine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MethodsToTest.h"

@interface ViewController : UIViewController{
    
    @private
    NSArray *testMethods;
    NSArray *testLabels;
    MethodsToTest *methodsClass;
}

@property (strong, nonatomic) IBOutlet UILabel *executionTime1;
@property (strong, nonatomic) IBOutlet UILabel *executionTime2;
@property (strong, nonatomic) IBOutlet UILabel *executionTime3;
@property (strong, nonatomic) IBOutlet UILabel *executionTime4;

@end
