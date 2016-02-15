//
//  ListaValoresTableViewController.h
//  Ibex 35
//
//  Created by Dani on 08/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaValoresTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *arrayValores;
@property (strong, nonatomic) NSMutableData *dataValores;


@end
