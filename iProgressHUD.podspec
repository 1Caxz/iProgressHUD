Pod::Spec.new do |s|
  s.name = 'iProgressHUD'
  s.version = '1.2.2'
  s.license = 'MIT'
  s.summary = 'An elegant, lightweight and responsive progress HUD for iOS app with very simple usage. Available 32 indicators by NVActivityIndicatorView.'
  s.homepage = 'https://github.com/epajot/iProgressHUD'
  s.social_media_url = 'https://share.swiss'
  s.authors = { 'epajot' => 'contact@pajot.ch' }
  s.source = { :git => 'https://github.com/epajot/iProgressHUD.git', :tag => s.version }
  s.platform = :ios, '15.0'
  s.ios.deployment_target = '15.0'
  s.frameworks = 'Foundation', 'UIKit'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.source_files = 'iProgressHUD/iProgressHUD/*.{swift,h}',
                   'iProgressHUD/iProgressHUD/**/*.{swift,h}',
                   'iProgressHUD/iProgressHUD/**/**/*.{swift,h}'
end
