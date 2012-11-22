//
//  ViewController.m
//  MemoryAllocTest
//
//  Created by Benny on 11/22/12.
//  Copyright (c) 2012 gardenofwine. All rights reserved.
//

#import "ViewController.h"

#include <mach/mach_time.h>

@interface ViewController ()

@end

@implementation ViewController


-(IBAction)startExecution:(id)sender{
    ((UIButton *)sender).enabled = NO;
    [self performSelectorInBackground:@selector(runTestIndinately) withObject:nil];
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
-(void)runTestIndinately{
    uint64_t averages[] = {0,0,0,0};
    int averagesSamples[] = {0,0,0,0};
    
    int methodIndex = 0;
    while (YES){
        // select method to test
        int methodNumber = (methodIndex % 4);
        methodIndex++;
        
        UILabel *label = [testLabels objectAtIndex:methodNumber];
        SEL methodToRUn = NSSelectorFromString([testMethods objectAtIndex:methodNumber]);
        
        // loop x times over method
        uint64_t start = mach_absolute_time();
        
        // Your code here, loop here, anything to process
        [methodsClass performSelector:methodToRUn withObject:nil];
        
        
        // calculate execution time
        uint64_t end = mach_absolute_time();
        uint64_t elapsed = end - start;
        
        mach_timebase_info_data_t info;
        if (mach_timebase_info (&info) != KERN_SUCCESS) {
            printf ("mach_timebase_info failed\n");
        }
        
        uint64_t nanosecs = elapsed * info.numer / info.denom;
        averages[methodNumber] = (averages[methodNumber] * averagesSamples[methodNumber] + nanosecs) / (averagesSamples[methodNumber] + 1);
        averagesSamples[methodNumber]++;
        
        NSLog(@"Average Time: %f milisecond", averages[methodNumber] / 1000000.0);
        
        // update labels
        [label performSelectorOnMainThread:@selector(setText:) withObject:[NSString stringWithFormat:@"%f", averages[methodNumber] / 1000000.0] waitUntilDone:NO];
        
        // rest for a while
        [NSThread sleepForTimeInterval:0.1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    methodsClass = [MethodsToTest new];
    testLabels = [NSArray arrayWithObjects:
                  self.executionTime1,
                  self.executionTime2,
                  self.executionTime3,
                  self.executionTime4,
                  nil];
    testMethods = [NSArray arrayWithObjects:
                   @"test1",
                   @"test2",
                   @"test3",
                   @"test4",
                   nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
