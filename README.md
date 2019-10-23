# LessUI

[![Version](https://img.shields.io/cocoapods/v/LessUI.svg?style=flat)](https://cocoapods.org/pods/LessUI)
[![License](https://img.shields.io/cocoapods/l/LessUI.svg?style=flat)](https://cocoapods.org/pods/LessUI)
[![Platform](https://img.shields.io/cocoapods/p/LessUI.svg?style=flat)](https://cocoapods.org/pods/LessUI)

Write super-simple code for UI building!

## ⚠ This framework is under alpha stage!!

Some of method's usage, parameters, usage can be changed in the future.

## About

### Without LessUI...

If you want to draw one label and align to center, originally you should write:

```swift
let label: UILabel = UILabel()

label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
label.font = UIFont.systemFont(ofSize: 15)
label.numberOfLines = 0
label.text = "Let's swift 😀\nwithout LessUI 😭"

view.addSubview(label)

label.frame = .zero
label.sizeToFit()
label.frame = CGRect(x: view.frame.width / 2 - label.frame.width / 2, y: view.frame.height / 2 - label.frame.height / 2, label.frame.width, label.frame.height)
```

### With LessUI

But you can write 4 lines of UI code into just one line!

```swift
let label: UILabel = UILabel()

label.add(to: view)
    .style(size: 15, color: 0x000000.c, lines: 0)
    .text = "Let's swift 😀\nwith LessUI 🎉"
           
label.prefix().vhCenter()
```

### Method chaining

Most of LessUI's method supports method chaining. You can chain with all of supported methods.

```swift
// Without chaining
container.add(to: view)
container.subCenter()
container.fit()
container.hCenter()
container.start(view, y: 12)

// With chaining
container.add(to: view)
    .subCenter().fit()
    .hCenter().start(view, y: 12)
```

## Documentation

See [LessUI Wiki](https://github.com/ghks1353/LessUI/wiki).

## Example

Go to `Example` directory, run `pod install`, and open `LessUI.xcworkspace`.

## Requirements

- iOS 9.0+
- Xcode 10.2+
- Swift 5.0+


## Installation

### Cocoapods

```ruby
pod 'LessUI'
```

Networking utils with [Alamofire](https://github.com/Alamofire/Alamofire)

```ruby
pod 'LessUI/Network'
```

Animation utils with [pop](https://github.com/facebook/pop)

```ruby
pod 'LessUI/Transition'
```

### Manual

Create a group into your project, drag all source codes in `LessUI/src/default` into your new folder. If you want to install for /Network, /Transition or both, you have to install dependencies too.

## Use in App Extension

LessUI uses `UIApplication.shared` but you can not use `shared` in extension code. If you want to use LessUI for extension, add `-D EXTENSION` into `Other-Swift-Flags` in `Build Settings`. For cocoapods, add this script in `Podfile` for *extension target*:

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == "LessUI"
            target.build_configurations.each do |config|
                config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['$(inherited)', '-D', 'EXTENSION']
            end
        end
    end
end
```

If you add this script into main app, target some functions that uses `UIApplication.shared` returns wrong value. We recommend to seperate post_install script for each targets.

## Author

Seru, ghks1353@gmail.com

## License

LessUI is available under the MIT license. See the LICENSE file for more info.
