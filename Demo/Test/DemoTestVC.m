//
//  DemoTestVC.m
//  Demo
//
//  Created by admin2 on 2020/3/16.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DemoTestVC.h"

@interface DemoTestVC ()

@property (strong, nonatomic) IBOutlet UITextField *tf;

@end

@implementation DemoTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tf.secureTextEntry = NO;
//    ss.clearButtonMode = UITextFieldViewModeWhileEditing
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%d   ", self.tf.isSecureTextEntry);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end