//
//  NadaModelIndex.m
//  
//
//  Created by Nada on 15/7/3.
//  Copyright (c) 2015年 nada. All rights reserved.
//

#include "pinyin.h"
#import "NadaModelIndex.h"
#import "Person.h"

@implementation NSObject (Index)


/**
 *  @author NADA, 15-07-03 09:07:05
 *
 *  对传进来的数组进行排序,model添加一个属性：pinYin,PS:======为需要修改的地方
 *
 *  @param arrToSort         传进来的model对象数组
 *  @param _sectionHeadsKeys 索引数组
 *
 *  @return 排序好的数组
 */
- ( NSMutableArray *)getChineseStrArr:( NSMutableArray *)arrToSort andSck:(NSMutableArray *)_sectionHeadsKeys

{
    Person *sortModel;//============
    
    // 创建一个临时的变动数组
    NSMutableArray *sortModelArray = [ NSMutableArray array ];
    for ( int i = 0 ; i < [arrToSort count ]; i++)
    {
        // 给模型赋值
        sortModel=[arrToSort objectAtIndex :i];
        NSString *sortStr=sortModel.personName;//============
        if (sortStr == nil )
        {
            sortStr = @"" ;
        }
        if (![sortStr isEqualToString : @"" ])
        {
            //join( 链接 ) the pinYin (letter 字母 )  链接到首字母
            NSString *pinYinResult = [ NSString string ];
            // 按照数据模型中 row 的个数循环
            for ( int j = 0 ;j < sortStr.length ; j++)
            {
                if ([self isPingYin:[sortStr substringToIndex:1]]) {
                    NSString *singlePinyinLetter = [[ NSString stringWithFormat : @"%c" ,
                                                     pinyinFirstLetter ([sortStr characterAtIndex :j])] uppercaseString ];
                    pinYinResult = [pinYinResult stringByAppendingString :singlePinyinLetter];
                }else{
                    pinYinResult = [pinYinResult stringByAppendingString :[self charReturn:[NSString stringWithFormat:@"%c", [sortStr characterAtIndex:j]]]];
                }
            }
            sortModel.pinYin = pinYinResult;
        } else {
            sortModel.pinYin = @"" ;
        }
        [sortModelArray addObject :sortModel];
    }
    //sort( 排序 ) the personArr by pinYin( 首字母 )
    
    NSArray *sortDescriptors = [ NSArray arrayWithObject :[ NSSortDescriptor sortDescriptorWithKey : @"pinYin" ascending : YES ]];
    [sortModelArray sortUsingDescriptors :sortDescriptors];
    NSMutableArray *arrayForArrays = [ NSMutableArray array ];
    BOOL checkValueAtIndex= NO ;  //flag to check
    NSMutableArray *TempArrForGrouping = nil ;
    for ( int index = 0 ; index < [sortModelArray count ]; index++)
    {
        sortModel=[sortModelArray objectAtIndex :index];
        NSMutableString *strchar= [ NSMutableString stringWithString :sortModel.pinYin];
        NSString *sr= [strchar substringToIndex : 1 ];
        //sr containing here the first character of each string  ( 这里包含的每个字符串的第一个字符 )
        //here I'm checking whether the character already in the selection header keys or not  ( 检查字符是否已经选择头键 )
        if (![ _sectionHeadsKeys containsObject :[sr uppercaseString ]])
        {
            [ _sectionHeadsKeys addObject :[sr uppercaseString ]];
            TempArrForGrouping = [[ NSMutableArray alloc ] initWithObjects : nil ] ;
            checkValueAtIndex = NO ;
        }
        if ([ _sectionHeadsKeys containsObject :[sr uppercaseString ]])
        {
            [TempArrForGrouping addObject :[sortModelArray objectAtIndex :index]];
            if (checkValueAtIndex == NO )
            {
                [arrayForArrays addObject :TempArrForGrouping];
                checkValueAtIndex = YES ;
            }
        }
    }
    return arrayForArrays;
}

//返回所对应的字母，不是字母则返回#
-(NSString *)charReturn:(NSString *)b
{
    char a=[[b uppercaseString] characterAtIndex:0];
    for (char i='A'; i<='Z'; i++) {
        if (a==i) {
            return [b uppercaseString];
        }
    }
    
    return @"#";
    
}

//判断是否是汉字
-(BOOL)isPingYin:(NSString *)b
{
    for(int i=0; i< [b length];i++){
        int a = [b characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
        
    }    return NO;
}

@end
