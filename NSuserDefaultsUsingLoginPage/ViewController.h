//
//  ViewController.h
//  NSuserDefaultsUsingLoginPage
//
//  Created by test on 1/9/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)saveButton:(id)sender;
- (IBAction)fetchButton:(id)sender;

@end

