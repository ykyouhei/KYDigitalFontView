# KYDigitalFontView

[![Pod Version](http://img.shields.io/cocoapods/v/KYDigitalFontView.svg?style=flat)](http://cocoadocs.org/docsets/KYDigitalFontView/) [![Pod Platform](http://img.shields.io/cocoapods/p/KYDigitalFontView.svg?style=flat)](http://cocoadocs.org/docsets/KYDigitalFontView/) [![Pod License](http://img.shields.io/cocoapods/l/KYDigitalFontView.svg?style=flat)](https://github.com/ykyohei/KYDigitalFontView/blob/master/LICENSE) [![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)

`KYDigitalFontView` is a custom view that displays the character in the digital font style

* IBDesignable, IBInspectable Support


![sample1.gif](https://cloud.githubusercontent.com/assets/5757351/8081721/2ae57d2e-0fb2-11e5-8291-efd2078ee36a.gif "sample.gif") ![sample2.gif](https://cloud.githubusercontent.com/assets/5757351/8082071/5b11fa88-0fb5-11e5-8ebb-3c95fed37530.gif "sample2.gif")


## Installation

### CocoaPods

`KYDigitalFontView ` is available on CocoaPods.
Add the following to your `Podfile`:

```ruby
pod 'KYDigitalFontView'
```

### Manually
Just add the Classes folder to your project.


## Usage
(see sample Xcode project in `/Example`)

### Code

```Swift
let digitalFontView = KYDigitalFontView(frame: CGRectMake(10, 10, 100, 160))

digitalFontView.borderWidth   = 1
digitalFontView.borderColor   = UIColor.redColor()
digitalFontView.fillColor     = UIColor.cyanColor()
digitalFontView.lineWidth     = 15
digitalFontView.drawPositions = KYDigitalFontView.DrawPositions.positionsWithCharacter("A")

/* Custom Drawing
digitalFontView.drawPositions = ._0 | ._1 | ._14 | ._15
*/

view.addSubview(v)
```

### Storyboard

![sample3.gif](https://cloud.githubusercontent.com/assets/5757351/8084189/adbe3972-0fc4-11e5-869c-7c3d453f0238.gif "sample3.gif")

 
### Drawing Character 
```Swift
// From Character
digitalFontView.drawPositions = KYDigitalFontView.DrawPositions.positionsWithCharacter("A")

// Custom Drawing
digitalFontView.drawPositions = ._0 | ._1 | ._2
```

#### Supported Characters
* a~z
* A~Z
* 0-9
* $, +, -, *, /, =, %, \, ", ', #, @, &, _, [, ], (, ), {, }, <, >, `, ^, ~

#### Custom Drawing

![sample.png](https://cloud.githubusercontent.com/assets/5757351/8084798/f5a7fdf6-0fc7-11e5-91c4-3f6c0e2145e8.png "sample.png")



## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 