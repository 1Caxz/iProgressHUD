Pod::Spec.new do |s|
  s.name = 'iProgressHUD'
  s.version = '2.0'
  s.license = 'MIT'
  s.summary = 'An elegant, lightweight and responsive progress HUD for iOS app with very simple usage. Available 32 indicators by NVActivityIndicatorView.'
  s.homepage = 'https://github.com/icaksama/iProgressHUD'
  s.social_media_url = 'https://twitter.com/icaksama'
  s.social_media_url = 'https://www.facebook.com/icaksama.fanpage'
  s.authors = { 'icaksama' => 'icaksama@gmail.com' }
  s.source = { :git => 'https://github.com/icaksama/iProgressHUD.git', :tag => s.version }
  s.platform = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.frameworks = 'Foundation', 'UIKit'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.source_files = 'iProgressHUD/iProgressHUD/*.{swift,h}',
                   'iProgressHUD/iProgressHUD/**/*.{swift,h}',
                   'iProgressHUD/iProgressHUD/**/**/*.{swift,h}'
end
