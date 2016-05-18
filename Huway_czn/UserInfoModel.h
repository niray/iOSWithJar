#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "JSONModel.h"

@protocol UserInfoModelUserList @end

@interface UserInfoModelUserList : JSONModel
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *signature;
@property (nonatomic, assign) NSInteger coins;
@property (nonatomic, assign) NSInteger credit;
@property (nonatomic, strong) NSString *levelname;
@property (nonatomic, strong) NSString *levelup_credit;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) NSInteger fans;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, assign) NSInteger attention;
@end
@interface UserInfoModel : JSONModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray<UserInfoModelUserList> *userList;
@property (nonatomic, strong) NSString *count;
@end
