
platform :ios, '10.0'
inhibit_all_warnings!
workspace 'CUIDemoFavorites'
project 'Example/CUIDemoFavorites'
use_frameworks!

target 'CUIDemoFavorites' do
  pod 'CUIDemoExamples', :path => './', :inhibit_warnings => false
  pod 'CUIDemoElements', :path => './', :inhibit_warnings => false

end

post_install do |installer|
  installer.pod_target_subprojects.flat_map { |project| project.targets }.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
