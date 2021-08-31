//
//  Fraction.h
//  Calculator
//
//  Created by DevOpsThinh on 8/31/21.
//
#import <UIKit/UIKit.h>
#ifndef Fraction_h
#define Fraction_h

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
- (void) setTo: (int) n over: (int) d;
- (Fraction *) add: (Fraction *) f;
- (Fraction *) subtract: (Fraction *) f;
- (Fraction *) divide: (Fraction *) f;
- (Fraction *) multiply: (Fraction *) f;
- (void) reduce;
- (double) converToNum;
- (NSString *) converToString;
@end

#endif /* Fraction_h */
