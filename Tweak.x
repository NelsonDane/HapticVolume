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
