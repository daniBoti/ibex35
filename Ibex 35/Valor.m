//
//  Valor.m
//  Ibex 35
//
//  Created by Dani on 15/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import "Valor.h"

@implementation Valor

- (id)initWithName:(NSString *)name andLastValue:(NSString *)last andTime:(NSString *)time andVariation:(NSString *)variation andVariationEur:(NSString *)variationEur andVolume:(NSString *)volume{
    self = [super init];
    
    if (self) {
        _name = name;
        _last = last;
        _time = time;
        _var = variation;
        _var_euro = variationEur;
        _volume = volume;
    }
    
    return self;
}

@end
