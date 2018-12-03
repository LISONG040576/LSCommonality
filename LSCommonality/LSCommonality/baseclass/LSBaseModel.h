//
//  HEBaseModel.h
//  ZWXX
//
//  Created by WhenWe on 2017/2/21.
//  Copyright © 2017年 HaierYun. All rights reserved.
//


#import <Foundation/Foundation.h>


/**
 baseModel  所有Model继承于此类  可实现自动解析数据
 */
@interface LSBaseModel : NSObject


/**
 直接传入要解析的数据生成需要的Model

 @param dic 要解析的dic数据
 @return HEBaseModel
 */
+ (instancetype)objectWithDictionaryData:(NSDictionary *)dic;

/**
 通过元素类型 获取 model数组 此方法只允许数组元素为字典的简单类型 不允许其元素还为数组类型
    以自身类型 成为 数组元素的类型
    NSArray <自定义Model *>*modelArray = [自定义Model modelArrayWithJsonArray:原数组];

 @param originalArray 原数组
 */
+ (NSArray *)modelArrayWithJsonArray:(NSArray *)originalArray;



/**
 @brief 根据dic数据解析成对应

 @discussion 若要自定义数据 需重写此方法
            - (void)setDataDictionary:(NSDictionary *)dic
            {
                [super setDataDictionary:dic];//调用父类此方法  以完成数据自动解析
                //对自动解析后的数据 自定义处理...
            }

 @param dic 要解析的dic数据
 */
- (void)setDataDictionary:(NSDictionary *)dic;


/**
 若Model中 某些属性为数组 且其元素为某类型 则需要重写此方法
 - (NSDictionary *)classInArray
 {
  return @{@"propertyName1" : [SubModelClassName1 Class],
           @"propertyName2" : [SubModelClassName2 Class]
          };
 }
 */
- (NSDictionary *)classInArray;

@end
