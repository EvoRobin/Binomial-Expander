# Binomial Expander

Expands a binomial equation using the [Binomial theorem](http://en.wikipedia.org/wiki/Binomial_theorem "Binomial theorem").
In other words, it can do this:

![Example binomial being solved]("http://upload.wikimedia.org/math/1/f/6/1f6e45224b3aba34afe533831f4e7b89.png")

## Usage

The syntax is pretty simple.

Suppose you have a binomial:
![Example binomial]("http://gyazo.com/d3219f4eb69c21d41f03a116830ca2ee.png")

Java:
	String solvedBinomial = expandBinomial("x", "y", y);

Objective-C:
	#import "JSBinomial.h"
	
	NSString *solvedBinomial = JSExpandBinomial(@"x", @"y", y);
