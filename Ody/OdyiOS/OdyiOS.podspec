#
# Be sure to run `pod lib lint OdyiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OdyiOS"
  s.version          = "0.1.0"
s.summary          = "Ody is an easy to use random image generator built with Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Ody is an easy to use random image generator built with Swift.

Perfect for placeholders!

Built with Silo, LoremPixel, and FillDunphy.
                       DESC

  s.homepage         = "https://github.com/josejuanqm/Ody"
  s.license          = 'MIT'
  s.author           = { "Jose Quintero" => "jose.juan.qm@gmail.com" }
  s.source           = { :git => "https://github.com/josejuanqm/Ody/OdyiOS.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/josejuanqm'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'OdyiOS' => ['OdyiOS/Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
