#line 1 "Tweak.x"
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

#line 16 "Tweak.x"

static void _logos_method$_ungrouped$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if (GetPrefBool(@"isEnabled")) {
    _logos_orig$_ungrouped$SBVolumeControl$increaseVolume(self, _cmd);
    AudioServicesPlaySystemSound(1520);
  }
}

static void _logos_method$_ungrouped$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if (GetPrefBool(@"isEnabled")) {
  _logos_orig$_ungrouped$SBVolumeControl$decreaseVolume(self, _cmd);
  AudioServicesPlaySystemSound(1520);
  }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBVolumeControl = objc_getClass("SBVolumeControl"); { MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$increaseVolume);}{ MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume);}} }
#line 32 "Tweak.x"
