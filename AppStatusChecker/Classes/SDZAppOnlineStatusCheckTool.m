//
//  SDZAppOnlineStatusCheckTool.m
//  AppStatusChecker
//
//  Created by iMac on 2023/9/14.
//

#import "SDZAppOnlineStatusCheckTool.h"

@implementation SDZAppOnlineStatusCheckTool
+ (SDZAppStatusCheckTool *)checkWithType:(SDZAppOnlineStatusCheckToolType)type para:(NSDictionary *)parameter completionHandler:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completionHandler {
    NSString *ID = parameter[@"ID"];
    if (!ID || ![ID isKindOfClass:NSString.class] || ID.length == 0) {
        NSError *error = [NSError errorWithDomain:@"SDZAppOnlineStatusCheckToolError" code:1000 userInfo:@{@"SDZAppOnlineStatusCheckToolParaError": @"入参 ID 错误"}];
        completionHandler(nil, error);
        return nil;
    }
    SDZAppOnlineStatusCheckTool *tool = [[SDZAppOnlineStatusCheckTool alloc] init];
    [tool checkAppOnlineStatusWithID:ID handler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *decodeErr;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&error];
        if (error) {
            completionHandler(nil, error);
            return;
        }
        if (decodeErr) {
            completionHandler(nil, decodeErr);
            return;
        }
        completionHandler(dic, nil);
    }];
    return tool;
}

- (void)checkAppOnlineStatusWithID:(NSString *)ID handler:(void (NS_SWIFT_SENDABLE ^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@", ID];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:completionHandler];
    [dataTask resume];
}

@end
