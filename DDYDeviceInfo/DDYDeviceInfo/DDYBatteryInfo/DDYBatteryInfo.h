#import <Foundation/Foundation.h>

@interface DDYBatteryInfo : NSObject

/** 是否启用气体压力表 */
@property (nonatomic, readonly) BOOL gasGaugeEnabled;
/**  */
@property (nonatomic, readonly) double maxCapacity;
/**  */
@property (nonatomic, readonly) double currentCapacity;
/**  */
@property (nonatomic, readonly) double rawCurrentCapacity;
/**  */
@property (nonatomic, readonly) double capacity;
/**  */
@property (nonatomic, readonly) double rawCapacity;
/**  */
@property (nonatomic, readonly) long long voltage;
/**  */
@property (nonatomic, readonly) BOOL isCharging;
/**  */
@property (nonatomic, readonly) BOOL isPluggedIn;
/**  */
@property (nonatomic, readonly) BOOL isCritical;
/**  */
@property (nonatomic, readonly) long long chargingCurrent;
/**  */
@property (nonatomic, readonly) long long batteryTemp;
/**  */
@property (nonatomic, readonly) long long cycleCount;
/**  */
@property (nonatomic, readonly) long long designCapacity;
/**  */
@property (nonatomic, readonly) long long current;
/**  */
@property (nonatomic, readonly) BOOL fullyCharged;
/**  */
@property (nonatomic, readonly) BOOL draining;
/**  */
@property (nonatomic, readonly) long long updateTime;
/**  */
@property (nonatomic, readonly) NSNumber * adapterInfo;
/**  */
@property (nonatomic, readonly) NSNumber * connectedStatus;

@end

@interface PLBatteryProperties : NSObject {
    unsigned batteryEntry;
    NSDictionary *batteryProperties;
}

@property (nonatomic, readonly) BOOL gasGaugeEnabled;
@property (nonatomic, readonly) double maxCapacity;
@property (nonatomic, readonly) double currentCapacity;
@property (nonatomic, readonly) double rawCurrentCapacity;
@property (nonatomic, readonly) double capacity;
@property (nonatomic, readonly) double rawCapacity;
@property (nonatomic, readonly) long long voltage;
@property (nonatomic, readonly) BOOL isCharging;
@property (nonatomic, readonly) BOOL isPluggedIn;
@property (nonatomic, readonly) BOOL isCritical;
@property (nonatomic, readonly) long long chargingCurrent;
@property (nonatomic, readonly) long long batteryTemp;
@property (nonatomic, readonly) long long cycleCount;
@property (nonatomic, readonly) long long designCapacity;
@property (nonatomic, readonly) long long current;
@property (nonatomic, readonly) BOOL fullyCharged;
@property (nonatomic, readonly) BOOL draining;
@property (nonatomic, readonly) long long updateTime;
@property (nonatomic, readonly) NSNumber * adapterInfo;
@property (nonatomic, readonly) NSNumber * connectedStatus;

+ (id)properties;

@end
