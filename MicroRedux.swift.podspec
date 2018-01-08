Pod::Spec.new do |s|
  s.name             = 'MicroRedux.swift'
  s.version          = '0.1.0'
  s.summary          = 'A minimalistic implementation of Redux in Swift.'

  s.description      = <<-DESC
Redux.swift is a minimalistic and pragmatic implementation of the Redux architecture pattern in Swift. It
merges the concepts of actions and reducers so that actions reduce the state themselves, reducing the
amount of necessary boilerplate.
                       DESC

  s.homepage         = 'https://github.com/hartbit/MicroRedux.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hartbit' => 'david@atipik.ch' }
  s.source           = { :git => 'https://github.com/hartbit/MicroRedux.swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hartbit'
  s.module_name      = 'MicroRedux'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'MicroRedux/Classes/**/*'

  s.dependency 'RxSwift', '~> 4.1'
  s.dependency 'RxCocoa', '~> 4.1'
end
