# Ody

Ody is an easy to use random image generator built with Swift.

Perfect for placeholders!

Built with [Silo] [silojq] and [LoremPixel] [images].

### Version
1.0

### Installation

Download from [here] [dld]
- import the Swift File

Just drag and drop both Ody file into your project

## Usage

#### if you are using autolayout be sure to call it in viewDidAppear

### From a UIImageView
```swift
  imageView.odytizeGrayscale()
  imageView.odytizeGrayscale(loaderColor: UIColor)
  imageView.odytizeGrayscale(category: ImageCategory, text: String)
  imageView.odytize()
  imageView.odytize(loaderColor: UIColor)
  imageView.odytize(grayscale: Bool, category: ImageCategory, text: String)
  
  //To change loader color after odytizing
  imageView.setLoaderColorForOdyView(UIColor)
```

### From a UIView
```swift
  view.odytizeAll()
  view.odytizeAll(loaderColor: UIColor)
  view.odytizeAll(grayscale: Bool, category: ImageCategory, text: String, loaderColor: UIColor)
  view.odytizeAllToGrayscale()
  view.odytizeAllToGrayscale(loaderColor: UIColor)
  view.odytizeAllToGrayscale(category: ImageCategory, text: String)
  view.odytizeAllWithCustomImage(url: String)
  view.odytizeAllWithCustomImage(url: String, loaderColor: UIColor)
```

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dld]: <https://github.com/josejuanqm/Ody/blob/master/Ody/Ody.zip?raw=true>
   [silojq]: <https://github.com/josejuanqm/Silo>
   [images]: <http://lorempixel.com/>


