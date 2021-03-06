#
# Be sure to run `pod lib lint ApiJsonKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ApiJsonKit'
  s.version          = '1.0.0'
  s.summary          = 'A tool to simplify network calls and json decoding.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

  Networking and decoding JSON are repetitive tasks. This framework provide tested implementation
  to simplify those tasks. It includes wrapper struct and/or classes around the Decodable protocol
  and URLSession.
  
  DESC

  s.homepage         = 'https://github.com/bachld97/ApiJsonKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bach Le' => 'ldbach97@gmail.com' }
  s.source           = { :git => 'https://github.com/bachld97/ApiJsonKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.2'
  s.swift_version       = '5.0'
  
  s.source_files = 'ApiJsonKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ApiJsonKit' => ['ApiJsonKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
