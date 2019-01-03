//
//  HEUserModel.m
//  UniversalNetwork
//
//  Created by 张涵 on 16/6/20.
//  Copyright © 2016年 wping. All rights reserved.
//

#import "LSUserModel.h"
#import "LSCommon.h"




@implementation LSUserModel

@synthesize userId = _userId;
@synthesize bj_userId = _bj_userId;

+(instancetype)shareUser{
    static LSUserModel * userModel = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        userModel = [[LSUserModel alloc] init];
        [userModel setLoginType:LoginTypeMobile];
        
        
    });
    return userModel;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initData];
    }
    return self;
}

- (void)initData
{

    self.phone = [USER_DEFAULT objectForKey:@"user_phone"];
    self.userName = [USER_DEFAULT objectForKey:@"user_name"];

    self.bj_userId = [USER_DEFAULT objectForKey:@"beijing_user_id"];
    self.userId = [USER_DEFAULT objectForKey:@"uhome_user_id"];
    self.token = [USER_DEFAULT objectForKey:@"access_token"];
    self.appName = [USER_DEFAULT objectForKey:@"app_name"];
    self.coSessionId = [USER_DEFAULT objectForKey:KeyForCoSessionId];
    self.sdToken = [USER_DEFAULT objectForKey:@"sd_token"];
    self.offUserId = [USER_DEFAULT objectForKey:KeyForOffUserId];
    
    self.sexIsBaomi = [[USER_DEFAULT objectForKey:KeySexBaomiStatus] boolValue];
    
    self.headerImage = [[USER_DEFAULT objectForKey:@"header_image"] isEqualToString:@"https://g3.ykimg.com/0516000059898F6FADBC09B6EB0BEABF"] ? @"" : [USER_DEFAULT objectForKey:@"header_image"];
    
    if ([[USER_DEFAULT objectForKey:@"user_nick"] length] != 0) {
        self.nickName = [USER_DEFAULT objectForKey:@"user_nick"];
    }else{
        NSLog(@"------- %@",self.phone);
        if ([StringWithNum(@"%@", self.phone) length] > 10) {
            NSMutableString *phoneStr = [NSMutableString stringWithFormat:@"%@",self.phone];
            [phoneStr deleteCharactersInRange:NSMakeRange(3, 4)];
            [phoneStr insertString:@"****" atIndex:3];
            self.nickName = phoneStr;
        }else{
            self.nickName = @"未命名";
        }
    }
    if (!self.nickName || [self.nickName isEqualToString:@"(null)"]) {
        self.nickName = @"未命名";
    }
    self.sex = [USER_DEFAULT objectForKey:KeyForSex];
    self.birthday = [USER_DEFAULT objectForKey:KeyForBirthday];
    self.height = [USER_DEFAULT objectForKey:KeyForHeight];
    self.weight = [USER_DEFAULT objectForKey:KeyForWeight];
    self.city = [USER_DEFAULT objectForKey:@"user_city"];
    self.remmenberPassword = [[USER_DEFAULT objectForKey:KeyForRememberPassword] boolValue];
    
    self.timeCheckSuccess = YES;
    
    
    self.access_token = [USER_DEFAULT objectForKey:KeyForACCESS_TOKEN];
    self.refresh_token = [USER_DEFAULT objectForKey:KeyForREFRESH_TOKEN];
    self.u_open_id = [USER_DEFAULT objectForKey:KeyForu_open_id];
    self.u_user_id = [USER_DEFAULT objectForKey:KeyForu_user_id];
    
    
    self.environmentStatus = [[USER_DEFAULT objectForKey:KeyEnvironmentStatus] integerValue];
    
    
    
    if ([self.nickName isEqualToString:@"未命名"] &&
        self.phone.length > 10) {
        NSMutableString *phoneStr = [NSMutableString stringWithFormat:@"%@",self.phone];
        [phoneStr deleteCharactersInRange:NSMakeRange(3, 4)];
        [phoneStr insertString:@"****" atIndex:3];
        self.nickName = phoneStr;
    }
}






-(NSString *)userId{
    if (!_userId || _userId.length == 0) {
        return @"";
    }
    return _userId;
}
-(NSString *)bj_userId{
    if (!_bj_userId || _bj_userId.length == 0) {
        return @"";
    }
    return _bj_userId;
}

-(void)clearUser{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"oc2js_deleteSession" object:nil];
    self.userId = @"";
    self.bj_userId = @"";
    self.phone = @"";
    self.userName = @"";
    self.nickName = @"";
    self.headerImage = @"";
    self.password = @"";
    self.token = @"";
    self.sdToken = @"";
    self.refresh_token = @"";
    self.u_open_id = @"";
