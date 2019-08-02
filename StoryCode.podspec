Pod::Spec.new do |s|
  s.name                      = 'StoryCode'
  s.version                   = '1.0'
  s.summary                   = 'DI for UIViewControllers.'
  s.homepage                  = 'https://github.com/antonsergeev88/StoryCode'
  s.source                    = { :git => s.homepage + '.git', :tag => s.version }
  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.authors                   = { 'Anton Sergeev' => 'antonsergeev88@gmail.com' }
  s.source_files              = 'StoryCode/**/*.{h,swift}'
  s.swift_versions            = '5.0'
  s.pod_target_xcconfig       = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES' }
  s.ios.deployment_target     = '8.0'
end