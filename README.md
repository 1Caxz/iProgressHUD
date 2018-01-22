# iProgressHUD
[![Creator](https://img.shields.io/badge/creator-icaksama-green.svg)](https://www.linkedin.com/in/icaksama/)
[![Travis](https://img.shields.io/travis/icaksama/iProgressHUD.svg)](https://travis-ci.org/icaksama/iProgressHUD)
[![GitHub license](https://img.shields.io/github/license/icaksama/iProgressHUD.svg)](https://raw.githubusercontent.com/icaksama/iProgressHUD/master/LICENSE)
[![Code Size](https://img.shields.io/github/languages/code-size/icaksama/iProgressHUD.svg)](https://img.shields.io/github/languages/code-size/icaksama/iProgressHUD.svg)
[![Pod Version](https://img.shields.io/cocoapods/v/iProgressHUD.svg)](https://img.shields.io/cocoapods/v/iProgressHUD.svg)
[![Platform](https://img.shields.io/cocoapods/p/iProgressHUD.svg)](https://img.shields.io/cocoapods/p/iProgressHUD.svg)
[![Download Total](https://img.shields.io/cocoapods/dt/iProgressHUD.svg)](https://img.shields.io/cocoapods/dt/iProgressHUD.svg)
<br>
An elegant, lightweight and responsive progress HUD for iOS app with very simple usage. Available 32 indicators by NVActivityIndicatorView. Your views can directly call start and stop the progress without spending your code anymore.

## Features
- [x] Responsive
- [x] Customizable
- [x] Full animations
- [x] Available 32 indicators by NVActivityIndicatorView
- [x] Support modal view, dismissable and touchable
- [x] Support vertical and horizontal style
- [x] VERY SIMPLE USAGE!

## Preview
<p align="center">
<img width="350" src="https://github.com/icaksama/iSphinx/blob/master/iSphinxPreview.gif?raw=true">
</p>

## Cocoapods
Add to `Podfile` :
```podfile
pod 'iProgressHUD', '~> 1.1.1'
```

## Indicator Types
| Type | Type | Type | Type |
|---|---|---|---|
|1. ballPulse | 2. ballGridPulse | 3. ballClipRotate | 4. squareSpin|
|5. ballClipRotatePulse | 6. ballClipRotateMultiple | 7. ballPulseRise | 8. ballRotate|
|9. cubeTransition | 10. ballZigZag | 11. ballZigZagDeflect | 12. ballTrianglePath|
|13. ballScale | 14. lineScale | 15. lineScaleParty | 16. ballScaleMultiple|
|17. ballPulseSync | 18. ballBeat | 19. lineScalePulseOut | 20. lineScalePulseOutRapid|
|21. ballScaleRipple | 22. ballScaleRippleMultiple | 23. ballSpinFadeLoader | 24. lineSpinFadeLoader|
|25. triangleSkewSpin | 26. pacman | 27. ballGridBeat | 28. semiCircleSpin|
|29. ballRotateChase | 30. orbit | 31. audioEqualizer | 32. circleStrokeSpin|

# How to Use

## Add The Listener
First, impletent the iSphinxDelegete in your class/ViewController :
```swift
import iSphinx

class ViewController: UIViewController, iSphinxDelegete {
    var isphinx: iSphinx = iSphinx()

    override func viewDidLoad() {
        super.viewDidLoad()
        isphinx.delegete = self
    }
}
```

### Note : Please take a look at iProgressHUDDemo for detail usage.

## MIT License
```text
Copyright (c) 2018 Saiful Irham Wicaksana

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

