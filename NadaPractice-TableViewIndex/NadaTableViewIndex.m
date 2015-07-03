//
//  NadaTableViewIndex.m
//  NadaPractice-TableViewIndex
//
//  Created by Nada on 15/7/3.
//  Copyright (c) 2015年 nada. All rights reserved.
//

#import "NadaTableViewIndex.h"
#import "Person.h"
#import "NadaModelIndex.h"
#import "FollowPeopleCell.h"

@interface NadaTableViewIndex ()
{
    NSMutableArray *dataSource;//索引数据源（只显示有的）
    NSMutableArray *listArray; //源数据
    NSMutableArray *abcSort;   //排序整理后的数组
}
@end

@implementation NadaTableViewIndex

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"索引Demo";
    dataSource=[NSMutableArray array];
    abcSort=[NSMutableArray array];
    [self initData];
    abcSort=[self getChineseStrArr:listArray andSck:dataSource];//传入数据源以及索引
}

-(void)initData
{
    Person *p1=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"白1易",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p2=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"白已易",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p3=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"#白",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p4=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"惊涛",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p5=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"归属地",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p6=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"大声道",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p7=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"王遗风王遗风",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p8=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"莫雨",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p9=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"王遗",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p10=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"大声易",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p11=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"iu易",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p12=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"cca",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p13=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"cay",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    Person *p14=[Person initWithData:[NSDictionary dictionaryWithObjectsAndKeys:@"5z",@"name",@"1",@"id",@"",@"photo",@"1",@"sex", nil]];
    listArray=[NSMutableArray arrayWithObjects:p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14, nil];
}

#pragma TableViewDelgate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[abcSort objectAtIndex:section] count];
}

-(NSInteger)numberOfSectionsInTableView:( UITableView *)tableView
{
    return [abcSort count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FollowPeopleCell *cell=[tableView dequeueReusableCellWithIdentifier:@"followCell"];
    if (cell==nil) {
        cell=(FollowPeopleCell *)[[NSBundle mainBundle]loadNibNamed:@"FollowPeopleCell" owner:self options:nil][0];
    }
    if ([abcSort count]>indexPath.section)
    {
        NSArray *arr = [abcSort objectAtIndex:indexPath.section];
        if ([arr count]>indexPath.row)
        {
            // 之后 , 将数组的元素取出 , 赋值给数据模型
            Person *str =(Person *)[arr objectAtIndex:indexPath.row];
            //填充数据
            cell.labelName.text = str.personName;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma 索引条
-(NSArray*)sectionIndexTitlesForTableView:( UITableView *)tableView
{
    return dataSource;
}

@end
