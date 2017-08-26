//
//  CalculatorViewController.m
//  Calculator
//
//  Created by 陳立寬 on 2017/8/26.
//  Copyright © 2017年 陳立寬. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()

@property (nonatomic, strong) NSDecimalNumber* leftOperand;
@property (nonatomic, strong) NSDecimalNumber* rightOperand;
@property (nonatomic, strong) NSString *operatorSelector;
@property (nonatomic, assign) NSUInteger splitPostion;

@end


@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)pushMC:(id)sender
{
    
}

- (IBAction)pushMPlus:(id)sender
{

}

- (IBAction)pushMMinus:(id)sender {
}

- (IBAction)pushMR:(id)sender {
}

- (IBAction)pushC:(id)sender
{
    self.leftOperand = nil;
    self.rightOperand = nil;
    self.operatorSelector = nil;
    self.currentTextField.stringValue = @"";
    self.resultTextField.stringValue = @"0";
}

- (IBAction)pushToggle:(id)sender {
}

- (IBAction)pushDivide:(id)sender
{

}

- (IBAction)pushMultiply:(id)sender
{
    
}

- (IBAction)pushSubstract:(id)sender
{
    
}

- (IBAction)pushAdd:(id)sender
{
    if(self.operatorSelector == nil){
        self.leftOperand = [NSDecimalNumber decimalNumberWithString:self.currentTextField.stringValue];
        self.operatorSelector = @"decimalNumberByAdding:";
        self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString:@"+"];
        self.splitPostion = self.currentTextField.stringValue.length;
    }
    else{
        self.rightOperand = [NSDecimalNumber decimalNumberWithString:[self.currentTextField.stringValue substringFromIndex:self.splitPostion]];
        if(self.rightOperand == nil)
            return;
        self.leftOperand = [self.leftOperand performSelector:NSSelectorFromString(self.operatorSelector) withObject: self.rightOperand];
        self.resultTextField.stringValue = self.leftOperand.stringValue;
        self.currentTextField.stringValue = [self.leftOperand.stringValue stringByAppendingString:@"+"];
        self.operatorSelector = @"decimalNumberByAdding:";
        self.rightOperand = nil;
    }
}

- (IBAction)pushEqual:(id)sender
{

}

- (IBAction)pushPoint:(id)sender
{
    if([self.currentTextField.stringValue containsString:@"."])
        return;
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"."];
}

- (IBAction)push1:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"1";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"1"];
}
- (IBAction)push2:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"2";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"2"];
}
- (IBAction)push3:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"3";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"3"];
}
- (IBAction)push4:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"4";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"4"];
}
- (IBAction)push5:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"5";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"5"];
}
- (IBAction)push6:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"6";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"6"];
}
- (IBAction)push7:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"7";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"7"];
}
- (IBAction)push8:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"8";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"9"];
}
- (IBAction)push9:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"]){
        self.currentTextField.stringValue = @"9";
        return;
    }
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"9"];
}
- (IBAction)push0:(id)sender
{
    if([self.currentTextField.stringValue isEqualToString:@"0"])
        return;
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"0"];
}



@end
