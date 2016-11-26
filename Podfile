source 'https://github.com/CocoaPods/Specs.git'

platform :osx, '10.9'

# ignore all warnings from all pods
inhibit_all_warnings!

def common_pods
    pod 'objcTox', :git => 'https://github.com/Antidote-for-Tox/objcTox.git', :commit => '1e051b5c078dc8f1e7709ecc923923a119f7ad85'
end

target :Antidote do
    common_pods
end

target :AntidoteTests do
    common_pods
end
