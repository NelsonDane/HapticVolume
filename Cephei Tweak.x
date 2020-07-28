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
