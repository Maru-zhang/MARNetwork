# MARNetwork

[![CI Status](http://img.shields.io/travis/Maru-zhang/MARNetwork.svg?style=flat)](https://travis-ci.org/Maru-zhang/MARNetwork)
[![Version](https://img.shields.io/cocoapods/v/MARNetwork.svg?style=flat)](http://cocoapods.org/pods/MARNetwork)
[![License](https://img.shields.io/cocoapods/l/MARNetwork.svg?style=flat)](http://cocoapods.org/pods/MARNetwork)
[![Platform](https://img.shields.io/cocoapods/p/MARNetwork.svg?style=flat)](http://cocoapods.org/pods/MARNetwork)


## What

MARNetwork is a tiny and elegant High Level Network Layer inspire by [Moya](https://github.com/Moya/Moya),[Masonry](https://github.com/SnapKit/Masonry) and [RESTful](http://www.restapitutorial.com/),which can fluent bridge with [ReactiveObjc](https://github.com/ReactiveCocoa/ReactiveObjC), and then you can enjoy with your FRP ...

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Introduction

### usage

```
MAREntity *entity = MARDispatchCenter.mainChannel;

RACSignal *signal = entity.get.getRequest(nil).start;

[signal subscribeNext:^(id  _Nullable x) {
    NSLog(@"success:%@",x);
}];

[signal subscribeError:^(NSError * _Nullable error) {
    NSLog(@"failure:%@",error);
}];

[signal subscribeCompleted:^{
    NSLog(@"completed");
}];
```

## Requirements

MARNetwork supports OS X 10.8+ and iOS 8.0+.

## Installation

MARNetwork is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MARNetwork"
```

## Author

Maru-zhang, maru-zhang@foxmail.com

## License

MARNetwork is available under the MIT license. See the LICENSE file for more info.


