Pod::Spec.new do |s|
  s.name         = "KYDigitalFontView"
  s.version      = "2.0.0"
  s.summary      = "KYDigitalFontView is a custom view that displays the character in the digital font style."
  s.homepage     = "https://github.com/ykyouhei/KYDigitalFontView"
  s.license      = "MIT"
  s.author       = { "Kyohei Yamaguchi" => "kyouhei.lab@gmail.com" }
  s.social_media_url   = "https://twitter.com/kyo__hei"
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/ykyouhei/KYDigitalFontView.git", :tag => s.version.to_s }
  s.source_files = "KYDigitalFontVie/wClasses/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
end
