//
//  Binomial.m
//  Binomial Expander
//
//  Created by Joaquim Lobo Silva on 06/12/09.
//  Copyright 2009 wakachamo. All rights reserved.
//

#import "JSBinomial.h"

long long JSFactorialFromLong(long long number) {
	long long result = 1;
	for (long long i = number; i > 0; i--) {
		result = result * i;
	}
	return result;
}

long long JSnCr(long long n, long long k) {
	if (k == 0) {
		k = n;
	}
	long long f = n - k;
	long long result = JSFactorialFromLong(n) / (JSFactorialFromLong(k) * JSFactorialFromLong(f));
	return result;
}

NSString *JSExpandBinomial(NSString *x, NSString *y, long long power) {
	long long k = 0;
	NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
	BOOL valueOnePresent;
	BOOL valueTwoPresent;
	for (long long i = power + 1; i > 0; i--) {
		[result appendString:@"["];
		if (JSnCr(power, k) != 1) {
			[result appendString:@"("];
			[result appendString:[NSString stringWithFormat:@"%d", JSnCr(power, k)]];
			[result appendString:@")"];
		}
		valueOnePresent = NO;
		if (power-k != 0) {
			valueOnePresent = YES;
			if ((power-k) == 1) {
				[result appendString:x];
			}
			else {
				[result appendString:x];
				[result appendString:JSSuperScriptFromNumberString([NSString stringWithFormat:@"%d", power-k])];
			}
		}
		valueTwoPresent = NO;
		if (k != 0) {
			valueTwoPresent = YES;
			if (valueOnePresent && valueTwoPresent)
				[result appendString:@"."];
			if (k == 1) {
				[result appendString:y];
			}
			else {
				[result appendString:y];
				[result appendString:JSSuperScriptFromNumberString([NSString stringWithFormat:@"%d", k])];
			}
		}
		[result appendString:@"]"];
		if (i != 1) {
			[result appendString:@" + "];
		}
		k++;
	}
	return [result autorelease];
}

NSString *JSSuperScriptFromNumberString(NSString *originalString) {
	NSRange range;
	NSMutableString *result = [[[NSMutableString alloc] initWithString:@""] autorelease];
	for (int i = 0; i < [originalString length]; i++) {
		range = NSMakeRange(i, 1);
		switch ([[originalString substringWithRange:range] intValue]) {
			case 1:
				[result appendString:@"¹"];
				break;
			case 2:
				[result appendString:@"²"];
				break;
			case 3:
				[result appendString:@"³"];
				break;
			case 4:
				[result appendString:@"⁴"];
				break;
			case 5:
				[result appendString:@"⁵"];
				break;
			case 6:
				[result appendString:@"⁶"];
				break;
			case 7:
				[result appendString:@"⁷"];
				break;
			case 8:
				[result appendString:@"⁸"];
				break;
			case 9:
				[result appendString:@"⁹"];
				break;
			case 0:
				[result appendString:@"⁰"];
				break;
			default:
				break;
		}
	}
	return (NSString *)result;
}
