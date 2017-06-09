#
# Be sure to run `pod lib lint Emmlytics.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Emmlytics'
  s.version          = '0.1.1'
  s.summary          = 'Mobile App Analytics for Enterprises'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Built with love in the UK. We are Emmlytics. Tell us what you need'

  s.homepage         = 'https://github.com/Emmlytics/pod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Emmlytics' => 'team@emmlytics.com' }
  s.source           = { :git => 'https://github.com/emmlytics/pod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/emmlytics'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Emmlytics/Classes/**/*'
  
  s.resource_bundles = {
     'Emmlytics' => ['Emmlytics/Assets/*.*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
