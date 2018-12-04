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

    self.phone = [USER_DEFAULT objectForKey:KeyForUserPhone];
    
//    self.password = [HEPassWordCryptography DecipheringPasswordWithData:[USER_DEFAULT objectForKey:KeyForEncryPassword]];
    self.userName = [USER_DEFAULT objectForKey:KeyForUserName];
    self.jspwd = [USER_DEFAULT objectForKey:KeyForJSPassword];
//    self.bj_userId = @"201609091849420079";
    self.bj_userId = [USER_DEFAULT objectForKey:KeyForBJUserId];
    self.userId = [USER_DEFAULT objectForKey:KeyForUserId];
    self.token = [USER_DEFAULT objectForKey:KeyForAccessToken];
    self.appName = [USER_DEFAULT objectForKey:KeyForAppName];
    self.coSessionId = [USER_DEFAULT objectForKey:KeyForCoSessionId];
    self.sdToken = [USER_DEFAULT objectForKey:KeyForSdToken];
    self.offUserId = [USER_DEFAULT objectForKey:KeyForOffUserId];
    
    self.sexIsBaomi = [[USER_DEFAULT objectForKey:KeySexBaomiStatus] boolValue];
    
    self.headerImage = [[USER_DEFAULT objectForKey:KeyForHeaderImage] isEqualToString:@"https://g3.ykimg.com/0516000059898F6FADBC09B6EB0BEABF"] ? @"" : [USER_DEFAULT objectForKey:KeyForHeaderImage];
    
    if ([[USER_DEFAULT objectForKey:KeyForNickName] length] != 0) {
        self.nickName = [USER_DEFAULT objectForKey:KeyForNickName];
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
    self.city = [USER_DEFAULT objectForKey:KeyForCity];
    self.remmenberPassword = [[USER_DEFAULT objectForKey:KeyForRememberPassword] boolValue];
    
    self.timeCheckSuccess = YES;
    
    self.canNotReciveAlarm = [[USER_DEFAULT objectForKey:KEY_CANRECICEALARM] boolValue];
    self.access_token = [USER_DEFAULT objectForKey:KeyForACCESS_TOKEN];
    self.refresh_token = [USER_DEFAULT objectForKey:KeyForREFRESH_TOKEN];
    self.u_open_id = [USER_DEFAULT objectForKey:KeyForu_open_id];
    self.u_user_id = [USER_DEFAULT objectForKey:KeyForu_user_id];
    
    self.recommendTime = [USER_DEFAULT objectForKey:KEY_RECOMMENDTIME];
    
    self.recommendPageNum = [USER_DEFAULT objectForKey:KEY_RECOMMENDPAGEUNM];
    self.isVIP = [[USER_DEFAULT objectForKey:IsVIP] boolValue];
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
    [USER_DEFAULT removeObjectForKey:KeyForUserName];
    [USER_DEFAULT removeObjectForKey:KeyForUserId];
    [USER_DEFAULT removeObjectForKey:KeyForAccessToken];
    [USER_DEFAULT removeObjectForKey:KeyForAppName];
    [USER_DEFAULT removeObjectForKey:KeyForCoSessionId];
    [USER_DEFAULT removeObjectForKey:KeyForSdToken];
    [USER_DEFAULT removeObjectForKey:KeyForOffUserId];
    [USER_DEFAULT removeObjectForKey:KeyForHeaderImage];
    [USER_DEFAULT removeObjectForKey:KeyForNickName];
    [USER_DEFAULT removeObjectForKey:KeyForSex];
    [USER_DEFAULT removeObjectForKey:KeyForBirthday];
    [USER_DEFAULT removeObjectForKey:KeyForHeight];
    [USER_DEFAULT removeObjectForKey:KeyForWeight];
    [USER_DEFAULT removeObjectForKey:KeyForCity];
    
    [USER_DEFAULT removeObjectForKey:KeyForBJUserId];
    
    [USER_DEFAULT removeObjectForKey:KeyForREFRESH_TOKEN];
    [USER_DEFAULT removeObjectForKey:KeyForu_open_id];
    [USER_DEFAULT removeObjectForKey:KeyForu_user_id];
   
    [USER_DEFAULT removeObjectForKey:IsVIP];

    USER.token = nil;
    [USER_DEFAULT synchronize];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];

}

- (void)setUserId:(NSString *)userId
{
    _userId = userId;

    USER_DEFAULT_SET(_userId, KeyForUserId);

    
}


- (void)setIsVIP:(BOOL)isVIP
{
    _isVIP = isVIP;
    
    USER_DEFAULT_SET(@(_isVIP), IsVIP);
}


- (void)setBj_userId:(NSString *)bj_userId
{
    _bj_userId = bj_userId;

    USER_DEFAULT_SET(_bj_userId, KeyForBJUserId);
    
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
    
    USER_DEFAULT_SET(_sdToken, KeyForSdToken);
}

- (void)setCanNotReciveAlarm:(BOOL)canNotReciveAlarm{
    _canNotReciveAlarm = canNotReciveAlarm;
    NSLog(@"----%@",@(_canNotReciveAlarm));
    [USER_DEFAULT setObject:@(_canNotReciveAlarm) forKey:KEY_CANRECICEALARM];
    [USER_DEFAULT synchronize];
    
}

- (void)setPhone:(NSString *)phone {
    _phone = phone;
    USER_DEFAULT_SET(_phone, KeyForUserPhone);

}

- (void)setPassword:(NSString *)password {
    _password = password;
    [USER_DEFAULT setObject:_password forKey:KeyForUserPassword];
    [USER_DEFAULT synchronize];
    
}

- (void)setToken:(NSString *)token
{
    _token = token;
    
//    USER_DEFAULT_SET(_token, KeyForAccessToken)
    [USER_DEFAULT setObject:token forKey:KeyForAccessToken];
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
    
    USER_DEFAULT_SET(_nickName, KeyForNickName)
}

- (void)setRecommendTime:(NSString *)recommendTime{
    _recommendTime = recommendTime;
    
    USER_DEFAULT_SET(_recommendTime, KEY_RECOMMENDTIME)
}

- (void)setRecommendPageNum:(NSString *)recommendPageNum{
    _recommendPageNum = recommendPageNum;
    
    USER_DEFAULT_SET(_recommendPageNum, KEY_RECOMMENDPAGEUNM)
}

- (void)setHeaderImage:(NSString *)headerImage {
    _headerImage = headerImage;

    USER_DEFAULT_SET(_headerImage, KeyForHeaderImage)
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

    
    USER_DEFAULT_SET(_city, KeyForCity);
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
