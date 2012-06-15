//iMod Installer Application
//Copyright © 2012 Modtech (written by phyrrus9 <phyrrus9@gmail.com>)
//this is free software, and can be used however it needs or wants to be 
//(yes, it has a mind of its own). good luck, dont ask me for help im too lazy.
#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

#import <CoreFoundation/CoreFoundation.h>

#import "Reachability.h"
#define PKG "http://modtech.co/repo/installers/imod.deb"
using namespace std;
@interface ViewController ()

@end

@implementation ViewController
@synthesize devicelabel;
@synthesize ipt3g511;
@synthesize otherdevice;
@synthesize spinner;
@synthesize safetyswitch;
@synthesize status;

enum device { IPT3G, OTHER };
//hello
device d = IPT3G;

- (void)displayDevice
{
    NSString *s;
    if (d == IPT3G)
        s = @"iPod Touch 3G";
    else 
        s = @"Unknown Device";
    [devicelabel setText:s];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayDevice];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSafetyswitch:nil];
    [self setStatus:nil];
    [self setProgress:nil];
    [self setSpinner:nil];
    [self setIpt3g511:nil];
    [self setOtherdevice:nil];
    [self setDevicelabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return false;
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)dealloc {
    [safetyswitch release];
    [status release];
    [spinner release];
    [ipt3g511 release];
    [otherdevice release];
    [devicelabel release];
    [super dealloc];
}
- (IBAction)install:(id)sender {
    if (safetyswitch.on)
    {
        bool install = true;
        //somewhere along the lines I diddnt get done what I needed to...its a project for tomorrow
        Reachability* internetReachable;
        Reachability* hostReachable;
        NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
        if (internetStatus == NotReachable)
        {
            [status setText:@"No internet.."];
            install = false;
        }
        if (install)
        {
        //[NSThread detachNewThreadSelector:@selector(lol) toTarget:self withObject:nil];
        string download = "wget ";
        download += PKG;
        download += "-O /Applications/imod.app/imod.deb";
        system("apt-get remove com.modtech.imod"); //just in case you overwrite it dosnt crash dpkg
        system("rm /Applications/imod.app/imod.deb");
        system("wget http://modtech.co/repo/installers/imod.deb -O /Applications/imod.app/imod.deb");
        system("dpkg -i /Applications/imod.app/imod.deb");
        system("dpkg --configure -a"); //for some reason this is bad juju
        //sleep(3); //was only temporary
        status.text = @"Finished!";
        }
        spinner.stopAnimating;
        safetyswitch.on = false;
    }
}
- (void)reload {
    
}

- (IBAction)statuschange:(id)sender {
    if (safetyswitch.on)
    {
        status.text = @"Installing...";
        spinner.startAnimating;
    }
}
- (IBAction)longpressinstall:(id)sender {
    [status setText:@"Long pressed!"];
    [ipt3g511 setHidden:false];
    [otherdevice setHidden:false];
}
- (IBAction)ipt3gpush:(id)sender {
    d = IPT3G;
    [self displayDevice];
}

- (IBAction)otherdevicepush:(id)sender {
    d = OTHER;
    [self displayDevice];
}
@end
