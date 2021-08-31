//
//  Calculator.m
//  Calculator
//
//  Created by DevOpsThinh on 8/31/21.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumlator;

- (id) init {
    self = [super init];
    if (self) {
        operand1 = [[Fraction alloc]init];
        operand2 = [[Fraction alloc]init];
        accumlator = [[Fraction alloc]init];
    }
    return  self;
}

- (void) clear {
    accumlator.numerator = 0;
    accumlator.denominator = 0;
}

- (Fraction *) performOperation:(char)op {
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
        default:
            break;
    }
    
    accumlator.numerator = result. numerator;
    accumlator.denominator = result.denominator;
    
    return accumlator;
}

@end
