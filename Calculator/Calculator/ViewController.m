//
//  ViewController.m
//  Calculator
//
//  Created by DevOpsThinh on 8/30/21.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController  ()

@end

@implementation ViewController {
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    // Override point for customization after app launch
    
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
}

- (void) processDigit: (int) digit {
    currentNumber = currentNumber  * 10 + digit;
    [displayString appendString: [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

- (IBAction) clickDigit: (UIButton *) sender {
    int digit = (int) sender.tag;
    [self processDigit: digit];
}

- (void) processOp:(char) theOp {
    NSString *opStr;
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

- (void) storeFracPart {
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand2.denominator = 1; // ex: 2 * 1/3
        } else {
            myCalculator.operand1.denominator = currentNumber;
        }
    } else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1; // ex: 2/3 * 5
    } else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

- (IBAction) clickOver {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

//MARK: Arithmetic Operation keys
- (IBAction) clickPlus {
    [self processOp: '+'];
}
- (IBAction) clickMinus {
    [self processOp: '-'];
}
- (IBAction) clickMultiply {
    [self processOp: '*'];
}
- (IBAction) clickDivide {
    [self processOp: '/'];
}

// MARK: Misc Keys
- (IBAction) clickEquals {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumlator converToString]];
        display.text = displayString;
        
        currentNumber = 0;
        firstOperand = YES;
        isNumerator = YES;
        [displayString setString: @""];
    }
}

- (IBAction) clickClear {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}

@end
