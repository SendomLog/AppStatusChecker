//
//  SDZAppStatusCheckTool.m
//  AppStatusChecker
//
//  Created by iMac on 2023/9/14.
//

#import "SDZAppStatusCheckTool.h"

#import "SDZAppOnlineStatusCheckTool.h"

@implementation SDZAppStatusCheckTool

+ (SDZAppStatusCheckTool *)checkWithType:(SDZAppOnlineStatusCheckToolType)type
                                    para: (NSDictionary * _Nullable)parameter
                       completionHandler:(void (NS_SWIFT_SENDABLE ^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler {
    switch (type) {
        case SDZAppOnlineStatusCheckToolTypeOnline:
            return [SDZAppOnlineStatusCheckTool checkWithType:type para:parameter completionHandler:completionHandler];
    }
}

@end
