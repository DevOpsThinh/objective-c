//
//  ViewController.h
//  RandomNumber
//
//  Created by DevOpsThinh on 9/1/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblNumber;
- (IBAction)btnGenerate:(UIButton *)sender;

@end

