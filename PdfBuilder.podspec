#
# Be sure to run `pod lib lint PdfBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PdfBuilder'
  s.version          = '0.1.0'
  s.summary          = 'PdfBuilder is a swift library made to make Pdf with similar declarative interface to SwiftUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Layout components:
- Background
- ClipShape
- Divider
- Grid
- Image
- Padding
- PageBackground
- PageBreak
- PageCounter
- PageHeader
- Spacer
- Text
- VStack
- HStack
                       DESC

  s.homepage         = 'https://github.com/atrbx5/PdfBuilder'
  s.screenshots     = 'https://github.com/atrbx5/PdfBuilder/raw/master/images/Screenshot_2022-01-04_001.png', 'https://github.com/atrbx5/PdfBuilder/raw/master/images/Screenshot_2022-01-04_002.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrii' => 'andrei.perwushin@gmail.com' }
  s.source           = { :git => 'https://github.com/atrbx5/PdfBuilder.git', :tag => s.version.to_s }
  s.swift_version = '5.0'

  s.ios.deployment_target = '14.0'

  s.source_files = 'Sources/PdfBuilder/**/*'
  
  # s.resource_bundles = {
  #   'PdfBuilder' => ['PdfBuilder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
