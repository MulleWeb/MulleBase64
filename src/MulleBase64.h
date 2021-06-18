#import "import.h"

#include <stdint.h>

/*
 *  (c) 2020 mulle-kybernetik-tv <|ORGANIZATION|>
 *
 *  version:  major, minor, patch
 */
#define MULLE_BASE64_VERSION  ((0 << 20) | (0 << 8) | 1)


static inline unsigned int   MulleBase64_get_version_major( void)
{
   return( MULLE_BASE64_VERSION >> 20);
}


static inline unsigned int   MulleBase64_get_version_minor( void)
{
   return( (MULLE_BASE64_VERSION >> 8) & 0xFFF);
}


static inline unsigned int   MulleBase64_get_version_patch( void)
{
   return( MULLE_BASE64_VERSION & 0xFF);
}


extern uint32_t   MulleBase64_get_version( void);

/*
   Add your library headers here for exposure to library
   consumers.
*/
#import "NSData+Base64.h"