//    self.fridge_id = @"";
//    self.appName = @"";
//    self.coSessionId = @"";
//    self.offUserId = @"";
//    self.sdToken = @"";
    [USER_DEFAULT removeObjectForKey:@"user_name"];
    [USER_DEFAULT removeObjectForKey:@"uhome_user_id"];
    [USER_DEFAULT removeObjectForKey:@"access_token"];
    [USER_DEFAULT removeObjectForKey:@"app_name"];
    [USER_DEFAULT removeObjectForKey:KeyForCoSessionId];
    [USER_DEFAULT removeObjectForKey:@"sd_token"];
    [USER_DEFAULT removeObjectForKey:KeyForOffUserId];
    [USER_DEFAULT removeObjectForKey:@"header_image"];
    [USER_DEFAULT removeObjectForKey:@"user_nick"];
    [USER_DEFAULT removeObjectForKey:KeyForSex];
    [USER_DEFAULT removeObjectForKey:KeyForBirthday];
    [USER_DEFAULT removeObjectForKey:KeyForHeight];
    [USER_DEFAULT removeObjectForKey:KeyForWeight];
    [USER_DEFAULT removeObjectForKey:@"user_city"];
    
    [USER_DEFAULT removeObjectForKey:@"beijing_user_id"];
    
    [USER_DEFAULT removeObjectForKey:KeyForREFRESH_TOKEN];
    [USER_DEFAULT removeObjectForKey:KeyForu_open_id];
    [USER_DEFAULT removeObjectForKey:KeyForu_user_id];
   
   

    USER.token = nil;
    [USER_DEFAULT synchronize];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];

}

- (void)setUserId:(NSString *)userId
{
    _userId = userId;

    USER_DEFAULT_SET(_userId, @"uhome_user_id");

    
}





- (void)setBj_userId:(NSString *)bj_userId
{
    _bj_userId = bj_userId;

    USER_DEFAULT_SET(_bj_userId, @"beijing_user_id");
    
}

- (void)setAccess_token:(NSString *)access_token{
    _access_token = access_token;
    USER_DEFAULT_SET(_access_token, KeyForACCESS_TOKEN);
    
}

- (void)setRefresh_token:(NSString *)refresh_token{
    _refresh_token = refresh_token;
    USER_DEFAULT_SET(_refresh_token, KeyForREFRESH_TOKEN);
}
- (void)setU_open_id:(NSString *)u_open_id{
    _u_open_id = u_open_id;
    USER_DEFAULT_SET(_u_open_id, KeyForu_open_id);
}

- (void)setU_user_id:(NSString *)u_user_id
{
    _u_user_id = u_user_id;
    USER_DEFAULT_SET(_u_user_id, KeyForu_user_id);
}

- (void)setSdToken:(NSString *)sdToken{
    _sdToken = sdToken;
    
    USER_DEFAULT_SET(_sdToken, @"sd_token");
}



- (void)setPhone:(NSString *)phone {
    _phone = phone;
    USER_DEFAULT_SET(_phone, @"user_phone");

}

- (void)setPassword:(NSString *)password {
    _password = password;
    [USER_DEFAULT setObject:_password forKey:KeyForUserPassword];
    [USER_DEFAULT synchronize];
    
}

- (void)setToken:(NSString *)token
{
    _token = token;
    

    [USER_DEFAULT setObject:token forKey:@"access_token"];
    [USER_DEFAULT synchronize];

}

-(void)setRemmenberPassword:(BOOL)remmenberPassword{
    _remmenberPassword = remmenberPassword;
    if (_remmenberPassword) {
        [USER_DEFAULT setBool:_remmenberPassword forKey:KeyForRememberPassword];
        /** 记住密码 **/
//        showHUDWithInfoString(@"记住密码");
    }else{
//        showHUDWithInfoString(@"取消记住密码");
        [USER_DEFAULT removeObjectForKey:KeyForRememberPassword];
    }
    [USER_DEFAULT synchronize];
}

-(void)setNickName:(NSString *)nickName{
    _nickName = nickName;
    if (!_nickName) {
        _nickName = @"未命名";
    }
    
    USER_DEFAULT_SET(_nickName, @"user_nick")
}


- (void)setHeaderImage:(NSString *)headerImage {
    _headerImage = headerImage;
    USER_DEFAULT_SET(_headerImage, @"header_image")
}

-(void)setSex:(NSString *)sex{
    _sex = sex;

    USER_DEFAULT_SET(_sex, KeyForSex)
}

-(void)setBirthday:(NSString *)birthday{
    _birthday = birthday;

    USER_DEFAULT_SET(_birthday, KeyForBirthday)
}

-(void)setHeight:(NSString *)height{
    _height = height;

    USER_DEFAULT_SET(_height, KeyForHeight)
}

-(void)setWeight:(NSString *)weight{
    _weight = weight;

    USER_DEFAULT_SET(_weight, KeyForWeight);
}

-(void)setCity:(NSString *)city{
    _city = city;
    if (( [_city isEqualToString:@"<null>"] || [_city isEqual:[NSNull null]])) {
        _city = @"";
    }

    
    USER_DEFAULT_SET(_city, @"user_city");
}


- (void)setEnvironmentStatus:(NSInteger)environmentStatus {
    _environmentStatus = environmentStatus;
    
    USER_DEFAULT_SET(@(_environmentStatus), KeyEnvironmentStatus);
}

- (void)setSexIsBaomi:(BOOL)sexIsBaomi {
    _sexIsBaomi = sexIsBaomi;
    
    USER_DEFAULT_SET(@(_sexIsBaomi), KeySexBaomiStatus);
}



- (BOOL)hasLogined {
    return self.token && self.token.length;
}



@end
