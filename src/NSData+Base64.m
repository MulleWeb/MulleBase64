//
//  NSData+Base64.m
//  Dienstag
//
//  Created by Nat! on 20.04.14.
//  Copyright (c) 2014 Codeon GmbH. All rights reserved.
//

#import "NSData+Base64.h"

#include "base64.h"

#import "import-private.h"
#include <assert.h>  // ValueFoundation does not have NSParameterAssert

@implementation NSData (Base64)

- (NSData *) base64EncodedDataWithMaxLineWidth:(NSUInteger) size
{
   NSMutableData   *data;
   size_t          srcLen;
   size_t          dstLen;
   size_t          finalLen;
   
   srcLen = [self length];
   dstLen = base64_encoded_size( srcLen, (int) size);
   data   = [NSMutableData dataWithLength:dstLen];
   base64_encode( [self bytes], srcLen,
                  [data mutableBytes],
                  &finalLen,
                  (int) size);

   if( finalLen > dstLen)
      abort();
   
   [data setLength:finalLen];
   return( data);
}


- (NSData *) base64EncodedData
{
   return( [self base64EncodedDataWithMaxLineWidth:72]);  // seems to be standard
}


- (NSString *) base64EncodedDescription
{
   NSData   *data;
   
   data = [self base64EncodedData];
   if( ! data)
      return( nil);
   
   return( [[[NSString alloc] initWithData:data
                                  encoding:NSASCIIStringEncoding] autorelease]);
}


- (NSString *) base64EncodedUnformattedDescription
{
   NSData   *data;
   
   data = [self base64EncodedDataWithMaxLineWidth:0];
   if( ! data)
      return( nil);
   
   return( [[[NSString alloc] initWithData:data
                                  encoding:NSASCIIStringEncoding] autorelease]);
}


- (NSData *) base64DecodedData
{
   NSMutableData   *data;
   size_t          srcLen;
   size_t          dstLen;
   size_t          finalLen;
   
   srcLen = [self length];
   dstLen = base64_decoded_maximum_size( srcLen);
   
   data = [NSMutableData dataWithLength:dstLen];
   if( base64_decode( [self bytes], srcLen,
                      [data mutableBytes],
                      &finalLen))
      return( nil);

   assert( finalLen <= dstLen);
   [data setLength:finalLen];
   return( data);
}

@end
