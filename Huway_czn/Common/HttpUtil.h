//
// Created by Gorey on 15/7/21.
// Copyright (c) 2015 中华户外网. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface HttpUtil : NSObject

typedef NS_ENUM(NSUInteger, REQUEST_TYPE){
    TYPE_GET = 0,
    TYPE_POST,
    TYPE_PUT,
    TYPE_DELETE
};
+ (HttpUtil *)instance;
/**
 *  AFNetwork公共请求接口 ---绝对路径
 *
 *  @param action      URL里的绝对路径
 *  @param param       请求参数,NSDictionary
 *  @param cls         返回结果的JsonModel子类名
 *  @param ok          正常回调
 *  @param ng          失败回调
 *  @param requestType RESTful请求类型
 *  @param needToken   是否需要Token
 */
- (void)startNormalAsyncAction:(NSString *)urlString param:(NSDictionary *)param model:(Class)cls ok:(void (^)(JSONModel *model))ok ng:(void (^)(NSString *errMsg))ng requestType:(REQUEST_TYPE)requestType needToken:(BOOL)needToken;


@end