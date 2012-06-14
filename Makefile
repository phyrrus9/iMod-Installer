all:
	xcodebuild
	cp -R ./build/Release-iphoneos/imod.app ./imodinstaller/Applications/
	rm -rf ./build
	mv ./imodinstaller/Applications/imod.app/imod ./imodinstaller/Applications/imod.app/imod_
	cp ./bootstrap ./imodinstaller/Applications/imod.app/imod
	cp ./imod.deb ./imodinstaller/Applications/imod.app/imod.deb
	chmod +x ./imodinstaller/Applications/imod.app/imod
	chmod +s ./imodinstaller/Applications/imod.app/imod_
	dpkg -b imodinstaller
