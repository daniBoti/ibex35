//
//  DetailValorViewController.h
//  Ibex 35
//
//  Created by Dani on 15/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Valor.h"

@interface DetailValorViewController : UIViewController

@property (strong, nonatomic) Valor *valor;
@property (weak, nonatomic) IBOutlet UILabel *lastLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *varLabel;
@property (weak, nonatomic) IBOutlet UILabel *varEurLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;

@end
