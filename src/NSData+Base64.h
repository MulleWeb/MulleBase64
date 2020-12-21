//
//  NSData+Base64.h
//  Dienstag
//
//  Created by Nat! on 20.04.14.
//  Copyright (c) 2014 Codeon GmbH. All rights reserved.
//

#import "import.h"


@interface NSData (Base64)

// use size = 0 to cram it all into line
- (NSData *) base64EncodedDataWithMaxLineWidth:(NSUInteger) size;
- (NSData *) base64EncodedData;
- (NSData *) base64DecodedData;

- (NSString *) base64EncodedDescription;
- (NSString *) base64EncodedUnformattedDescription;

@end
