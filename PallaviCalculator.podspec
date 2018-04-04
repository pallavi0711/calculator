Pod::Spec.new do |s|
  s.name             = 'PallaviCalculator'
  s.version          = '0.1.0'
s.swift_version = '4.0'
  s.summary          = 'sirf calculator'
 
  s.description      = <<-DESC
This is nice calculator
                       DESC
 
  s.homepage         = 'https://github.com/<YOUR GITHUB USERNAME>/FantasticView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pallavi' => 'lawarepallavi12@gmail.com' }
  s.source           = { :git => 'https://github.com/pallavi0711/calculator.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Calculator/*'
 
end