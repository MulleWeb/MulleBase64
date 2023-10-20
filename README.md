# MulleBase64

#### 💬 Decode and encode NSData with base64


Adds [base64](https://en.wikipedia.org/wiki/Base64) coding and decoding support
to **NSData**.

| Release Version                                       | Release Notes
|-------------------------------------------------------|--------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag//MulleBase64.svg?branch=release) [![Build Status](https://github.com//MulleBase64/workflows/CI/badge.svg?branch=release)](//github.com//MulleBase64/actions)| [RELEASENOTES](RELEASENOTES.md) |








## Overview
![Overview](overview.dot.svg)

| Requirement                                  | Description
|----------------------------------------------|-----------------------
| [MulleFoundationBase](https://github.com/MulleFoundation/MulleFoundationBase)             | 🛸 MulleFoundationBase does something
| [mulle-objc-list](https://github.com/mulle-objc/mulle-objc-list)             | 📒 Lists mulle-objc runtime information contained in executables.


## Add

Use [mulle-sde](//github.com/mulle-sde) to add MulleBase64 to your project:

``` sh
mulle-sde add github:MulleWeb/MulleBase64
```

## Install

### Install with mulle-sde

Use [mulle-sde](//github.com/mulle-sde) to build and install MulleBase64 and all dependencies:

``` sh
mulle-sde install --prefix /usr/local \
   https://github.com//MulleBase64/archive/latest.tar.gz
```

### Manual Installation

Install the requirements:

| Requirements                                 | Description
|----------------------------------------------|-----------------------
| [MulleFoundationBase](https://github.com/MulleFoundation/MulleFoundationBase)             | 🛸 MulleFoundationBase does something
| [mulle-objc-list](https://github.com/mulle-objc/mulle-objc-list)             | 📒 Lists mulle-objc runtime information contained in executables.

Download the latest [tar](https://github.com/MulleWeb/MulleBase64/archive/refs/tags/latest.tar.gz) or [zip](https://github.com/MulleWeb/MulleBase64/archive/refs/tags/latest.zip) archive and unpack it.

Install **MulleBase64** into `/usr/local` with [cmake](https://cmake.org):

``` sh
cmake -B build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_PREFIX_PATH=/usr/local \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```

## Platforms and Compilers

All platforms and compilers supported by
[mulle-c11](//github.com/mulle-c/mulle-c11).


## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK

