#import <AudioToolbox/AudioToolbox.h>
#import <Cephei/HBPreferences.h>

static BOOL isEnabled;
static float hapticStrength;

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

static void loadPrefs() {
	//isEnabled = YES;
	//hapticStrength = 3;
	isEnabled = [[HBPreferences objectForKey:@"isEnabled"] boolValue];
	hapticStrength = [[HBPreferences objectforKey:"hapticStrength"] floatValue];
}

%ctor {

  //HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.gamersnail.hapticvolumepreferences"];
	loadPrefs();
	//[preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];
	//[preferences registerInteger:&hapticStrength default:2 forKey:@"hapticStrength"];
}
