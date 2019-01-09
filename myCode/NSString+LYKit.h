//
//  NSString+LYKit.h
//  Lvyue
//
//  Created by zhenhua.shen on 2018/4/10.
//  Copyright © 2018年 szh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYKit)
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体
 *  @param height 约束高度
 *  @param width  最大宽度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height maxWidth:(CGFloat)width;

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 *  @param lineSpacing 约束行距
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 *  @param lineSpacing 约束行距
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 *  @param lineSpacing 约束行距
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height lineSpacing:(CGFloat)lineSpacing;


/**
 校验空值

 @param object 数据
 @return 结果
 */
+(NSString*)convertNull:(id)object;

//float 去掉0
+(NSString *)stringWithFloat:(float)num;


/**
 去掉空格的长度
 */
-(float)noBanklength;


/**
 是否为汉字

 @return 结果
 */
- (BOOL)isChinese;
/**
 英文或空格
 
 @return 结果
 */
- (BOOL)isSpaceENString;

/**
 英文或空格或汉字
 
 @return 结果
 */
- (BOOL)isChineseSpaceENString;

/**
 获取会员等级图片

 @param level 会员等级参数
 @return 对应的图片
 */
+ (NSString *)obtainLevelImage:(NSString *)level;


/**
 获取玩乐icon图片

 @param type 类型
 @return 对应的图片
 */
+ (NSString *)getPlayIconImage:(NSString *)type;

/**
 获取玩乐 精选玩法 主题背景

 @param type colourType
 @return 对应的图片
 */
+ (NSString *)obtainPlayThemeImage:(NSString *)type;
/**
 计算富文本高度

 @param width 富文本宽度
 @param attr 富文本
 @return 高度
 */
+ (CGFloat)heightWidth:(CGFloat)width attr:(NSAttributedString *)attr;

@end
