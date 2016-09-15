Pod::Spec.new do |s|
  s.name         = "HanabiCollectionViewLayout"
  s.version      = "1.2"
  s.summary      = "UICollectionView subclass with focus on the content"
  s.homepage     = "https://github.com/kshin/Hanabi"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ivan Lisovyi" => "lisovyi.ivan@gmail.com" }

  s.platform     = :ios, "9.0"
  s.requires_arc = true
  s.ios.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/kshin/Hanabi.git", :tag => s.version }
  s.source_files = "Source/*.{h,swift}"
  s.frameworks   = 'UIKit'
end
