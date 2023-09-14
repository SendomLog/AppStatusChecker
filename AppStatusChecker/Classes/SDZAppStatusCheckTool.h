//
//  SDZAppStatusCheckTool.h
//  AppStatusChecker
//
//  Created by iMac on 2023/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SDZAppOnlineStatusCheckToolType) {
    SDZAppOnlineStatusCheckToolTypeOnline,
};

@interface SDZAppStatusCheckTool : NSObject

+ (SDZAppStatusCheckTool *)checkWithType:(SDZAppOnlineStatusCheckToolType)type
                                    para: (NSDictionary * _Nullable)parameter
                       completionHandler:(void (NS_SWIFT_SENDABLE ^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
