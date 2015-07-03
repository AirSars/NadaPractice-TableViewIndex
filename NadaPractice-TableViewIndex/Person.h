//
//  Person.h
//  Practice-collectionView
//
//  Created by Nada on 15/7/3.
//  Copyright (c) 2015年 nada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,strong) NSString *personName;
@property (nonatomic,strong) NSString *personID;
@property (nonatomic,strong) NSString *personPhoto;
@property (nonatomic,strong) NSString *personSex;
@property (nonatomic, copy ) NSString *pinYin;

+(Person *)initWithData:(NSDictionary *)dic;
@end
