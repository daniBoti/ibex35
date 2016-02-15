//
//  DetailValorViewController.m
//  Ibex 35
//
//  Created by Dani on 15/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import "DetailValorViewController.h"

@interface DetailValorViewController ()

@end

@implementation DetailValorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Valor name: %@", self.valor.name);
    self.title = self.valor.name;
    self.lastLabel.text = self.valor.last;
    self.timeLabel.text = self.valor.time;
    self.varLabel.text = self.valor.var;
//    float num = [self.valor.var_euro floatValue];
//    self.varLabel.textColor = (num >0 ? [UIColor greenColor] : [UIColor redColor]);
    self.varEurLabel.text = self.valor.var_euro;
    self.volumeLabel.text = self.valor.volume;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
