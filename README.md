Hanabi
=======

[![Swift 2.0](https://img.shields.io/badge/Swift-2.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Build Status](https://travis-ci.org/kshin/Hanabi.svg?branch=master)](https://travis-ci.org/kshin/Hanabi)

## Overview
Hanabi is a UICollectionViewLayout subclass with a focus on UICollectionViewCell content.

<p align="center" >

	<img src="./Screenshots/Example.gif" alt="Hanabi" title="Hanabi">

</p>

## Usage

Hanabi contains three public properties that help to customize its behavior.

```swift
@IBInspectable var standartHeight: CGFloat = 100.0
@IBInspectable var focusedHeight: CGFloat = 280.0
@IBInspectable var dragOffset: CGFloat = 180.0
```

- _standardHeight_ is the height cells should be when collapsed.  Defaults to 100
- _focusedHeight_ is the height cells should be when focused. Defaults to 280
- _dragOffset_ is the amount the user needs to scroll before the featured cell changes. Defaults to 180


## Installation

Hanabi is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HanabiCollectionViewLayout", :git => 'https://github.com/kshin/Hanabi'
```

## Acknowledgement

This library is the swift port of this awesome objc library [SFFocusViewLayout](https://github.com/fdzsergio/SFFocusViewLayout) written by Sergio Fernández

## License

Hanabi is available under the MIT license.

Copyright © 2015 Ivan Lisovyi.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
