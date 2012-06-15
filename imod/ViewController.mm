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
@synthesize optionsbutton;
@synthesize optionslabel;
@synthesize installbuttonoutlet;
@synthesize spinner;
@synthesize safetyswitch;
@synthesize status;

enum device { IPT3G, OTHER };
//hello
device d = IPT3G;
ofstream logfile;

- (void)displayDevice
{
    NSString *s;
    if (d == IPT3G)
        s = @"Who cares (5.1.1)";
    else 
        s = @"Unknown Device";
    [devicelabel setText:s];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayDevice];
	// Do any additional setup after loading the view, typically from a nib.
    logfile.open("/var/mobile/imodinstaller.log", ios::trunc);
    if (checkforupdate() == 3)
        [installbuttonoutlet setTitle:@"Update" forState:UIControlStateNormal];
    if (checkforupdate() == 2)
    {
        [installbuttonoutlet setTitle:@"Up to date" forState:UIControlStateNormal];
        [installbuttonoutlet setEnabled:false];
    }
}

- (void)viewDidUnload
{
    [self setSafetyswitch:false];
    [self setStatus:nil];
    [self setSpinner:nil];
    [self setDevicelabel:nil];
    [self setOptionsbutton:nil];
    [self setOptionslabel:nil];
    [self setInstallbuttonoutlet:nil];
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
    [devicelabel release];
    [optionsbutton release];
    [optionslabel release];
    [installbuttonoutlet release];
    [super dealloc];
}
- (IBAction)install:(id)sender {
    logfile << "install pressed" << endl;
    if (safetyswitch.on)
    {
        logfile << "safety switch enabled" << endl;
        bool install = true;
        //somewhere along the lines I diddnt get done what I needed to...its a project for tomorrow
        /*Reachability* internetReachable;
        Reachability* hostReachable;
        NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
        if (internetStatus == NotReachable)
        {
            [status setText:@"No internet.."];
            install = false;
        }*/
        if (install)
        {
            logfile << "install granted" << endl;
            //[NSThread detachNewThreadSelector:@selector(lol) toTarget:self withObject:nil];
            string download = "wget ";
            download += PKG;
            download += "-O /Applications/imod.app/imod.deb";
            system("apt-get remove com.modtech.imod"); //just in case so it dosnt crash dpkg
            logfile << "remove old pkg" << endl;
            system("rm /Applications/imod.app/imod.deb");
            logfile << "download new package" << endl;
            system("wget http://modtech.co/repo/installers/imod.deb -O /Applications/imod.app/imod.deb");
            logfile << "done: imod.deb" << endl;
            system("dpkg -i /Applications/imod.app/imod.deb");
            logfile << "installed..." << endl;
            system("dpkg --configure -a"); //for some reason this is bad juju
            logfile << "configuring" << endl;
            //sleep(3); //was only temporary
            status.text = @"Finished!";
        }
        spinner.stopAnimating;
        safetyswitch.on = false;
        [self performSegueWithIdentifier:@"optionspane" sender:self];
    }
}
- (void)reload {
    
}

- (IBAction)statuschange:(id)sender {
    if (safetyswitch.on)
    {
        [installbuttonoutlet setHidden:true];
        status.text = @"Installing...";
        spinner.startAnimating;
    }
}
- (IBAction)longpressinstall:(id)sender {
    [optionsbutton setHidden:false];
    [optionslabel setHidden:false];
    [spinner stopAnimating];
    [installbuttonoutlet setHidden:false];
}

int checkforupdate(void)
{
    system("wget http://modtech.co/repo/installers/imodversion.txt -O /var/mobile/imodv.txt");
    ifstream f("/var/mobile/imodv.txt");
    int version;
    f >> version;
    f.close();
    f.open("/var/mobile/.imodv");
    if (!f) //if the file isnt there
        return 1;
    int iversion;
    f >> iversion;
    if (version > iversion)
        return 3;
    else
        return 2;
}
@end

@implementation view2
@synthesize status2;

- (IBAction)respring:(id)sender
{
    sleep(2);
    system("sleep 1 && killall SpringBoard && killall imod_"); //attempt to fix crashing of imod app
}

- (IBAction)reboot:(id)sender
{
    sleep(3);
    system("reboot");
}

- (IBAction)respringprep:(id)sender
{
    [status2 setText:@"Respringing..."];
}

- (IBAction)rebootprep:(id)sender
{
    [status2 setText:@"Rebooting..."];
}

- (void)dealloc {
    [status2 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setStatus2:nil];
    [super viewDidUnload];
}
@end
