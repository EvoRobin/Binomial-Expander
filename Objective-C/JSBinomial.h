//
//  Binomial.h
//  Binomial Expander
//
//  Created by Joaquim Lobo Silva on 06/12/09.
//  Copyright 2009 wakachamo. All rights reserved.
//

#import <Foundation/Foundation.h>

long long JSFactorialFromLong(long long number);
long long JSnCr(long long n, long long k);
NSString *JSExpandBinomial(NSString *x, NSString *y, long long power);
NSString *JSSuperScriptFromNumberString(NSString *originalString);
