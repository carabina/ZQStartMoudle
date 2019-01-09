//
//  NSString+LYKit.m
//  Lvyue
//
//  Created by zhenhua.shen on 2018/4/10.
//  Copyright © 2018年 szh. All rights reserved.
//

#import "NSString+LYKit.h"

@implementation NSString (LYKit)
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height {
    
    CGSize textSize;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                       options:(NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingTruncatesLastVisibleLine)
                    attributes:attributes
                       context:nil].size;
    
    return ceil(textSize.width);
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height maxWidth:(CGFloat)width{
    CGSize textSize;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    textSize = [self boundingRectWithSize:CGSizeMake(width, height)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    
    return ceil(textSize.width);
}

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 *  @param lineSpacing 约束行距
 */
- (CGFloat)heightWithFont:(UIFont *)font
       constrainedToWidth:(CGFloat)width
              lineSpacing:(CGFloat)lineSpacing {
    UIFont *textFont =
    font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:
                                           options:
                                           attributes:
                                           context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{
                                     NSFontAttributeName : textFont,
                                     NSParagraphStyleAttributeName : paragraph
                                     };
        textSize =
        [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                           options:(NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingTruncatesLastVisibleLine)
                        attributes:attributes
                           context:nil]
        .size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : textFont,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    textSize =
    [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                       options:(NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading )
                    attributes:attributes
                       context:nil]
    .size;
#endif
    
    return ceil(textSize.height);
}
/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 *  @param lineSpacing 约束行距
 */
- (CGSize)sizeWithFont:(UIFont *)font
    constrainedToWidth:(CGFloat)width
           lineSpacing:(CGFloat)lineSpacing {
    UIFont *textFont =
    font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:
                                           options:
                                           attributes:
                                           context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{
                                     NSFontAttributeName : textFont,
                                     NSParagraphStyleAttributeName : paragraph
                                     };
        textSize =
        [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                           options:(NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingTruncatesLastVisibleLine)
                        attributes:attributes
                           context:nil]
        .size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : textFont,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    textSize =
    [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                       options:(NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingTruncatesLastVisibleLine)
                    attributes:attributes
                       context:nil]
    .size;
#endif
    
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 *  @param lineSpacing 约束行距
 */
- (CGSize)sizeWithFont:(UIFont *)font
   constrainedToHeight:(CGFloat)height
           lineSpacing:(CGFloat)lineSpacing {
    UIFont *textFont =
    font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:
                                           options:
                                           attributes:
                                           context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{
                                     NSFontAttributeName : textFont,
                                     NSParagraphStyleAttributeName : paragraph
                                     };
        textSize =
        [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                           options:(NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingTruncatesLastVisibleLine)
                        attributes:attributes
                           context:nil]
        .size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : textFont,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    textSize =
    [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                       options:(NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingTruncatesLastVisibleLine)
                    attributes:attributes
                       context:nil]
    .size;
#endif
    
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}
//校验空值
+(NSString*)convertNull:(id)object
{
    if ([object isEqual:[NSNull null]]) {
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (object==nil){
        return @"";
    }
    else if ([[NSString stringWithFormat:@"%@",object] isEqualToString:@"(null)"]){
        return @"";
    }
    return object;
}
+(NSString *)stringWithFloat:(float)num
{
    float floatnum = num;
    for (int i=0; i<100; i++) {
        floatnum = num;
        if ((int)(floatnum)==floatnum) {
            NSString *place = [NSString stringWithFormat:@"%%.%df",i];
            return  [NSString stringWithFormat:place,num] ;
        }
        floatnum *= 10;
    }
   
    return [NSString stringWithFormat:@"%@",@(num)];
}
-(float)noBanklength
{
    if (self.length<=0) {
        return 0;
    }
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str.length;
}

- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isSpaceENString{
    NSCharacterSet *  cs1 = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs1] componentsJoinedByString:@""];
    return [self isEqualToString:filtered];
}
- (BOOL)isChineseSpaceENString{
    if ([self isChinese]) return YES;
    if ([self isSpaceENString]) return YES;
    NSArray *nine = @[@"➋",@"➌",@"➍",@"➎",@"➏",@"➐",@"➑",@"➒"];
    if ([nine containsObject:self])  return YES;
    return NO;
}

+ (NSString *)obtainLevelImage:(NSString *)level{
    //blackGoldCard,diamondCard,whiteGoldCard,goldCard
    if ([level isEqualToString:@"1"]) {
        return @"Member_level_1";
    }else if ([level isEqualToString:@"2"]){
        return @"Member_level_2";
    }else if ([level isEqualToString:@"3"]){
        return @"Member_level_3";
    }else if ([level isEqualToString:@"4"]){
        return @"Member_level_4";
    }else{
        return @"Member_level_1";
    }
}

+ (NSString *)getPlayIconImage:(NSString *)type{
    //blackGoldCard,diamondCard,whiteGoldCard,goldCard
    if ([type isEqualToString:@"1"]) {
        return @"门票业务 copy";
    }else if ([type isEqualToString:@"2"]){
        return @"一日游 copy";
    }else if ([type isEqualToString:@"3"]){
        return @"特色体验 copy";
    }else if ([type isEqualToString:@"4"]){
        return @"用车";
    }else if ([type isEqualToString:@"5"]){
        return @"citywalk";
    }else if ([type isEqualToString:@"6"]){
        return @"美食推荐";
    }else{
        return @"门票业务 copy";
    }
}

/**
 获取玩乐 精选玩法 主题背景
 */
+ (NSString *)obtainPlayThemeImage:(NSString *)type{
    // 1:门票 2:日游 3:特色体验 4:交通用车 5:City_Walk 6:美食
    if ([type isEqualToString:@"1"]) {
        return @"playfun_recommend_purple";
    }else if ([type isEqualToString:@"2"]){
        return @"playfun_recommend_yellow";
    }else if ([type isEqualToString:@"3"]){
        return @"playfun_recommend_cyan";
    }else if ([type isEqualToString:@"4"]){
        return @"playfun_recommend_blue";
    }else if ([type isEqualToString:@"5"]){
        return @"playfun_recommend_green";
    }else if ([type isEqualToString:@"6"]){
        return @"playfun_recommend_red";
    }else{
        return @"playfun_recommend_purple";
    }

}

+ (CGFloat)heightWidth:(CGFloat)width attr:(NSAttributedString *)attr{
    if(width<=0) return 0;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, MAXFLOAT)];
    lab.attributedText = attr;
    lab.numberOfLines = 0;
    CGSize labSize = [lab sizeThatFits:lab.bounds.size];
    return labSize.height;
}

@end
