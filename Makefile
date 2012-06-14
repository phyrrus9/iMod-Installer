all:
	xcodebuild
	cp -R ./build/Release-iphoneos/imod.app ./imodinstaller/Applications/
	rm -rf ./build
	dpkg -b imodinstaller
