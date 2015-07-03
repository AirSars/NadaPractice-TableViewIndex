//
//  Person.m
//  Practice-collectionView
//
//  Created by Nada on 15/7/3.
//  Copyright (c) 2015年 nada. All rights reserved.
//

#import "Person.h"

@implementation Person

+(Person *)initWithData:(NSDictionary *)dic
{
    Person *person=[[Person alloc]init];
    person.personName=[dic objectForKey:@"name"]?[dic objectForKey:@"name"]:@"";
    person.personID=[dic objectForKey:@"id"]?[dic objectForKey:@"id"]:@"";
    person.personPhoto=[dic objectForKey:@"photo"]?[dic objectForKey:@"photo"]:@"";
    person.personSex=[dic objectForKey:@"sex"]?[dic objectForKey:@"sex"]:@"1";
    return person;
}


@end
