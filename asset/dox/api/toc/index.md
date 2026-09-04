# MulleBase64 Library Documentation for AI

## 1. Introduction & Purpose

**MulleBase64** provides Base64 encoding and decoding functionality for NSData and NSString. Base64 is a widely-used binary-to-text encoding scheme that represents arbitrary binary data using 64 printable ASCII characters, making it ideal for transmission over text-based protocols and safe inclusion in JSON, XML, HTTP headers, and emails.

This library is particularly useful for:
- Encoding binary data for HTTP request/response bodies
- Including images and files in JSON APIs
- Email attachment encoding (MIME Base64)
- Creating data URLs for web content
- Secure token representation in authentication systems
- Cross-platform data serialization

## 2. Key Concepts & Design Philosophy

- **RFC 4648 Compliant**: Standard Base64 encoding with proper padding
- **Line Wrapping**: Optional line wrapping (default 72 chars per RFC 2045 MIME)
- **NSData Categories**: Seamless integration via Objective-C categories
- **Simple API**: Two encoding formats (formatted/unformatted) and decoding
- **Efficient**: Direct byte manipulation without intermediate representations
- **Error Handling**: Returns nil on invalid Base64 input

## 3. Core API & Data Structures

### NSData Category: `NSData (Base64)`

#### Encoding to NSData

- `- (NSData *) base64EncodedDataWithMaxLineWidth:(NSUInteger)size` → `NSData *`
  - Encode binary data as Base64, formatted with line breaks
  - **size**: Line width in characters; 0 = no line breaks
  - Returns NSData containing ASCII Base64 representation
  - Standard MIME wraps at 72 characters per RFC 2045
  - **Expansion**: Output is ~33% larger than input (4/3 ratio)
  - **Use case**: Email attachments, multipart MIME bodies

- `- (NSData *) base64EncodedData` → `NSData *`
  - Encode with default line width of 72 characters
  - Equivalent to `base64EncodedDataWithMaxLineWidth:72`
  - **Use case**: Default-formatted Base64 for most cases

#### Encoding to NSString

- `- (NSString *) base64EncodedDescription` → `NSString *`
  - Encode and convert to NSString with 72-character line breaks
  - Returns autoreleased NSString in ASCII encoding
  - Includes newlines for MIME compliance
  - **Use case**: Pretty-printed Base64 suitable for display

- `- (NSString *) base64EncodedUnformattedDescription` → `NSString *`
  - Encode without line breaks; continuous string
  - Single-line Base64 output
  - **Use case**: Inline data URLs, JSON fields, compact representation

#### Decoding

- `- (NSData *) base64DecodedData` → `NSData *`
  - Decode Base64 data back to binary
  - Accepts both formatted (with newlines) and unformatted input
  - Ignores whitespace and line breaks
  - Returns nil on invalid Base64 (non-Base64 characters, wrong padding)
  - **Use case**: Processing Base64 from APIs, emails, web content

## 4. Performance Characteristics

- **Encoding**: O(n) where n = input data length; typical: 1-10 MB/s
- **Decoding**: O(n) where n = Base64 string length; typical: 1-10 MB/s
- **Memory**: O(m) where m = output size (3n/4 for decode, 4n/3 for encode)
- **Line Wrapping**: Minimal overhead; mostly cosmetic
- **Typical**: < 10ms for 1 MB of data on modern hardware

## 5. AI Usage Recommendations & Patterns

### Pattern 1: Simple Binary-to-String Encoding
Encode binary data for safe transmission:

```objc
NSData *binaryData = [NSData dataWithBytes:buffer length:bufferLen];
NSString *base64String = [binaryData base64EncodedUnformattedDescription];
// Now safe to put in JSON, HTTP headers, etc.
```

### Pattern 2: Formatted Base64 for Display/Email
Use line-wrapped format for readability:

```objc
NSData *largeData = /* ... */;
NSString *formatted = [largeData base64EncodedDescription];
printf("Encoded data:\n%s\n", [formatted UTF8String]);
// Output has line breaks every 72 characters for readability
```

