#import <AudioToolbox/AudioToolbox.h>
#import <Cephei/HBPreferences.h>

static BOOL isEnabled;
static CGFloat hapticStrength;

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

%ctor {

  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.gamersnail.hapticvolumepreferences"];
	[preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];
	[preferences registerFloat:&hapticStrength default:2 forKey:@"hapticStrength"];
}
