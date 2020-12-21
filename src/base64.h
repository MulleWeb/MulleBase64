/*
 *  $Id: base64.h,v 1.2 2005/06/14 10:13:35 sam Exp $
 *  CodeonTAN
 *
 *  Created by Nat! on Fri Sep 19 2003.
 *  Copyright (c) 2003 Codon GmbH. All rights reserved.
 *
 *  $Log: base64.h,v $
 *  Revision 1.2  2005/06/14 10:13:35  sam
 *  New mod with automatic web based pin/tan generation and automatic expiring pins
 *
 *  Revision 1.1.1.1  2003/09/24 11:42:58  nat
 *  Mercyful Release
 *
 *
 */
#ifndef BASE64_H__
#define BASE64_H__


#include <stddef.h>

// this is code originally from Helge Hess, given by his kind permission
// make pretende _destSize parameter removed, as there is no bounds checking!
void   base64_encode( const unsigned char *_src,
                     size_t _srcLen, 
                     unsigned char *_dest,
                     size_t *_destLen,
                     int _maxLineWidth);
int   base64_decode( const unsigned char *_src, 
                     size_t _srcLen, 
                     unsigned char *_dest,
                     size_t *_destLen);

size_t   base64_encoded_size( size_t _srcLen,
                             int _maxLineWidth);
size_t   base64_decoded_maximum_size( size_t dstLen);

#endif

