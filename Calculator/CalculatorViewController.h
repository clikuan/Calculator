//
//  CalculatorViewController.h
//  Calculator
//
//  Created by 陳立寬 on 2017/8/26.
//  Copyright © 2017年 陳立寬. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CalculatorViewController : NSViewController

@property (weak) IBOutlet NSTextField *resultTextField;
@property (weak) IBOutlet NSTextField *currentTextField;


- (IBAction)pushMC:(id)sender;
- (IBAction)pushMPlus:(id)sender;
- (IBAction)pushMMinus:(id)sender;
- (IBAction)pushMR:(id)sender;
- (IBAction)pushC:(id)sender;
- (IBAction)pushToggle:(id)sender;
- (IBAction)pushDivide:(id)sender;
- (IBAction)pushMultiply:(id)sender;
- (IBAction)pushSubstract:(id)sender;
- (IBAction)pushAdd:(id)sender;
- (IBAction)pushEqual:(id)sender;
- (IBAction)pushPoint:(id)sender;
- (IBAction)pushDel:(id)sender;
- (IBAction)pushAc:(id)sender;
- (IBAction)pushRoot:(id)sender;

- (IBAction)push1:(id)sender;
- (IBAction)push2:(id)sender;
- (IBAction)push3:(id)sender;
- (IBAction)push4:(id)sender;
- (IBAction)push5:(id)sender;
- (IBAction)push6:(id)sender;
- (IBAction)push7:(id)sender;
- (IBAction)push8:(id)sender;
- (IBAction)push9:(id)sender;
- (IBAction)push0:(id)sender;





@end

