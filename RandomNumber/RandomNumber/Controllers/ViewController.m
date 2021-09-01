//
//  ViewController.m
//  RandomNumber
//
//  Created by DevOpsThinh on 9/1/21.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnGenerate:(UIButton *)sender {
    int randomNumber = (arc4random() % 100) + 1;
    self.lblNumber.text = [NSString stringWithFormat: @"%i", randomNumber];
}
@end
