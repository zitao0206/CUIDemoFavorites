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
  s.homepage         = 'https://github.com/Leon/CUIDemoFavorites'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/Leon/CUIDemoFavorites.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__CUI_MODULE_NAME__=\"CUIDemoExamples\" CUI_MODULE_NAME=@\"CUIDemoExamples\"' }

  s.source_files = 'CUIDemoExamples/Classes/**/*'
  s.public_header_files = 'CUIDemoExamples/Classes/**/*.h'
  s.prefix_header_file = 'CUIDemoExamples/CUIDemoExamples.pch'
  
  s.resource_bundles = {
     'CUIDemoExamples' => ['CUIDemoExamples/Assets/Images/*.*','CUIDemoExamples/Assets/Videos/*.*']
  }
  
  s.dependency 'CUIDemoElements'
  
end
