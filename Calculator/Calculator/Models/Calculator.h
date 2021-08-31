//
//  Calculator.h
//  Calculator
//
//  Created by DevOpsThinh on 8/30/21.
//
#import <UIKit/UIKit.h>
#import "Fraction.h"

#ifndef Calculator_h
#define Calculator_h

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumlator;

- (Fraction *) performOperation: (char) op;
- (void) clear;

@end

#endif /* Calculator_h */
