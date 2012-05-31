//
//  ViewController.h
//  SimpleAudioTrigger1
//
//  Created by frogTemplate on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController

@property SystemSoundID audioEffect;

- (IBAction)play:(id)sender;
- (void) playSound:(NSString *)fName ext:(NSString *)ext;

@end
