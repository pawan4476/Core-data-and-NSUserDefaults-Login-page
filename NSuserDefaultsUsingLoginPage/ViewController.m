//
//  ViewController.m
//  NSuserDefaultsUsingLoginPage
//
//  Created by test on 1/9/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController ()
{
    NSString *datastring;
    NSString *dataString2;
    NSIndexPath *path;
    BOOL find;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    find = NO;
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext *)managedContext {
    AppDelegate *appdelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
    return context;
    
}


- (IBAction)saveButton:(id)sender {
//  
//    
//    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
//    [pref setObject:self.userNameTF.text forKey:@"userName"];
//    [pref setObject:self.passwordTF.text forKey:@"password"];
//    [pref synchronize];
    
    NSManagedObjectContext *context = [self managedContext];
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Login" inManagedObjectContext:context];
    [object setValue:self.userNameTF.text forKey:@"userName"];
    [object setValue:self.passwordTF.text forKey:@"password"];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"data is not saved");
    } else {
        NSLog(@"data is saved");
    }
    
    
}

- (IBAction)fetchButton:(id)sender {
    
    NSManagedObjectContext *context = [self managedContext];
    NSFetchRequest *req = [[NSFetchRequest alloc]initWithEntityName:@"Login"];
    NSArray *values = [[NSArray alloc]initWithArray:[context executeFetchRequest:req error:nil]];
    for (int i = 0; i < values.count; i++) {
        
    NSManagedObject *obj = values[i];
        
    if ([self.userNameTF.text isEqualToString:[obj valueForKey:@"userName"]]  && [self.passwordTF.text isEqualToString:[obj valueForKey:@"password"]]) {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ViewController2 *vc = [board instantiateViewControllerWithIdentifier:@"ViewController2"];
                [self presentViewController:vc animated:YES completion:nil];
        find = YES;
        
            }
    else{
        
        find = NO;
    }
    }
        
    if (find == NO) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Invalid Username or password" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
    }
    
    
//    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
//    if ([self.userNameTF.text isEqualToString:[pref objectForKey:@"userName"]]  && [self.passwordTF.text isEqualToString:[pref objectForKey:@"password"]]) {
////        [self performSegueWithIdentifier:@"pass" sender:self];
//        
//        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        ViewController2 *vc = [board instantiateViewControllerWithIdentifier:@"ViewController2"];
//        [self presentViewController:vc animated:YES completion:nil];
//        
//    } else {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Invalid Username or password" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:ok];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
}
@end
