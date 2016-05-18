//
// Created by Gorey on 15/4/27.
// Copyright (c) 2015 CloudPower. All rights reserved.
//

#import <objc/runtime.h>
#import "JSONModel+Http.h"


@implementation JSONModel (Http)

+ (JSONModel *)jsonModelWithClass:(Class)cls jsonString:(NSString *)string error:(JSONModelError *)error {
    JSONModel *model = [class_createInstance(cls, 0) initWithString:string error:&error];
    return model;
}
+ (JSONModel *)jsonModelWithClass:(Class)cls jsonData:(NSData *)data error:(JSONModelError *)error{
    JSONModel *model = [class_createInstance(cls, 0) initWithData:data error:&error];
    return model;
}

@end