### Pattern 3: Decoding Web Content
Process Base64 from REST APIs or web responses:

```objc
NSString *base64FromAPI = @"SGVsbG8gV29ybGQh"; // From JSON response
NSData *decoded = [[base64FromAPI dataUsingEncoding:NSUTF8StringEncoding] base64DecodedData];

if (decoded) {
    NSString *text = [[NSString alloc] initWithData:decoded encoding:NSUTF8StringEncoding];
    NSLog(@"Decoded: %@", text);
    [text release];
} else {
    NSLog(@"Invalid Base64");
}
```

### Pattern 4: Image Encoding for JSON API
Convert image to Base64 for inclusion in JSON:

```objc
NSData *imageData = /* binary image data */;
NSString *base64Image = [imageData base64EncodedUnformattedDescription];

NSDictionary *payload = @{
    @"user_id": @"123",
    @"image": base64Image,  // Embedded Base64 image
    @"image_type": @"png"
};

NSData *jsonData = [NSJSONSerialization dataWithJSONObject:payload options:0 error:nil];
```

### Pattern 5: Data URL for Web Content
Create data URLs for inline web resources:

```objc
NSData *imageData = /* ... */;
NSString *base64 = [imageData base64EncodedUnformattedDescription];
NSString *dataURL = [NSString stringWithFormat:@"data:image/png;base64,%@", base64];

// Use in HTML or web view:
// <img src="data:image/png;base64,iVBORw0KGgo...">
```

### Pattern 6: Round-Trip Encoding/Decoding
Encode and verify by decoding:

```objc
NSData *original = [NSData dataWithBytes:"Hello World" length:11];

// Encode
NSData *encoded = [original base64EncodedData];
NSLog(@"Encoded: %@", [[NSString alloc] initWithData:encoded encoding:NSASCIIStringEncoding]);

// Decode
NSData *decoded = [encoded base64DecodedData];

// Verify round-trip
if ([original isEqualToData:decoded]) {
    NSLog(@"Round-trip successful!");
}
```

### Common Pitfalls
- **Forgetting to decode**: Remember base64EncodedDescription returns NSString, need to convert to NSData first for decoding
- **Line breaks in inline fields**: Use `base64EncodedUnformattedDescription` for JSON/inline contexts
- **Not checking nil on decode**: Always validate decoded data isn't nil (invalid input)
- **Assuming ASCII encoding**: Base64 output is ASCII-safe but ensure proper encoding handling
- **Performance with huge data**: For files >100MB, consider streaming instead of holding entire data in memory

## 6. Integration Examples

### Example 1: Simple String Encoding
```objc
#import <MulleBase64/MulleBase64.h>

NSString *text = @"Hello, World!";
NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
NSString *base64 = [textData base64EncodedUnformattedDescription];

printf("Original: %s\n", [text UTF8String]);
printf("Encoded:  %s\n", [base64 UTF8String]);
// Output:
// Original: Hello, World!
// Encoded:  SGVsbG8sIFdvcmxkIQ==
```

### Example 2: Decode with Validation
```objc
NSString *userProvidedBase64 = @"SGVsbG8gV29ybGQh";
NSData *base64Data = [userProvidedBase64 dataUsingEncoding:NSASCIIStringEncoding];
NSData *decodedData = [base64Data base64DecodedData];

if (!decodedData) {
    NSLog(@"Error: Invalid Base64 string provided");
    return NO;
}

NSString *decoded = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
NSLog(@"Decoded: %@", decoded);
[decoded release];
return YES;
```

