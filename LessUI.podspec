#
# Be sure to run `pod lib lint LessUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LessUI'
  s.version          = '0.1.1'
  s.summary          = 'Write super-simple UI code with LessUI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Super-simple shortcut UI extension codes for swift.
                       DESC

  s.homepage         = 'https://github.com/ghks1353/LessUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ghks1353' => 'ghks1353@gmail.com' }
  s.source           = { :git => 'https://github.com/ghks1353/LessUI.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'src/default/*'
  
  s.ios.deployment_target = '9.0'
  s.default_subspec = 'Default'
  
  s.subspec 'Default' do |default|
      default.source_files = 'src/default/*'
  end
  
  s.subspec 'Transition' do |transition|
      transition.source_files = 'src/transition/*'
      transition.dependency 'pop', '~> 1.0'
  end
  
  s.subspec 'Network' do |transition|
      transition.source_files = 'src/network/*'
      transition.dependency 'Alamofire', '~> 4.7'
      transition.dependency 'AlamofireImage', '~> 3.5'
  end
  
  # s.resource_bundles = {
  #   'LessUI' => ['LessUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
