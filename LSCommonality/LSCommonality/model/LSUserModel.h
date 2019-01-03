//
//  HEUserModel.h
//  UniversalNetwork
//
//  Created by 张涵 on 16/6/20.
//  Copyright © 2016年 wping. All rights reserved.
//


#define USER ((LSUserModel *)[LSUserModel shareUser])

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define MaxUserLoginListNum             6


#define KeyForUserId                    @"KeyForUserId"
#define KeyForBJUserId                    @"KeyForBJUserId"
#define KeyForACCESS_TOKEN                    @"KeyForACCESS_TOKEN"
#define KeyForREFRESH_TOKEN                   @"KeyForREFRESH_TOKEN"
#define KeyForu_open_id                    @"KeyForu_open_id"
#define KeyForu_user_id                    @"KeyForu_user_id"
#define KeyForUserName                  @"KeyForUserName"
#define KeyForUserPhone                 @"KeyForUserPhone"
#define KeyForUserEmail                 @"KeyForUserEmail"
#define KeyForRememberPassword          @"KeyForRememberPassword"
#define KeyForJSPassword                @"KeyForJSPassword"

#define KeyForLoginName                 @"KeyForLoginName"
#define KeyForUserPassword              @"KeyForUserPassword"
#define KeyForAccessToken               @"KeyForAccessToken"

#define KeyForEncryPassword             @"KeyForEncryPassword"

#define KeyForAppName                   @"KeyForAppName"
#define KeyForCoSessionId               @"KeyForCoSessionId"
#define KeyForSdToken                   @"KeyForSdToken"
#define KeyForOffUserId                 @"KeyForOffUserId"
#define KeyForHeaderImage               @"KeyForHeaderImage"
//个人扩展信息
#define KeyForNickName                      @"KeyForNickName"
#define KeyForSex                           @"KeyForSex"
#define KeyForBirthday                      @"KeyForBirthday"
#define KeyForHeight                        @"KeyForHeight"
#define KeyForWeight                        @"KeyForWeight"
#define KeyForCity                          @"KeyForCity"
#define IsCryptography                      @"IsCryptography"



//用户登录和退出登录时通知
#define KEY_USERINFO_REFRESH            @"KeyUserinfoRefresh"
#define KEY_HASUNBINDDEVICE           @"KeyhasUnbindDevice"


/** 推荐菜谱时间记录 **/
#define KEY_RECOMMENDPAGEUNM             @"recommendPageNum"
#define KEY_RECOMMENDTIME           @"recommendTime"




#define KeyEnvironmentStatus                    @"environmentStatus"
#define KeySexBaomiStatus                    @"sexIsBaomi"



#pragma mark - 帐号类型


typedef enum {
    
    LoginTypeUserName = 0,              // 用户名
    LoginTypeMobile,                    // 手机
    LoginTypeEmail                      // 邮箱
    
}LoginType;

@interface LSUserModel : NSObject
extern NSString *string(id obj);
+(instancetype)shareUser;
@property(nonatomic, copy)   NSString    *bj_userId;
@property(nonatomic, copy)   NSString       *userId;
@property(nonatomic, assign) NSInteger      loginType;


@property(nonatomic, copy)   NSString       *phone;             //手机号码
@property(nonatomic, copy)   NSString       *userName;          //昵称
@property(nonatomic, copy)   NSString       *password;          //密码
@property(nonatomic, copy)   NSString       *token;             //

@property(nonatomic, copy)   NSString       *appName;
@property(nonatomic, copy)   NSString       *coSessionId;
@property(nonatomic, copy)   NSString       *offUserId;
@property(nonatomic, copy)   NSString       *sdToken;

@property(nonatomic, copy)   NSString       *headerImage;       //用户头像
@property(nonatomic, assign) BOOL           remmenberPassword;  //是否记住密码
//个人扩展信息
@property(nonatomic, copy)   NSString       *nickName;          //昵称
@property(nonatomic, copy)   NSString       *sex;               //性别
@property(nonatomic, copy)   NSString       *birthday;          //生日
@property(nonatomic, copy)   NSString       *height;            //高度
@property(nonatomic, copy)   NSString       *weight;            //重量
@property(nonatomic, copy)   NSString       *city;              //城市
@property(nonatomic, copy)   NSString       *temperature;       //温度
@property(nonatomic, copy)   NSString       *province;          //省份

//新版用户体系使用token
@property (nonatomic, copy) NSString        *access_token;
@property (nonatomic, copy) NSString         *refresh_token;
@property (nonatomic, copy) NSString         *u_open_id;
@property (nonatomic, copy) NSString         *u_user_id; //用户中心userId
@property(nonatomic, assign) BOOL   isVIP;

//判断本地时间是否与网络时间相差超过五分钟（根据返回结果的code值进行判断）
@property(nonatomic, assign) BOOL timeCheckSuccess;
//是否不可以接受报警信息
@property(nonatomic, assign) BOOL canNotReciveAlarm;
/** 性别是否保密 **/
@property(nonatomic, assign) BOOL sexIsBaomi;
/** 设备相关 **/
@property(nonatomic, strong) NSString   *TOPDeviceTypeID; //养生壶测试ID

/** 0:生产 1:内网 2:预生产 - 北京  3：预生产 - 青岛 4:设备控制测试环境 **/
@property(nonatomic,assign)NSInteger environmentStatus;


- (BOOL)hasLogined;

-(void)clearUser;

@end
