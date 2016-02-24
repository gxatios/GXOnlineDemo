//
//  OnePrototypeViewController.m
//  GXOnlineDemo
//
//  Created by Gx on 15/12/23.
//  Copyright © 2015年 xin gao. All rights reserved.
//

#import "OnePrototypeViewController.h"
#import "HCDCalcuteFactory.h"

#import "Gx_OneCreate.h"
#import "Gx_FacateOne.h"
#import "Gx_FacateTwo.h"

@interface OnePrototypeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberA;
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberB;
@property (weak, nonatomic) IBOutlet UILabel *resultTextfield;

@end

@implementation OnePrototypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    id<HCDCalculate> cal;
    
    cal =[HCDCalcuteFactory createCalcute:self.countTextField.text];
    cal.numberA = [self.numberA.text floatValue];
    cal.numberB = [self.numberB.text floatValue];
    CGFloat result =  [cal calculate];
    //NSLog(@"结%@")
    self.resultTextfield.text = [@(result) stringValue];
    
    Gx_OneCreate *createOne = [[Gx_FacateOne alloc] init];
    Gx_OneCreate *createTwo = [[Gx_FacateTwo alloc] init];
    
    [createOne create];
    [createTwo create];
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
