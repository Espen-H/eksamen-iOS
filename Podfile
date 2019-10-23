# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'pg5600-exam' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for pg5600-exam

  pod 'Alamofire', '~> 4'
  pod 'Kingfisher', '~> 4'
  
  pod 'SwiftFormat/CLI'
  
  SWIFT_VERSION = '4.2'

  target 'pg5600-examTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'pg5600-examUITests' do
    # Pods for testing
  end
  
  # fix swift version error .. https://stackoverflow.com/questions/40501440/how-to-set-the-legacy-swift-version-for-each-pod-in-podfile-xcode-9-0-swift-3-2
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if ['Alamofire', 'Kingfisher'].include? target.name
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.2'
        end
      end
    end
  end

end
