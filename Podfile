
platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks! :linkage => :static

workspace 'CUIDemoFavorites.xcworkspace'
project 'Example/CUIDemoFavorites'

fast_mode = ENV['fast_mode']

if fast_mode
  
install! 'cocoapods',
          :preserve_pod_file_structure => false,
          :deterministic_uuids => false,
          :generate_multiple_pod_projects => true,
#          :skip_pods_project_generation => true,
          :incremental_installation => true,
          :lock_pod_sources => false
else

install! 'cocoapods',
          :preserve_pod_file_structure => true,
          :deterministic_uuids => false,
          :generate_multiple_pod_projects => true
end

target 'CUIDemoFavorites' do
  pod 'CUIDemoExamples', :path => './LocalPods/CUIDemoExamples', :inhibit_warnings => false
  pod 'CUIDemoElements', :path => './LocalPods/CUIDemoElements', :inhibit_warnings => false

end

post_install do |installer|
  installer.pod_target_subprojects.flat_map { |project| project.targets }.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
