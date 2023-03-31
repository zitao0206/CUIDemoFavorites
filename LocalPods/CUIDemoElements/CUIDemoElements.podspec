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
  s.homepage         = 'https://github.com/zitao0206/CUIDemoFavorites'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zitao0206' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/zitao0206/CUIDemoFavorites.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CUIDemoElements\" CUI_MODULE_NAME=@\"CUIDemoElements\"'}

  s.source_files = [
    'CUIDemoElements.swift',
    'Classes/**/*'
  ]
  
  s.resource_bundles = {
     'CUIDemoElements' => ['Assets/**/*']
  }
#  s.public_header_files = 'CUIDemoElements/Classes/**/*.h'
  s.prefix_header_file = 'CUIDemoElements.pch'
  s.frameworks = 'UIKit', 'Foundation', 'MapKit'
  s.dependency 'Masonry'
  s.dependency 'SVProgressHUD'
  s.dependency 'BlocksKit'
  s.dependency 'SnapKit'
  
end
