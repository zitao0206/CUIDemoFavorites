#
# Be sure to run `pod lib lint CUIDemoElements.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CUIDemoElements'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CUIDemoElements.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Leon/CUIDemoFavorites'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/Leon/CUIDemoFavorites.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CUIDemoElements\" CUI_MODULE_NAME=@\"CUIDemoElements\"' }

  s.source_files = 'CUIDemoElements/Classes/**/*'
  
  s.prefix_header_file = 'CUIDemoElements/CUIDemoElements.pch'

  s.resource_bundles = {
     'CUIDemoElements' => ['CUIDemoElements/Assets/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Masonry'
    s.dependency 'SVProgressHUD'
end
