#import <Foundation/Foundation.h>

@interface DDYSystemInfo : NSObject

/** bundleName (show in SpringBoard) */
+ (NSString *)ddy_AppBundleName;
/** bundleID com.**.app */
+ (NSString *)ddy_AppBundleID;
/** 版本号 1.1.1 */
+ (NSString *)ddy_AppVersion;
/** build 号 111 */
+ (NSString *)ddy_AppBuildNumber;

/** 获取IDFA */
+ (NSString *)ddy_IDFA;
/** 获取IDFV */
+ (NSString *)ddy_IDFV;
/** 获取UUID */
+ (NSString *)ddy_UUID;
/** 系统版本 */
+ (NSString *)ddy_SystemVersion;
/** 获取系统型号 */
+ (NSString *)ddy_SystemInfo;
/** 获取系统更多设计信息 */
+ (NSDictionary *)ddy_SystemMoreInfo;
/** 获取设备颜色 私有慎用 设备颜色key:@"DeviceColor" 外壳颜色key:@"DeviceEnclosureColor" */
+ (NSString *)ddy_DeviceColor:(NSString *)key;
/** 是否可以打电话 */
+ (BOOL)ddy_CanMakePhoneCall;
/** 获取设备名字 */
+ (NSString *)ddy_DeviceName;
/** 获取磁盘大小 */
+ (long)ddy_DiskTotalSize;
/** 获取磁盘剩余空间 */
+ (long)ddy_DiskFreeSize;
/** 获取电量 */
+ (float)ddy_BatteryLevel;
/** Runtime获取精准电量 */
- (int)ddy_BatteryLevelByRuntime;
/** 获取电池的状态 */
+ (NSString *)ddy_BatteryState;
/** 屏幕亮度 */
+ (float)ddy_ScreenBrightness;
/** 音量大小 */
+ (float)ddy_DeviceVolume;
/** wifi SSID */
+ (NSString *)ddy_WifiSSID;
/**获取WiFi 信息，返回的字典中包含了WiFi的名称、路由器的Mac地址、还有一个Data(转换成字符串打印出来是wifi名称) */
- (NSDictionary *)ddy_WifiFirmwareInfo;
/** 网络制式 */
+ (NSString *)ddy_NetCarrier;
/** 获取内网ip地址 */
+ (NSString *)ddy_WANIPAddress;
/** 获取外网ip地址 */
+ (NSString *)ddy_InternetIPAddress;
/** 获取MAC地址(已被苹果废掉,每次都变化) */
+ (NSString *)ddy_MacAddress;
/** 获取广播地址，内网地址，子网掩码，端口 */
- (NSMutableDictionary *)ddy_WifiModoInfo;
/** 获取网关信息 */
- (NSString *)ddy_WiFiGatewayInfo;
/** 是否被破解 */
+ (BOOL)ddy_Cracked;
/** 判断是否越狱 */
+ (BOOL)ddy_JailBreak;
/** 判断是否插入sim卡 */
+ (BOOL)ddy_SimInserted;
/** 获取系统开机时间到1970时间差值(毫秒) */
+ (long)ddy_BootTime;
/** 用户是否使用代理 */
+ (BOOL)ddy_IsViaProxy;

/** CPU频率 */
+ (NSUInteger)ddy_CPUFrequency;
/** 总线频率 */
+ (NSUInteger)ddy_BusFrequency;
/** 主存大小 */
+ (NSUInteger)ddy_RamSize;
/** CPU型号 */
+ (NSUInteger)ddy_CPUNumber;
/** 总内存 */
+ (NSUInteger)ddy_TotalMemory;
/** 用户内存 */
+ (NSUInteger)ddy_UserMemory;
/** 内存使用状况 */
+ (float)ddy_MemoryUsage;
/** CPU使用情况(包含监控线程) 和xCode不一致 */
+ (float)ddy_CPUUsage;
/** CPU使用情况(排除监控线程) 和xCode不一致 */
+ (float)ddy_CPUUsage2;

@end
// https://github.com/PengfeiWang666/iOS-getClientInfo
