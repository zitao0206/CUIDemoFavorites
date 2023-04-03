#
# Be sure to run `pod lib lint CUIDemoExamples.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CUIDemoExamples'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CUIDemoExamples.'
  s.homepage         = 'https://github.com/zitao/CUIDemoFavorites'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zitao0206' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/zitao0206/CUIDemoFavorites.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CUIDemoExamples\" CUI_MODULE_NAME=@\"CUIDemoExamples\"' }
  
  s.ios.deployment_target = '13.0'
  
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.prefix_header_file = 'CUIDemoExamples.pch'

  s.resource_bundles = {
     'CUIDemoExamples-Assets' => ['Assets/**/*'],
     'CUIDemoExamples-Resources' => ['Resources/**/*']
  }
  
  s.dependency 'CUIDemoElements'
  s.dependency 'AKOCommonToolsKit'
  
end
