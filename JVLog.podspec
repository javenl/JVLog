
Pod::Spec.new do |s|

  s.name         = "JVLog"
  s.version      = "0.2"
  s.summary      = "An lightweight, flexible framework for logging to replace NSLog."
  s.description  = <<-DESC
  				An lightweight, flexible framework for logging to replace NSLog. 
  				Convenience and Easy to Use.
                   DESC

  s.homepage     = "https://github.com/javenl/JVLog"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "javen" => "412775083@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/javenl/JVLog.git", :tag => "#{s.version}" }
  s.source_files = "JVLog/Classes/*.{h,m}"

end
