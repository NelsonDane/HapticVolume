#line 1 "Tweak.x"
#import <AudioToolbox/AudioToolbox.h>
#import <Cephei/HBPreferences.h>

static BOOL isEnabled;
static float hapticStrength;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBVolumeControl; 
static void (*_logos_orig$_ungrouped$SBVolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); 

#line 7 "Tweak.x"

static void _logos_method$_ungrouped$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBVolumeControl$increaseVolume(self, _cmd);
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

static void _logos_method$_ungrouped$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume(self, _cmd);
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



static void loadPrefs() {
	
	
	isEnabled = [[HBPreferences objectForKey:@"isEnabled"] boolValue];
	hapticStrength = [[HBPreferences objectforKey:"hapticStrength"] floatValue];
}

static __attribute__((constructor)) void _logosLocalCtor_a2cc5a99(int __unused argc, char __unused **argv, char __unused **envp) {

  
	loadPrefs();
	
	
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBVolumeControl = objc_getClass("SBVolumeControl"); { MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$increaseVolume);}{ MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume);}} }
#line 54 "Tweak.x"
