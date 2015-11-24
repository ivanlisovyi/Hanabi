Pod::Spec.new do |s|
  s.name         = "Hababi"
  s.version      = "1.0.0"
  s.summary      = "UICollectionView subclass with focus on the content"
  s.homepage     = "https://github.com/kshin/Hanabi"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ivan Lisovyi" => "lisovyi.ivan@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/kshin/Hanabi.git", :tag => s.version }
  s.source_files = "Hanabi/*.swift"
  s.requires_arc = true
  s.frameworks   = 'UIKit'
end
