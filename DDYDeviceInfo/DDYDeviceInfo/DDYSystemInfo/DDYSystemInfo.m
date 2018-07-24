#import "DDYSystemInfo.h"
#import <UIKit/UIKit.h>
#import <AdSupport/ASIdentifierManager.h> //IDFA
#import <sys/utsname.h> // 获取系统型号
#import <AVFoundation/AVFoundation.h> // 音量
#import <SystemConfiguration/CaptiveNetwork.h> //wifiSSID
#import <CoreTelephony/CTTelephonyNetworkInfo.h> // 网络制式
#import <CoreTelephony/CTCarrier.h>
#import <sys/ioctl.h> // ip 地址
#import <net/if.h>
#import <arpa/inet.h>
#import <sys/stat.h> // 越狱
#import <dlfcn.h>
#include <sys/sysctl.h> // CPU

@implementation DDYSystemInfo

#pragma mark bundleName (show in SpringBoard)
+ (NSString *)ddy_AppBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

#pragma mark bundleID com.**.app
+ (NSString *)ddy_AppBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

#pragma mark 版本号 1.1.1
+ (NSString *)ddy_AppVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

#pragma mark build 号 111
+ (NSString *)ddy_AppBuildNumber {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

#pragma mark 获取IDFA
+ (NSString *)ddy_IDFA {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

#pragma mark 获取IDFV
+ (NSString *)ddy_IDFV {
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
}

#pragma mark 获取UUID
+ (NSString *)ddy_UUID {
    return [[NSUUID UUID] UUIDString];
}

#pragma mark 系统版本
+ (NSString *)ddy_SystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark 获取设备型号
+ (NSString *)ddy_DeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if([deviceString isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if([deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if([deviceString isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
    if([deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if([deviceString isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if([deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}

#pragma mark 获取设备名字
+ (NSString *)ddy_DeviceName {
    return [UIDevice currentDevice].name;
}

#pragma mark 获取磁盘大小
+ (long)ddy_DiskTotalSize {
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *diskTotalSize = [systemAttributes objectForKey:NSFileSystemSize];
    return (long)(diskTotalSize.floatValue / 1024.f / 1024.f);
}

#pragma mark 获取磁盘剩余空间
+ (long)ddy_DiskFreeSize {
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *diskFreeSize = [systemAttributes objectForKey:NSFileSystemFreeSize];
    return (long)(diskFreeSize.floatValue / 1024.f / 1024.f);
}

#pragma mark 获取电量
+ (float)ddy_BatteryLevel {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [[UIDevice currentDevice] batteryLevel];
}

#pragma mark 获取电池的状态
+ (NSString *)ddy_BatteryState {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
    switch (batteryState) {
        case UIDeviceBatteryStateUnplugged:
            return @"未充电";
        case UIDeviceBatteryStateCharging:
            return @"充电中";
        case UIDeviceBatteryStateFull:
            return @"已充满";
        default:
            return @"未知";
    }
}

#pragma mark 屏幕亮度
+ (float)ddy_ScreenBrightness {
    return [UIScreen mainScreen].brightness;
}

#pragma mark 音量大小
+ (float)ddy_DeviceVolume {
    return [[AVAudioSession sharedInstance] outputVolume];
}

#pragma mark wifi名称
+ (NSString *)ddy_WifiSSID {
    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();
    
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    
    return [dctySSID objectForKey:@"SSID"];
}

#pragma mark 网络制式
+ (NSString *)ddy_NetCarrier {
    NSString *mobileCarrier;
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    NSString *MCC = carrier.mobileCountryCode;
    NSString *MNC = carrier.mobileNetworkCode;
    
    if (!MCC || !MNC) {
        mobileCarrier = @"No Sim";
    } else {
        if ([MCC isEqualToString:@"460"]) {
            if ([MNC isEqualToString:@"00"] || [MNC isEqualToString:@"02"] || [MNC isEqualToString:@"07"]) {
                mobileCarrier = @"China Mobile";
            } else if ([MNC isEqualToString:@"01"] || [MNC isEqualToString:@"06"]) {
                mobileCarrier = @"China Unicom";
            } else if ([MNC isEqualToString:@"03"] || [MNC isEqualToString:@"05"] || [MNC isEqualToString:@"11"]) {
                mobileCarrier = @"China Telecom";
            } else if ([MNC isEqualToString:@"20"]) {
                mobileCarrier = @"China Tietong";
            } else {
                mobileCarrier = [NSString stringWithFormat:@"MNC%@", MNC];
            }
        } else {
            mobileCarrier = @"Foreign Carrier";
        }
    }
    return mobileCarrier;
}

#pragma mark 获取内网ip地址
+ (NSString *)ddy_WANIPAddress {
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) return nil;
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    struct ifconf ifc;
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    struct ifreq *ifr, ifrcopy;
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    close(sockfd);
    return ips.lastObject;
}

#pragma mark 获取外网ip地址
+ (NSString *)ddy_InternetIPAddress {
    // 请求url
    NSURL *url = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *mString = [NSMutableString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    // 判断返回字符串是否为所需数据
    if ([mString hasPrefix:@"var returnCitySN = "]) {
        // 对字符串进行处理，获取json数据
        [mString deleteCharactersInRange:NSMakeRange(0, 19)];
        NSString *jsonStr = [mString substringToIndex:mString.length - 1];
        // 对Json字符串进行Json解析
        NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        return dict[@"cip"];
    }
    return nil;
}

#pragma mark 是否被破解
+ (BOOL)ddy_Cracked {
#if !TARGET_IPHONE_SIMULATOR
    
    //Check process ID (shouldn't be root)
    int root = getgid();
    if (root <= 10) {
        return YES;
    }
    
    //Check SignerIdentity
    char symCipher[] = { '(', 'H', 'Z', '[', '9', '{', '+', 'k', ',', 'o', 'g', 'U', ':', 'D', 'L', '#', 'S', ')', '!', 'F', '^', 'T', 'u', 'd', 'a', '-', 'A', 'f', 'z', ';', 'b', '\'', 'v', 'm', 'B', '0', 'J', 'c', 'W', 't', '*', '|', 'O', '\\', '7', 'E', '@', 'x', '"', 'X', 'V', 'r', 'n', 'Q', 'y', '>', ']', '$', '%', '_', '/', 'P', 'R', 'K', '}', '?', 'I', '8', 'Y', '=', 'N', '3', '.', 's', '<', 'l', '4', 'w', 'j', 'G', '`', '2', 'i', 'C', '6', 'q', 'M', 'p', '1', '5', '&', 'e', 'h' };
    char csignid[] = "V.NwY2*8YwC.C1";
    for(int i=0;i<strlen(csignid);i++)
    {
        for(int j=0;j<sizeof(symCipher);j++)
        {
            if(csignid[i] == symCipher[j])
            {
                csignid[i] = j+0x21;
                break;
            }
        }
    }
    NSString* signIdentity = [[NSString alloc] initWithCString:csignid encoding:NSUTF8StringEncoding];
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    if ([info objectForKey:signIdentity] != nil)
    {
        return YES;
    }
    
    //Check files
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSFileManager *manager = [NSFileManager defaultManager];
    static NSString *str = @"_CodeSignature";
    BOOL fileExists = [manager fileExistsAtPath:([NSString stringWithFormat:@"%@/%@", bundlePath, str])];
    if (!fileExists) {
        return YES;
    }
    
    static NSString *str2 = @"ResourceRules.plist";
    BOOL fileExists3 = [manager fileExistsAtPath:([NSString stringWithFormat:@"%@/%@", bundlePath, str2])];
    if (!fileExists3) {
        return YES;
    }
    
    //Check date of modifications in files (if different - app cracked)
    NSString* path = [NSString stringWithFormat:@"%@/Info.plist", bundlePath];
    NSString* path2 = [NSString stringWithFormat:@"%@/AppName", bundlePath];
    NSDate* infoModifiedDate = [[manager attributesOfFileSystemForPath:path error:nil] fileModificationDate];
    NSDate* infoModifiedDate2 = [[manager attributesOfFileSystemForPath:path2 error:nil]  fileModificationDate];
    NSDate* pkgInfoModifiedDate = [[manager attributesOfFileSystemForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"PkgInfo"] error:nil] fileModificationDate];
    if([infoModifiedDate timeIntervalSinceReferenceDate] > [pkgInfoModifiedDate timeIntervalSinceReferenceDate]) {
        return YES;
    }
    if([infoModifiedDate2 timeIntervalSinceReferenceDate] > [pkgInfoModifiedDate timeIntervalSinceReferenceDate]) {
        return YES;
    }
#endif
    return NO;
}

#pragma mark 判断是否越狱
+ (BOOL)ddy_JailBreak {
    // 以下检测的过程是越往下，越狱越高级
    // 获取越狱文件路径
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        return YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        return YES;
    }
    
    // 可能存在hook了NSFileManager方法，此处用底层C stat去检测
    struct stat stat_info;
    if (0 == stat("/Library/MobileSubstrate/MobileSubstrate.dylib", &stat_info)) {
        return YES;
    }
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        return YES;
    }
    if (0 == stat("/var/lib/cydia/", &stat_info)) {
        return YES;
    }
    if (0 == stat("/var/cache/apt", &stat_info)) {
        return YES;
    }
    
    // 可能存在stat也被hook了，可以看stat是不是出自系统库，有没有被攻击者换掉。这种情况出现的可能性很小
    int ret;
    Dl_info dylib_info;
    int (*func_stat)(const char *,struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
        // 相等为0，不相等，肯定被攻击
        if (strcmp(dylib_info.dli_fname, "/usr/lib/system/libsystem_kernel.dylib")) {
            return YES;
        }
    }
    
    // 通常，越狱机的输出结果会包含字符串：Library/MobileSubstrate/MobileSubstrate.dylib。
    // 攻击者给MobileSubstrate改名，原理都是通过DYLD_INSERT_LIBRARIES注入动态库。那么可以检测当前程序运行的环境变量
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
        return YES;
    }
    return NO;
}

+ (BOOL)isJailBreak {
#if !TARGET_IPHONE_SIMULATOR
    // Check for Cydia.app
    BOOL yes;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Cyd", @"ia.", @"app"]]
        || [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/l", @"ib/a", @"pt/"] isDirectory:&yes]
        ||  [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"us", @"r/l",@"ibe", @"xe", @"c/cy", @"dia"] isDirectory:&yes])
    {
        // Cydia installed
        return YES;
    }
    
    // Try to write file in private
    NSError *error;
    
    static NSString *str = @"Jailbreak test string";
    
    [str writeToFile:@"/private/test_jail.txt" atomically:YES
            encoding:NSUTF8StringEncoding error:&error];
    
    if(error==nil){
        // Writed
        return YES;
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:@"/private/test_jail.txt" error:nil];
    }
#endif
    return NO;
}

#pragma mark 判断是否插入sim卡
+ (BOOL)ddy_SimInserted {
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    if (!carrier.isoCountryCode) {
        return NO;
    }
    return YES;
}

#pragma mark 获取系统开机时间到1970时间差值（毫秒）
+ (long)ddy_BootTime {
    NSTimeInterval timer = [NSProcessInfo processInfo].systemUptime;
    NSDate *startTime = [[NSDate new] dateByAddingTimeInterval:(-timer)];
    NSTimeInterval timeStamp = [startTime timeIntervalSince1970];
    return timeStamp * 1000;
}

#pragma mark 用户是否使用代理
+ (BOOL)ddy_IsViaProxy {
    NSDictionary *proxySettings = (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
    NSArray *proxies = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)([NSURL URLWithString:@"https://www.baidu.com/"]), (__bridge CFDictionaryRef _Nonnull)(proxySettings)));
    NSDictionary *settings = proxies[0];
    if (![[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"]) {
        return YES;
    }
    return NO;
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier {
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

#pragma mark CPU频率
+ (NSUInteger)ddy_CPUFrequency {
    return [self getSysInfo:HW_CPU_FREQ];
}

#pragma mark 总线频率
+ (NSUInteger)ddy_BusFrequency {
    return [self getSysInfo:HW_TB_FREQ];
}

#pragma mark
+ (NSUInteger)ddy_RamSize {
    return [self getSysInfo:HW_MEMSIZE];
}

#pragma mark
+ (NSUInteger)ddy_CPUNumber {
    return [self getSysInfo:HW_NCPU];
}

#pragma mark
+ (NSUInteger)ddy_TotalMemory {
    return [self getSysInfo:HW_PHYSMEM];
}

#pragma mark 
+ (NSUInteger)ddy_UserMemory {
    return [self getSysInfo:HW_USERMEM];
}


#pragma mark 内存使用状况
+ (float)ddy_MemoryUsage {
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&taskInfo, &infoCount);
    if (kernReturn != KERN_SUCCESS) { return NSNotFound; }
    return taskInfo.resident_size/1024.0/1024.0;
}

#pragma mark CPU使用情况(包含监控线程) 和xCode不一致
+ (float)ddy_CPUUsage {
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;
    
    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    task_basic_info_t      basic_info;
    thread_array_t         thread_list;
    mach_msg_type_number_t thread_count;
    
    thread_info_data_t     thinfo;
    mach_msg_type_number_t thread_info_count;
    
    thread_basic_info_t basic_info_th;
    uint32_t stat_thread = 0;
    
    basic_info = (task_basic_info_t)tinfo;
    
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    if (thread_count > 0)
        stat_thread += thread_count;
    
    long tot_sec = 0;
    long tot_usec = 0;
    float tot_cpu = 0;
    int j;
    
    for (j = 0; j < thread_count; j++)
    {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                         (thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->user_time.microseconds + basic_info_th->system_time.microseconds;
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 100.0;
        }
    }
    
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    
    return tot_cpu;
}

#pragma mark CPU使用情况(排除监控线程) 和xCode不一致
+ (float)ddy_CPUUsage2 {
    kern_return_t           kr;
    thread_array_t          thread_list;
    mach_msg_type_number_t  thread_count;
    thread_info_data_t      thinfo;
    mach_msg_type_number_t  thread_info_count;
    thread_basic_info_t     basic_info_th;
    
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    float cpu_usage = 0;
    
    for (int i = 0; i < thread_count; i++)
    {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[i], THREAD_BASIC_INFO,(thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE))
        {
            cpu_usage += basic_info_th->cpu_usage;
        }
    }
    
    cpu_usage = cpu_usage / (float)TH_USAGE_SCALE * 100.0;
    
    vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    
    return cpu_usage;
}

@end
