## 0.1.0







* add MulleObjCDeps+MulleBase64.h/.m to expose dependencies() so the ObjC loader can discover this library's NSData+Base64 category
* include generated src/reflect/objc-deps.inc with an entry for NSData/Base64 to ensure runtime registration
