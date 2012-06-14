//iMod Installer Application
//Copyright © 2012 Modtech (written by phyrrus9 <phyrrus9@gmail.com>)
//this is free software, and can be used however it needs or wants to be 
//(yes, it has a mind of its own). good luck, dont ask me for help im too lazy.
#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    setuid(0);
    system("whoami");
    //system("sudo dpkg -i /Applications/imod.app/imod.deb");
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
