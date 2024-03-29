//
//  NSString+DDMathParsing.m
//  DDMathParser
//
//  Created by Dave DeLong on 11/21/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "NSString+DDMathParsing.h"
#import "DDExpression.h"
#import "DDMathEvaluator.h"

@implementation NSString (DDMathParsing)

- (DDMathEvaluatorResult *)numberByEvaluatingString {
	return [self numberByEvaluatingStringWithSubstitutions:nil];
}

- (DDMathEvaluatorResult *)numberByEvaluatingStringWithSubstitutions:(NSDictionary *)substitutions {
	NSError *error = nil;
	NSNumber *returnValue = [self numberByEvaluatingStringWithSubstitutions:substitutions error:&error];
	if (returnValue == nil) {
		NSLog(@"error: %@", error);
	}
	return returnValue;
}

- (DDMathEvaluatorResult *)numberByEvaluatingStringWithSubstitutions:(NSDictionary *)substitutions error:(NSError **)error {
    return [[DDMathEvaluator defaultMathEvaluator] evaluateString:self withSubstitutions:substitutions error:error];
}

@end
