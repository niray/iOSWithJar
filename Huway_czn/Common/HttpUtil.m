//
// Created by Gorey on 15/7/21.
// Copyright (c) 2015 中华户外网. All rights reserved.
//

#import "HttpUtil.h"
#import "AFHTTPRequestOperationManager.h"
#import "JSONModel+Http.h"

@implementation HttpUtil {

}
+ (HttpUtil *)instance {
    static HttpUtil *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}



//绝对URL
- (void)startNormalAsyncAction:(NSString *)urlString param:(NSDictionary *)param model:(Class)cls ok:(void (^)(JSONModel *model))ok ng:(void (^)(NSString *errMsg))ng requestType:(REQUEST_TYPE)requestType needToken:(BOOL)needToken {


    NSString *httpUrl = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"url:%@", httpUrl);

    NSDictionary *md =  param; //[self addTokenParam:param];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 加入Header 处理
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"4" forHTTPHeaderField:@"Request-Source"];
    [requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Response-Type"];
    [requestSerializer setValue:@"v_1_0" forHTTPHeaderField:@"version"];

    if (needToken) {
        NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
        [requestSerializer setValue:token forHTTPHeaderField:@"Request-Token"];
    }
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];


    // 正常回调
    void (^OKBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);

        JSONModelError *error;
        JSONModel *m = [JSONModel jsonModelWithClass:cls jsonData:responseObject error:error];

        // 解析失败
        if (error) {
            ng([error description]);
        }
        else {

            // 在公共接口里处理 业务失败, 即: 返回code != 2000 时, 进入 ng
            id code = [m valueForKey:@"status"];
            NSString *message = [m valueForKey:@"message"];
            if (code && message) {
                // 业务正常
                if ([code intValue] == 2000) {
                    ok(m);
                }
                else {
                    // 业务异常
                    ng(message);
                }
            }
            else {
                // 解析正常时返回
                ok(m);
            }
        }
    };

    // 失败回调
    void (^NGBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        ng([error description]);
    };


    // 发起请求
    switch (requestType) {
        case TYPE_GET:
            [manager GET:httpUrl parameters:md success:OKBlock failure:NGBlock];
            break;
        case TYPE_POST:
            [manager POST:httpUrl parameters:md success:OKBlock failure:NGBlock];
            break;
        case TYPE_PUT:
            [manager PUT:httpUrl parameters:md success:OKBlock failure:NGBlock];
            break;
        case TYPE_DELETE:
            [manager DELETE:httpUrl parameters:md success:OKBlock failure:NGBlock];
            break;
        default:
            break;
    }
}
@end