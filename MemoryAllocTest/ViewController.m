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

-(void)runTestIndinately{
    uint64_t average = 0;
    int samples = 0;
    while (YES){
        
        // loop x times over method
        uint64_t start = mach_absolute_time();
        
        // Your code here, loop here, anything to process
        
        for (int i = 0 ; i < 10000; i++) {
            // run the method to measure execution time for
            NSArray *arr = [[NSArray alloc] init];
            [arr count];
        }
        // calculate execution time
        uint64_t end = mach_absolute_time();
        uint64_t elapsed = end - start;
        
        mach_timebase_info_data_t info;
        if (mach_timebase_info (&info) != KERN_SUCCESS) {
            printf ("mach_timebase_info failed\n");
        }
        
        uint64_t nanosecs = elapsed * info.numer / info.denom;
        average = (average * samples + nanosecs) / (samples + 1);
        samples++;
        
        NSLog(@"Average Time: %f milisecond", average / 1000000.0);
        
        // update labels
        [self.executionTime performSelectorOnMainThread:@selector(setText:) withObject:[NSString stringWithFormat:@"%f", average / 1000000.0] waitUntilDone:NO];
        
        // rest for a while
        [NSThread sleepForTimeInterval:0.1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
