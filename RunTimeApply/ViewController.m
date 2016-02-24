//
//  ViewController.m
//  RunTimeApply
//
//  Created by 王晓东 on 16/2/24.
//  Copyright © 2016年 Ericdong. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Expand.h"
#import "Student.h"
@interface ViewController ()
@property (strong, nonatomic) UITextField *txtUserName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //修改UITextField的_clearButton
    self.txtUserName = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    self.txtUserName.backgroundColor = [UIColor greenColor];
    _txtUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    NSLog(@"UITextField has properties:%@", [_txtUserName getPropertys]);
    UIButton *clearButton = [_txtUserName valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateHighlighted];
    [self.view addSubview:_txtUserName];
    
//    //获取私有属性
    Student *student = [[Student alloc] init];
    student.name = @"武大郎";
    if ([student hasProperty:@"_wife"]) {
        NSLog(@"%@有老婆， 她是：%@", student.name, [student valueForKey:@"_wife"]);
        [student setValue:@"西门庆" forKey:@"_wife"];
    } else {
        NSLog(@"%@没有老婆", student.name);
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
