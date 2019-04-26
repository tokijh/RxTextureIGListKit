# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'RxTextureIGListKit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Lint 
  pod 'SwiftLint'

  # Architecture
  pod 'ReactorKit'

  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'

  # UI
  pod 'SnapKit'
  pod 'RxViewController'
  pod 'Texture', :git => 'https://github.com/TextureGroup/Texture.git', :commit => '15fb7e0c1f651da59d1b9c68abcd98d953ff2f4a'
  pod 'Texture/IGListKit', :git => 'https://github.com/TextureGroup/Texture.git', :commit => '15fb7e0c1f651da59d1b9c68abcd98d953ff2f4a'
  pod 'IGListKit'

  # Misc.
  pod 'Then'

  target 'RxTextureIGListKitTests' do
    inherit! :search_paths

    pod 'Stubber'
    pod 'Quick'
    pod 'RxNimble/RxTest'

  end

end
