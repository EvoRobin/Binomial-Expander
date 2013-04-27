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
	
	NSMutableString *result = [NSMutableString string];
	
	NSMutableString *xVariable = [NSMutableString stringWithString:x];
	NSMutableString *yVariable = [NSMutableString stringWithString:y];
	
	double xCoeff = 1;
	double yCoeff = 1;
	
	NSScanner *xScanner = [[NSScanner alloc] initWithString:xVariable];
	NSScanner *yScanner = [[NSScanner alloc] initWithString:yVariable];
	xScanner.locale = [NSLocale currentLocale];
	yScanner.locale = [NSLocale currentLocale];
	
	if (![xScanner scanDouble:&xCoeff]) xCoeff = 1;
	if (![yScanner scanDouble:&yCoeff]) yCoeff = 1;
	
	[xScanner release];
	[yScanner release];
	
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	formatter.maximumSignificantDigits = NSUIntegerMax;
	
	NSString *xCoeffString = [formatter stringFromNumber:@(xCoeff)];
	NSString *yCoeffString = [formatter stringFromNumber:@(yCoeff)];
	
	[xVariable replaceOccurrencesOfString:xCoeffString withString:@"" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, xVariable.length)];
	[yVariable replaceOccurrencesOfString:yCoeffString withString:@"" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, yVariable.length)];
	
	if ([xVariable isEqualToString:yVariable]) {
		double addedCoeff = xCoeff + yCoeff;
		double powCoeff = pow(addedCoeff, power);
		return [NSString stringWithFormat:@"%@%@%@", [formatter stringFromNumber:@(powCoeff)], xVariable, JSSuperScriptFromNumberString([NSString stringWithFormat:@"%lld", power])];
	}
	
	int n = power;
	for (int k = 0; k <= n; k++) {
		//Get nCr part
		long long nCrPart = JSnCr(n, k);
		
		//Get x-power and expanded coefficient
		long long xPower = n - k;
		double xMultCoeff = pow(xCoeff, xPower);
		
		//Get y-power and expanded coefficient
		long long yPower = k;
		double yMultCoeff = pow(yCoeff, yPower);
		
		//Get the final, expanded coefficient
		double finalCoeff = nCrPart * xMultCoeff * yMultCoeff;
		
		NSString *finalCoeffString = [formatter stringFromNumber:@(finalCoeff)];
		if (finalCoeff == 1.0) finalCoeffString = @"";
		else if (finalCoeff == -1.0) finalCoeffString = @"-";
		
		[result appendString:finalCoeffString];
		if (xPower != 0) {
			[result appendString:xVariable];
			if (xPower != 1) [result appendString:JSSuperScriptFromNumberString([NSString stringWithFormat:@"%lld", xPower])];
		}
		if (yPower != 0) {
			[result appendString:yVariable];
			if (yPower != 1) [result appendString:JSSuperScriptFromNumberString([NSString stringWithFormat:@"%lld", yPower])];
		}
		
		if (k != n) [result appendString:@" + "];
	}
	
	[formatter release];
	
	return result;
}

NSString *JSSuperScriptFromNumberString(NSString *originalString) {
	NSRange range;
	NSMutableString *result = [[[NSMutableString alloc] initWithString:@""] autorelease];
	for (int i = 0; i < [originalString length]; i++) {
		range = NSMakeRange(i, 1);
		switch ([[originalString substringWithRange:range] characterAtIndex:0]) {
			case '1':
				[result appendString:@"¹"];
				break;
			case '2':
				[result appendString:@"²"];
				break;
			case '3':
				[result appendString:@"³"];
				break;
			case '4':
				[result appendString:@"⁴"];
				break;
			case '5':
				[result appendString:@"⁵"];
				break;
			case '6':
				[result appendString:@"⁶"];
				break;
			case '7':
				[result appendString:@"⁷"];
				break;
			case '8':
				[result appendString:@"⁸"];
				break;
			case '9':
				[result appendString:@"⁹"];
				break;
			case '0':
				[result appendString:@"⁰"];
				break;
			default:
				break;
		}
	}
	//[pool drain];
	return (NSString *)result;
}
