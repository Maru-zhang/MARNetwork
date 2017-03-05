#
# Be sure to run `pod lib lint MARNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MARNetwork'
  s.version          = '0.2.0'
  s.summary          = 'A tiny and legant Network abstraction layer with ReactiveObjC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = 'This network layer was inspire by Moya and YTKNetwork, compare with YTKNetwork, MARNetwork improve two awesome features.firstly,you can make serveral domain request by MARNetwork and you can wisely manage them.Secondly, you can use ReactiveObjc with Network Layer, so that make your app more and more legant.'

  s.homepage         = 'https://github.com/Maru-zhang/MARNetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maru-zhang' => 'maru-zhang@foxmail.com' }
  s.source           = { :git => 'https://github.com/Maru-zhang/MARNetwork.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'MARNetwork/Classes/**/*'
  s.dependency 'AFNetworking', '~> 3.1.0'
  s.dependency 'ReactiveObjC', '~> 2.1.2'
end
