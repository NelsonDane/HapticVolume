#import <AudioToolbox/AudioToolbox.h>

%hook SBVolumeControl
-(void)increaseVolume {
  %orig;

  NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
  persistantDomainForName:@"com.gamersnail.hapticvolumepreferences"];

  id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];

  if(isEnabled) {
    AudioServicesPlaySystemSound(1520);
  }
}

-(void)decreaseVolume {
  %orig;
  if(isEnabled) {
    AudioServicesPlaySystemSound(1520);
  }
}


%end

#import <AudioToolbox/AudioToolbox.h>

%hook SBVolumeControl
-(void)increaseVolume {
  %orig;
  AudioServicesPlaySystemSound(1520);
}

-(void)decreaseVolume {
  %orig;
  AudioServicesPlaySystemSound(1520);
}

%end

@interface SBLockScreenViewControllerBase : UIViewController
@end

%hook SBLockScreenViewControllerBase
-(void)viewWillAppear:(BOOL)arg1 {
  %orig;

  UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
  [statusView setBackgroundColor:[UIColor blackColor]];

  UILabel *statusLabel = [[UILabel alloc] initWithFrame:statusView.frame];
  [statusLabel setTextColor:[UIColor whiteColor]];

  NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
  persistantDomainForName:@"com.gamersnail.hapticvolumepreferences"];

  id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];
  if ([isEnabled isEqual:@0]) {
    statusLabel.text = @"OFF";
  } else {
    statusLabel.text = @"ON";
  }

[statusView addSubview:statusLabel];
[self.view addSubview:statusView];
}
%end
