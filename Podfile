source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/twilio/cocoapod-specs'

platform :ios, '9.0'
use_frameworks!

target 'Demo' do
    pod 'Alamofire', '~> 4.0'
    pod 'SwiftyJSON'
    pod 'FacebookCore'
	  pod 'FacebookLogin'
	  pod 'FacebookShare'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
