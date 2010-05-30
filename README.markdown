# Binomial Expander

Expands a binomial equation using the [Binomial theorem](http://en.wikipedia.org/wiki/Binomial_theorem "Binomial theorem").
In other words, it can do this:

![http://upload.wikimedia.org/math/1/f/6/1f6e45224b3aba34afe533831f4e7b89.png]("Example binomial being solved")

## Usage

The syntax is pretty simple.

Suppose you have a binomial:
![http://gyazo.com/d3219f4eb69c21d41f03a116830ca2ee.png]("Example binomial")

Java:
	String solvedBinomial = expandBinomial("x", "y", y);

Objective-C:
	#import "JSBinomial.h"
	
	NSString *solvedBinomial = JSExpandBinomial(@"x", @"y", y);
