![logo](ThemeColor/README_IMAGE/themeLogo.png)
# ThemeColor
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ThemeColor.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/ThemeColor.svg?style=flat)
![Language](https://img.shields.io/badge/language-swift-orange.svg)
![language](https://img.shields.io/cocoapods/l/ThemeColor.svg?style=flat)

a simple way to manage theme ,   a Powerful color/theme/skin manager

![demo](ThemeColor/README_IMAGE/demo.gif)

## 颜色管理
颜色是一个app展示的基础，每一个成熟的app都该有自己的设计风格。为了规范颜色，通过枚举来来管理颜色。为了切换主题，采用不同枚举对应多个颜色。可以编辑TCColorConfig.swift 来编辑设置默认配色方案 ，也可以通过`ThemeManager.sharedManager.setThemeColorList `动态设置配色方案。
需要注意的是`TCColorName`个数要和kDefaultColorList的个数需要一一对应。主题的个数`ThemeType`要和`kDefaultColorList`每个元素的个数一致。

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

提供统一的颜色管理平台（近期放出）如下所示
![themeBoard](ThemeColor/README_IMAGE/themeBoard.png)
## 功能
###颜色
提供了十六进制，根据枚举TCColorName来设置颜色的方法

### UIView 
1. `tc_themeBlock`  是一个主题切换的block，不止可以处理颜色的变化。还可以设置一切和`UIView`相关的属性。
2. `tc_backgroundColor` 可以用来设置`UIView`背景色主题的变化
3.  `tc_borderColor`设置layer `borderColor`的变化

###  UILabel Extension
1. `tc_textColor`  的`UILabel`字体颜色
2.  `tc_highlightedTextColor` 的`UILabel` 高亮字体颜色

### UIImageView
`UIImageView` 在主题切换中需要不同的图片，所以需要对图片的命名采取一定的规范,通过
` ThemeManager.sharedManager.setThemeImagePrefix` 命名规范，比如["","night"],那么"themeImage"
对应的主题图片名字为"night_themeImage"。提供两种方式来设置主题图片如下

1. `tc_imageName` 设置默认主题下的图片名

对于纯色的图片 还提供对图片进行着色的方法
`func set_imageName(_ imageName:String?,nightTintColor tintColor:TCColorName?)`

### UIButton
`UIButton`具有多个状态，对于图片 
1. `func tc_setImage(_ imageName: String?, for state: UIControlState)`
2. `func tc_setImage(_ imageName: String?, tintColor:TCColorName?,for state: UIControlState) `

对于`UIButton`的字体颜色提供
1. `func tc_setTitleColor(_ color: TCColorName?, for state: UIControlState)`
2. `func tc_setTitleShadowColor(_ color: TCColorName?, for state: UIControlState)`




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


