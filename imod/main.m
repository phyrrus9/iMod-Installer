//
//  main.m
//  imod
//
//  Created by Ethan Laur on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

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
