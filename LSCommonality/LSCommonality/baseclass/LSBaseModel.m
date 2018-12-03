//
//  HEBaseModel.m
//  ZWXX
//
//  Created by WhenWe on 2017/2/21.
//  Copyright © 2017年 HaierYun. All rights reserved.
//

#import "LSBaseModel.h"
#import <objc/runtime.h>

@implementation LSBaseModel

+ (instancetype)objectWithDictionaryData:(NSDictionary *)dic
{
    LSBaseModel *baseModel = [[self alloc] init];
    if (!dic) {
        return baseModel;
    }
    [baseModel setDataDictionary:dic];
    return baseModel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self dataInitialization];
    }
    return self;
}

- (void)dataInitialization
{
    Class clazz = [self class];
    while (clazz && clazz != [LSBaseModel class] && clazz != [NSObject class]) {

        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(clazz, &count);
        for (int i = 0; i < count; i++) {
            Ivar oneIvar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(oneIvar)];

            key = [key substringFromIndex:1];

            id value = @0;

            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(oneIvar)];

            NSRange range = [type rangeOfString:@"@"];
            if (range.location != NSNotFound) {
                if (type.length < 5) {
                    value = @0;
                    return;
                }
                type = [type substringWithRange:NSMakeRange(2, type.length - 3)];

                if ([type isEqualToString:@"NSString"]) {
                    value = @"";
                }
                if ([type isEqualToString:@"NSNumber"]) {
                    value = @0;
                }

                if (![type hasPrefix:@"NS"]) {

                    Class class = NSClassFromString(type);
                    value = [[class alloc]init];

                }else if ([type isEqualToString:@"NSArray"]) {

                    value = @[];
                }else if ([type isEqualToString:@"NSMutableArray"]){
                    value = [NSMutableArray array];
                }
            }

            [self setValue:value forKeyPath:key];
        }
        free(ivars);
        clazz = [clazz superclass];
    }
}

- (void)setDataDictionary:(NSDictionary *)dic
{
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    Class clazz = [self class];
    while (clazz && clazz != [LSBaseModel class] && clazz != [NSObject class]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(clazz, &count);
        if (count > 0) {
            for (int i = 0; i < count; ++i) {
                Ivar oneIvar = ivars[i];
                NSString *onePropertyName = [NSString stringWithUTF8String:ivar_getName(oneIvar)];
                NSString *onepropertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(oneIvar)];

                if (onePropertyName.length > 1) {
                    onePropertyName = [onePropertyName substringFromIndex:1];
                }

                id value = @0;
                if (![dic objectForKey:onePropertyName] || [dic[onePropertyName] isKindOfClass:[NSNull class]]) {
                    if ([onepropertyType isEqualToString:@"NSString"]) {
                        value = @"";
                    }
                    if ([onepropertyType isEqualToString:@"NSNumber"]) {
                        value = @0;
                    }
                    continue;
                }

                value = dic[onePropertyName];

                if (value == nil) {
                    if ([onepropertyType isEqualToString:@"NSString"]) {
                        value = @"";
                    }
                    if ([onepropertyType isEqualToString:@"NSNumber"]) {
                        value = @0;
                    }
                    continue;
                }

                if ([onepropertyType rangeOfString:@"@"].location != NSNotFound) {
                    if (onepropertyType.length > 3) {
                        onepropertyType = [onepropertyType substringWithRange:NSMakeRange(2, onepropertyType.length - 3)];

                        //自定义类型 是baseModel的子类
                        if (![onepropertyType hasPrefix:@"NS"]) {
                            Class onePropertyClazz = NSClassFromString(onepropertyType);
                            value = [onePropertyClazz objectWithDictionaryData:value];
                        } else if ([onepropertyType isEqualToString:@"NSArray"] || [onepropertyType isEqualToString:@"NSMutableArray"]) {

                            NSMutableArray *originalArray = [(NSArray *)value mutableCopy];
                            NSMutableArray *mArray = [NSMutableArray array];

                            if ([self respondsToSelector:@selector(classInArray)]) {
                                id elementClass;

                                if ([[self classInArray] objectForKey:onePropertyName]) {
                                    if (![[[self classInArray] objectForKey:onePropertyName] isKindOfClass:[NSNull class]]) {
                                        elementClass = [[self classInArray] objectForKey:onePropertyName];

                                        for (int j = 0; j < originalArray.count; ++j) {
                                            [mArray addObject:[elementClass objectWithDictionaryData:originalArray[j]]];
                                        }
                                        value = mArray;
                                    } else {
                                        value = originalArray;
                                        NSLog(@"--【%@】--#warning:请在方法`classInArray`中正确配置%@数组元素的class", NSStringFromClass(clazz), onePropertyName);
                                    }
                                } else {
                                    value = originalArray;
                                    NSLog(@"--【%@】--#warning:没有检测到以%@命名的数组内元素相匹配的model类型", NSStringFromClass(clazz), onePropertyName);
                                }

                            } else {
                                value = originalArray;
                                NSLog(@"--【%@】--#warning:若要解析%@数组内元素成自定义Model,请在此类.m文件中实现`classInArray`方法", NSStringFromClass(clazz), onePropertyName);
                            }
                        }
                    }
                }

                if ([onepropertyType isEqualToString:@"c"]) {
                    if ([value isKindOfClass:[NSString class]]) {
                        if ([value isEqualToString:@"false"]) {
                            value = @(NO);
                        } else {
                            value = @(YES);
                        }
                    }
                }

                [self setValue:value forKey:onePropertyName];
            }
        }
        free(ivars);
        clazz = [clazz superclass];
    }
}

+ (NSArray *)modelArrayWithJsonArray:(NSArray *)originalArray;
{
    if (originalArray.count > 0) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (id obj in originalArray) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                [mutableArray addObject:[self.class objectWithDictionaryData:obj]];
            } else {
                NSInteger index = [originalArray indexOfObject:obj];
                NSLog(@"--【%@】--#warning:检测到此数组内元素index:%tu的数据类型不是NSDictionary,自动忽略掉", NSStringFromClass(self.class), index);
            }
        }
        return mutableArray;
    }
    NSLog(@"--【%@】--#warning:检测到此数组内元素个数为0", NSStringFromClass(self.class));
    return [NSArray array];
}

- (NSDictionary *)classInArray
{
    return nil;
}


@end
