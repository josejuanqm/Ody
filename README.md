# Ody

Ody is an easy to use random image generator built with Swift.

Perfect for placeholders!

Built with [Silo] [silojq], [LoremPixel] [images], and [FillDunphy] [filldunphy].

### Demo
---

```swift 
odytizeAll()
``` 

![alt tag] (https://i.imgur.com/x4oC6we.png)  ![alt tag] (https://i.imgur.com/xeLBKIY.gif)

### Version
---
1.0

### Installation
---

Download from [here] [dld]
- import the Swift File

Just drag and drop Ody.swift file into your project

## Usage
---

#### If you are using AutoLayout please call after the view appears or in ViewDidAppear method

### From a UIImageView
```swift
  imageView.odytizeGrayscale()
  imageView.odytizeGrayscale(loaderColor: UIColor)
  imageView.odytizeGrayscale(category: ImageCategory, text: String)
  imageView.odytize()
  imageView.odytize(loaderColor: UIColor)
  imageView.odytize(category: ImageCategory)
  imageView.odytize(grayscale: Bool, category: ImageCategory, text: String)
  
  //To change loader color after odytizing
  imageView.setLoaderColorForOdyView(UIColor)
```

### From a UIView (Odytizes every UIImageView within the UIView)
```swift
  view.odytizeAll()
  view.odytizeAll(loaderColor: UIColor)
  view.odytizeAll(grayscale: Bool, category: ImageCategory, text: String, loaderColor: UIColor)
  view.odytizeAllToGrayscale()
  view.odytizeAllToGrayscale(loaderColor: UIColor)
  view.odytizeAllToGrayscale(category: ImageCategory)
  view.odytizeAllWithCustomImage(url: String)
  view.odytizeAllWithCustomImage(url: String, loaderColor: UIColor)
```

### Instantiating a new UIImageView
```swift
  UIImageView(loaderColor: UIColor, frame: CGRect)
  UIImageView(category: ImageCategory, frame: CGRect)
  UIImageView(loaderColor: UIColor, frame: CGRect, grayscale: Bool, category: ImageCategory, text: String)
```

### ImageCategory Enum

| enum case  | Example  |
| :------------: |:---------------:|
| ``ImageCategory.Abstract``     | ![alt tag] (http://lorempixel.com/400/200/abstract) |
| ``ImageCategory.Animals``     | ![alt tag] (http://lorempixel.com/400/200/animals) |
| ``ImageCategory.Business`` | ![alt tag] (http://lorempixel.com/400/200/business) |
|``ImageCategory.Cats``| ![alt tag] (http://lorempixel.com/400/200/cats) |
|``ImageCategory.City``| ![alt tag] (http://lorempixel.com/400/200/city) |
|``ImageCategory.Food``| ![alt tag] (http://lorempixel.com/400/200/food)|
|``ImageCategory.Nightlife``| ![alt tag] (http://lorempixel.com/400/200/nightlife)|
|``ImageCategory.Fashion``| ![alt tag] (http://lorempixel.com/400/200/fashion)|
|``ImageCategory.People``| ![alt tag] (http://lorempixel.com/400/200/people)|
|``ImageCategory.Nature``| ![alt tag] (http://lorempixel.com/400/200/nature)|
|``ImageCategory.Sports``| ![alt tag] (http://lorempixel.com/400/200/sports)|
|``ImageCategory.Technics``| ![alt tag] (http://lorempixel.com/400/200/technics)|
|``ImageCategory.Transport``| ![alt tag] (http://lorempixel.com/400/200/transport)|
|``ImageCategory.FillDunphy`` (does not support grayscale) | ![alt tag] (http://filldunphy.com/400/200) |

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dld]: <https://github.com/josejuanqm/Ody/blob/master/Ody/Ody.swift.zip?raw=true>
   [silojq]: <https://github.com/josejuanqm/Silo>
   [images]: <http://lorempixel.com/>
   [filldunphy]: <http://filldunphy.com>


