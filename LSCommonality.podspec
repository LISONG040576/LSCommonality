Pod::Spec.new do |s|

  
  s.name         = "LSCommonality"
  s.version      = "0.0.10"
  s.summary      = "LSCommonality."

  
  s.description  = <<-DESC 
                         LSCommonality  公共组件，包括公共UI，公共分类，公共model，公共插件，基类等
                   DESC

  s.homepage     = "https://github.com/LISONG040576/LSCommonality.git"
  
  s.license      = "MIT"
  
  s.author             = { "lisong" => "lisong.s@haier.com" }
  
  s.source       = { :git => "https://github.com/LISONG040576/LSCommonality.git", :tag => s.version.to_s }

  s.source_files  = "LSCommonality/LSCommonality/LSCommonality.h"

#,"LSCommonality/LSCommonality/**/*.{h,m}"

  s.resources = "LSCommonality/LSCommonality/**/*.{png,jpg}"


  s.subspec  'tools' do |s1|
	
	s1.source_files = "LSCommonality/LSCommonality/tools/*.{h,m}"
  end

  s.subspec  'model' do |s2|
	
	s2.source_files = "LSCommonality/LSCommonality/model/*.{h,m}"
  end

  s.subspec  'module' do |s3|
	
	s3.source_files = "LSCommonality/LSCommonality/module/*.{h,m}"
  end

  s.subspec  'customview' do |s4|
	
	s4.source_files = "LSCommonality/LSCommonality/customview/*.{h,m}"
  end

  s.subspec  'categary' do |s5|
	
	s5.source_files = "LSCommonality/LSCommonality/categary/*.{h,m}"
  end

  s.subspec  'baseclass' do |s6|
	
	s6.source_files = "LSCommonality/LSCommonality/baseclass/*.{h,m}"
  end



  	


  s.requires_arc = true

  s.platform = :ios

  s.frameworks ="UIKit","Foundation","WebKit"

  s.ios.deployment_target = '8.0'



  s.dependency "LSMiddleWare", "~> 0.0.2"
  
  s.dependency "SVProgressHUD" , "~> 2.2.5"

  s.dependency "SDWebImage"

  s.dependency "SDAutoLayout", "~> 2.2.1"

















  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.



  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
