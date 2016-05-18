//
// Created by Gorey on 15/4/27.
// Copyright (c) 2015 CloudPower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

@interface JSONModel (Http)

+ (JSONModel *)jsonModelWithClass:(Class)cls jsonString:(NSString *)string error:(JSONModelError *)error;
+ (JSONModel *)jsonModelWithClass:(Class)cls jsonData:(NSData *)data error:(JSONModelError *)error;

@end