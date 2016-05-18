#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "UserInfoModel.h"

@implementation UserInfoModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

@implementation UserInfoModelUserList
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
