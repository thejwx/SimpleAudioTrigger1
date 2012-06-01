//
//  ViewController.m
//  SimpleAudioTrigger1
//
//  Created by frogTemplate on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize audioEffect;
@synthesize viewController = _viewController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

    // ADDED RELEASE
    AudioServicesDisposeSystemSoundID(audioEffect);
}

- (void)dealloc
{
    // ADDED RELEASE
    AudioServicesDisposeSystemSoundID(audioEffect);
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Audio additions
// DON'T FORGET TO ADD #import <AudioToolbox/AudioToolbox.h> in header file and specify AudioToolbox/AudioToolbox.h IN "Build Phase" tab
- (IBAction)play:(id)sender {
    [self playSound:@"cough" ext:@"mp3"];
}

- (IBAction)playOnPageSlide:(id)sender {
    [self playSound:@"swoosh" ext:@"mp3"];
    if (!self.viewController) {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    }
    [self.navigationController pushViewController:self.viewController animated:YES];
}

- (void) playSound:(NSString *)fName ext:(NSString *)ext {
    NSString *path  = [[NSBundle mainBundle] pathForResource:fName ofType:ext];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSURL *pathURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((CFURLRef) pathURL, &audioEffect);
        AudioServicesPlaySystemSound(audioEffect);
    }
    else
    {
        NSLog(@"error, file not found: %@", path);
    }
}
@end
