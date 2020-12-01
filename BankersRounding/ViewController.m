//
//  ViewController.m
//  BankersRounding
//
//  Created by Justin Steffen on 12/1/20.
//  Copyright © 2020 Justin Steffen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDecimalNumber *increment = [NSDecimalNumber decimalNumberWithMantissa:5 exponent:-2 isNegative:NO];
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithMantissa:10 exponent:-1 isNegative:YES];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:1 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSMutableArray *stringsToLog = [NSMutableArray new];
    while ([number compare:@1] == NSOrderedAscending)
    {
        NSString *logString = [NSString stringWithFormat:@";%@;%@", number, [number decimalNumberByRoundingAccordingToBehavior:handler]];
        
        NSLog(@"%@", logString);
        [stringsToLog addObject:logString];
       
        number = [number decimalNumberByAdding:increment];
    }
    
    self.label.text = [stringsToLog componentsJoinedByString:@"\n"];
}


@end
