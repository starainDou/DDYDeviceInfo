#import "DDYBatteryInfo.h"

@implementation DDYBatteryInfo

- (instancetype)init {
    if (self = [super init]) {
        NSBundle *bundle = [NSBundle bundleWithPath:@"/System/Library/UserEventPlugins/ADEventListenerPlugin.plugin"];
        BOOL loadSuccess = [bundle load];
        if (loadSuccess) {
            Class PLBatteryProperties = NSClassFromString(@"PLBatteryProperties");
            id infoInstance = [[PLBatteryProperties alloc] init];
            
            _gasGaugeEnabled = [infoInstance gasGaugeEnabled];
            _maxCapacity = [infoInstance maxCapacity];
            _currentCapacity = [infoInstance currentCapacity];
            _rawCurrentCapacity = [infoInstance rawCurrentCapacity];
            _capacity = [infoInstance capacity];
            _rawCapacity = [infoInstance rawCapacity];
            _voltage = [infoInstance voltage];
            _isCharging = [infoInstance isCharging];
            _isPluggedIn = [infoInstance isPluggedIn];
            _isCritical = [infoInstance isCritical];
            _chargingCurrent = [infoInstance chargingCurrent];
            _batteryTemp = [infoInstance batteryTemp];
            _cycleCount = [infoInstance cycleCount];
            _designCapacity = [infoInstance designCapacity];
            _current = [infoInstance current];
            _fullyCharged = [infoInstance fullyCharged];
            _draining = [infoInstance draining];
            _updateTime = [infoInstance updateTime];
            _adapterInfo = [infoInstance adapterInfo];
            _connectedStatus = [infoInstance connectedStatus];
        }
    }
    return self;
}

@end

/**
 http://blog.51cto.com/chenjohney/1288551
 https://github.com/ichitaso/iOS-iphoneheaders/blob/be1e4073114a6572b34b171245a62186a732e561/iOS8.1.1/System/Library/UserEventPlugins/ADEventListenerPlugin.plugin/PLBatteryProperties.h
 */
