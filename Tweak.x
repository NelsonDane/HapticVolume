#import <AudioToolbox/AudioToolbox.h>
#import <Cephei/HBPreferences.h>

// Variables
static BOOL isEnabled;
static CGFloat hapticStrength;

// Enable haptics when the tweak is enabled and set the haptic strength from settings
%hook SBVolumeControl
-(void)increaseVolume {
	%orig;
	if(isEnabled) {
		if (hapticStrength == 1) {
			AudioServicesPlaySystemSound(1519);
		}
		if (hapticStrength == 2) {
			AudioServicesPlaySystemSound(1520);
		}
		if (hapticStrength == 3) {
			AudioServicesPlaySystemSound(1521);
		}
	}
}

-(void)decreaseVolume {
	%orig;
	if(isEnabled) {
		if (hapticStrength == 1) {
			AudioServicesPlaySystemSound(1519);
		}
		if (hapticStrength == 2) {
			AudioServicesPlaySystemSound(1520);
		}
		if (hapticStrength == 3) {
			AudioServicesPlaySystemSound(1521);
		}
	}
}

%end

// Settings
%ctor {

  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.gamersnail.hapticvolumepreferences"];
	[preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];
	[preferences registerFloat:&hapticStrength default:2 forKey:@"hapticStrength"];
}
