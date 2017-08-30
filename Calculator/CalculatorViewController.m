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
@property (nonatomic, strong) NSDictionary * opDic;


@end


@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.opDic = [NSDictionary dictionaryWithObjectsAndKeys:
                @"decimalNumberByAdding:", @"+",
                @"decimalNumberBySubtracting:", @"-",
                @"decimalNumberByMultiplyingBy:", @"*",
                @"decimalNumberByDividingBy:", @"/", nil];
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
    [self operation:@"/"];
}

- (IBAction)pushMultiply:(id)sender
{
    [self operation:@"*"];
}

- (IBAction)pushSubstract:(id)sender
{
    [self operation:@"-"];
}
- (void)operation:(NSString *) op
{
    
    if(self.operatorSelector == nil){
        self.leftOperand = [NSDecimalNumber decimalNumberWithString:self.currentTextField.stringValue];
        self.operatorSelector = self.opDic[op];
        self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: op];
        self.splitPostion = self.currentTextField.stringValue.length;
    }
    else if(![self.operatorSelector isEqualToString: self.opDic[op]]){
        return;
    }
    else{
        self.rightOperand = [NSDecimalNumber decimalNumberWithString:[self.currentTextField.stringValue substringFromIndex:self.splitPostion]];
        if(self.rightOperand == nil)
            return;
        if([self.rightOperand.stringValue isEqualToString:@"0"] &&
           [self.operatorSelector isEqualToString:self.opDic[@"/"]]){ //Divided by zero
            NSAlert *alert = [[NSAlert alloc] init];
            alert.messageText = @"Warning";
            alert.informativeText = @"Can not divided by zero";
            [alert addButtonWithTitle:@"OK"];
            [alert runModal];
            return;
        }
        self.leftOperand = [self.leftOperand performSelector:NSSelectorFromString(self.operatorSelector) withObject: self.rightOperand];
        self.resultTextField.stringValue = self.leftOperand.stringValue;
        self.currentTextField.stringValue = [self.leftOperand.stringValue stringByAppendingString: op];
        self.operatorSelector = self.opDic[op];
        self.rightOperand = nil;
    }
}
- (IBAction)pushAdd:(id)sender
{
    [self operation:@"+"];
}

- (IBAction)pushEqual:(id)sender
{
    if(self.operatorSelector == nil){
        return;
    }
    else{
        self.rightOperand = [NSDecimalNumber decimalNumberWithString:[self.currentTextField.stringValue substringFromIndex:self.splitPostion]];
        if(self.rightOperand == nil)
            return;
        if([self.rightOperand.stringValue isEqualToString:@"0"] &&
           [self.operatorSelector isEqualToString:self.opDic[@"/"]]){ //Divided by zero
            NSAlert *alert = [[NSAlert alloc] init];
            alert.messageText = @"Warning";
            alert.informativeText = @"Can not divided by zero";
            [alert addButtonWithTitle:@"OK"];
            [alert runModal];
            return;
        }
        self.leftOperand = [self.leftOperand performSelector:NSSelectorFromString(self.operatorSelector) withObject: self.rightOperand];
        self.resultTextField.stringValue = self.leftOperand.stringValue;
        self.currentTextField.stringValue = self.leftOperand.stringValue;
        self.operatorSelector = nil;
        self.rightOperand = nil;
    }
}

- (IBAction)pushPoint:(id)sender
{
    if([self.currentTextField.stringValue containsString:@"."])
        return;
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"."];
}

- (IBAction)pushDel:(id)sender
{
    if(![self.currentTextField.stringValue isEqualToString:@""]){
        self.currentTextField.stringValue = [ self.currentTextField.stringValue substringWithRange:NSMakeRange(0, self.currentTextField.stringValue.length-1)];
    }
    if([self.currentTextField.stringValue isEqualToString:@""]){
        [self performSelector:@selector(pushMC:) withObject:nil];
    }
    else{
        
        NSString *pattern = @"[0-9]+[+-*/][0-9]+";

        NSError* error = NULL;
        
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
        NSArray* matches = [regex matchesInString:self.currentTextField.stringValue options:0 range: NSMakeRange(0, self.currentTextField.stringValue.length)];
        for (NSTextCheckingResult* match in matches) {
            NSString* matchText = [self.currentTextField.stringValue substringWithRange:[match range]];
            NSLog(@"match: %@", matchText);
            NSRange group1 = [match rangeAtIndex:1];
            NSRange group2 = [match rangeAtIndex:2];
            NSLog(@"group1: %@", [self.currentTextField.stringValue substringWithRange:group1]);
            NSLog(@"group2: %@", [self.currentTextField.stringValue substringWithRange:group2]);
        }
   }
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
    self.currentTextField.stringValue = [self.currentTextField.stringValue stringByAppendingString: @"8"];
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
