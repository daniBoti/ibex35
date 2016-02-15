//
//  Valor.h
//  Ibex 35
//
//  Created by Dani on 15/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Valor : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *last;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *var;
@property (strong, nonatomic) NSString *var_euro;
@property (strong, nonatomic) NSString *volume;

//Methods
-(id)initWithName:(NSString *)name andLastValue:(NSString *)last andTime:(NSString *)time andVariation:(NSString *)variation andVariationEur:(NSString *)variationEur andVolume:(NSString *)volume;

@end
