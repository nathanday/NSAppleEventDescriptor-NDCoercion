/*
 main.m
 NSAppleEventDescriptor+NDScriptData
 
 Created by Nathan Day on 24/07/11.
 Copyright 2011 Nathan Day. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "NSAppleEventDescriptor+NDCoercion.h"

static NSString			* const kTestAppleScript = @"return {alph:\"Albert\", beta:2, gama:{3, true, \"Gary\", alias \"Laptop HD:Applications:\"}}";

static void testBasicCoercion();

int main (int argc, const char * argv[])
{
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	testBasicCoercion();
	[pool drain];
	return 0;
}

void testBasicCoercion()
{
	NSAppleScript				* theScript = [[NSAppleScript alloc] initWithSource:kTestAppleScript];
	NSDictionary				* theErrorDictionary = nil;
	NSAppleEventDescriptor		* theResult = [theScript executeAndReturnError:&theErrorDictionary];
	NSLog( @"Got result: %@", theResult.objectValue  );
	
	[theScript release];
}
