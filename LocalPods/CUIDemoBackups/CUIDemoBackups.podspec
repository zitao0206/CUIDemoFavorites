#
# Be sure to run `pod lib lint CUIDemoBackups.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CUIDemoBackups'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CUIDemoExamples.'
  s.homepage         = 'https://github.com/zitao0206/CUIDemoBackups'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zitao0206' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/zitao0206/CUIDemoFavorites.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CUIDemoBackups\" CUI_MODULE_NAME=@\"CUIDemoBackups\"' }
  
  s.ios.deployment_target = '13.0'
  
  s.source_files = [
    'CUIDemoBackups.swift',
    'Classes/**/*'
  ]

  s.resource_bundles = {
     'CUIDemoBackups' => ['Assets/**/*']
  }
  
  s.dependency 'CUIDemoExamples'
  s.dependency 'CUIDemoElements'
  s.dependency 'AKOCommonToolsKit'
 
  s.frameworks = 'UIKit', 'Foundation', 'MapKit'
 
  
end
