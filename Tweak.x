#define PLIST_PATH @"/var/mobile/Library/Preferences/com.gamersnail.hapticvolumepreferences.plist"
#import <AudioToolbox/AudioToolbox.h>

inline bool GetPrefBool (NSString *key)
{
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


NSString* GetPrefString (NSString *key)
{
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] stringValue];
}


%hook SBVolumeControl
-(void)increaseVolume {
  if (GetPrefBool(@"isEnabled")) {
    %orig;
    AudioServicesPlaySystemSound(1520);
  }
}

-(void)decreaseVolume {
  if (GetPrefBool(@"isEnabled")) {
  %orig;
  AudioServicesPlaySystemSound(1520);
  }
}

%end
