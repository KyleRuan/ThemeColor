![logo](https://github.com/KyleRuan/ThemeColor/blob/master/README_IMAGE/themeLogo.png)
# ThemeColor
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ThemeColor.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/ThemeColor.svg?style=flat)
![Language](https://img.shields.io/badge/language-swift-orange.svg)
![language](https://img.shields.io/cocoapods/l/ThemeColor.svg?style=flat)

a simple way to manage theme ,   a Powerful color/theme/skin manager
<a href="README_CN.md">中文文档</a>


![demo](https://github.com/KyleRuan/ThemeColor/blob/master/README_IMAGE/demo.gif)
## Color Management
Color is the foundation of an app presentation, and every mature app should have its own design style.This Project manage colors  by enumeration. Each enumeration has a color array corresponding to a different theme. You can edit TCColorConfig.swift to edit or set the default color scheme. You can also set the color scheme dynamically using `ThemeManager.sharedManager.setThemeColorList`.

Note that `TCColorName`,` kDefaultColorList`, `ThemeType` need one-to-one correspondence.



```swift
// default work with kDefaultColorList
public enum TCColorName:Int {
    case ColorNameRed = 0
    case ColorNameBlue
}

let kDefaultColorList:[[String]] = [
    [ "ee1a1a", "892323"],
    [ "1b88ee", "144e84"]
]

public enum ThemeType:Int {
    case themeDay = 0
    case themeNight
}
```

A unified color management platform (recently released) is shown below
![themeBoard](https://github.com/KyleRuan/ThemeColor/blob/master/README_IMAGE/themeBoard.png)
## Function
### Color
Provides a hexadecimal way to set the color based on enum `TCColorName`

### UIView 
1. `tc_themeBlock` is a block of theme switches that handles not only color changes, but also all UIView-related properties.
2. `tc_backgroundColor`: When the theme switch, can be used to set the background color UIView
3.  `tc_borderColor` installation layer` borderColor`

###  UILabel Extension
1. `tc_textColor`: set the` UILabel` font color
2.  `tc_highlightedTextColor`: set UILabel highlight font color

### UIImageView

`UIImageView` requires a different picture in the theme switch, so you need to take a certain norm on the picture naming. 

 
call  the function
`ThemeManager.sharedManager.setThemeImagePrefix`  to normalize the theme image name.
e.g: [" "," night "], then the image named" themeImage " ,The corresponding theme image name is "night_themeImage". There are two ways to set the theme image as below

1. `tc_imageName` :Set the default theme of the picture name

For solid images also provide a way to color the image
1. `func set_imageName(_ imageName:String?,nightTintColor tintColor:TCColorName?)`

### UIButton
`UIButton` has multiple states for pictures
1. `func tc_setImage(_ imageName: String?, for state: UIControlState)`
2. `func tc_setImage(_ imageName: String?, tintColor:TCColorName?,for state: UIControlState) `

Available for the font color of `UIButton`
1. `func tc_setTitleColor(_ color: TCColorName?, for state: UIControlState)`
2. `func tc_setTitleShadowColor(_ color: TCColorName?, for state: UIControlState)`
## Installation
### CocoaPods
```
use_frameworks!
pod 'ThemeColor'
```

### Source files
Copy all the files in "ThemeColor" folder into your project
## configuration 
config the `TCColorConfig.swift` file
## LICENSE
MIT License

Copyright (c) 2018 kyleruan

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


