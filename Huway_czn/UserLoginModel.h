#import <Foundation/Foundation.h>
#import "JsonModel.h"


@interface UserLoginModelUserInfo : JSONModel
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *regdate;
@property (nonatomic, strong) NSString *lastlogintime;
@property (nonatomic, strong) NSString *groupid;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *signature;
@property (nonatomic, strong) NSString *xflag;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *growupid;
@property (nonatomic, strong) NSString *realname;
@property (nonatomic, strong) NSString *birthyear;
@property (nonatomic, strong) NSString *birthmonth;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *token;
@end
@interface UserLoginModel : JSONModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) UserLoginModelUserInfo*userInfo;
@end