### Example 3: Binary Data Transmission
```objc
@interface BinaryDataTransmitter : NSObject
- (NSString *) encodeForTransmission:(NSData *)binaryData;
- (NSData *) decodeFromTransmission:(NSString *)encodedString;
@end

@implementation BinaryDataTransmitter
- (NSString *) encodeForTransmission:(NSData *)binaryData {
    return [binaryData base64EncodedUnformattedDescription];
}

- (NSData *) decodeFromTransmission:(NSString *)encodedString {
    NSData *base64Data = [encodedString dataUsingEncoding:NSASCIIStringEncoding];
    NSData *decoded = [base64Data base64DecodedData];
    return decoded;
}
@end

// Usage:
BinaryDataTransmitter *transmitter = [[BinaryDataTransmitter new] autorelease];
NSData *binary = [NSData dataWithBytes:"\x00\x01\x02\x03" length:4];
NSString *encoded = [transmitter encodeForTransmission:binary];
printf("Transmitted: %s\n", [encoded UTF8String]); // Output: AAECAw==

NSData *received = [transmitter decodeFromTransmission:encoded];
printf("Received matches original: %s\n", [binary isEqualToData:received] ? "yes" : "no");
```

### Example 4: File Attachment Encoding for Email
```objc
@interface EmailAttachmentEncoder : NSObject
- (NSString *) mimeBase64ForFile:(NSString *)filePath;
@end

@implementation EmailAttachmentEncoder
- (NSString *) mimeBase64ForFile:(NSString *)filePath {
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    if (!fileData) return nil;
    
    // Use formatted (line-wrapped) for MIME compliance
    return [fileData base64EncodedDescription];
}
@end

// Usage:
EmailAttachmentEncoder *encoder = [[EmailAttachmentEncoder new] autorelease];
NSString *mimeAttachment = [encoder mimeBase64ForFile:@"/path/to/image.jpg"];
printf("MIME attachment:\n%s\n", [mimeAttachment UTF8String]);
// Output has lines wrapped at 72 chars for proper MIME formatting
```

### Example 5: Embedded Image in HTML Data URI
```objc
NSData *pngImageData = [NSData dataWithContentsOfFile:@"/path/to/image.png"];
NSString *base64Image = [pngImageData base64EncodedUnformattedDescription];

NSString *htmlContent = [NSString stringWithFormat:
    @"<html><body>"
    @"<img src=\"data:image/png;base64,%@\" />"
    @"</body></html>",
    base64Image];

// Now htmlContent can be displayed in a web view without external image file
```

### Example 6: REST API with Base64 Payload
```objc
@interface APIClient : NSObject
- (void) sendBinaryFile:(NSData *)fileData toEndpoint:(NSString *)endpoint;
@end

@implementation APIClient
- (void) sendBinaryFile:(NSData *)fileData toEndpoint:(NSString *)endpoint {
    NSString *base64Payload = [fileData base64EncodedUnformattedDescription];
    
    NSDictionary *jsonPayload = @{
        @"file_data": base64Payload,
        @"file_size": @([fileData length]),
        @"format": @"base64"
    };
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonPayload options:0 error:nil];
    
    // Send jsonData via HTTP POST to endpoint
    NSLog(@"Sending %lu bytes of file data in Base64 format", [fileData length]);
}
@end
```

### Example 7: Stream Processing Large Files
```objc
// For very large files, process in chunks rather than all at once
- (NSString *) encodeFileInChunks:(NSString *)filePath chunkSize:(NSUInteger)chunkSize {
    NSMutableString *result = [NSMutableString string];
    NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:filePath];
    
    while (YES) {
        NSData *chunk = [file readDataOfLength:chunkSize];
        if ([chunk length] == 0) break;
        
        NSString *encodedChunk = [chunk base64EncodedUnformattedDescription];
        [result appendString:encodedChunk];
    }
    
    [file closeFile];
    return result;
}
```

## 7. Dependencies

- **MulleFoundation** - NSData, NSString base classes
- **base64** - Embedded Base64 encoding/decoding library (C) - vendored, no external dependency
- **mulle-objc** (runtime) - Objective-C runtime support
- Standard C library

## 8. RFC Compliance & Standards

- **RFC 4648**: Base64 Data Encodings (standard Base64 alphabet)
- **RFC 2045**: MIME Multipurpose Internet Mail Extensions (72-character line wrapping)
- **Data URL Standard**: RFC 2397 (data:// URLs)

## 9. Version Information

MulleBase64 version macro: `MULLE_BASE64_VERSION`
- Format: `(major << 20) | (minor << 8) | patch`
- Reflects both MulleBase64 wrapper and bundled base64 library versions
