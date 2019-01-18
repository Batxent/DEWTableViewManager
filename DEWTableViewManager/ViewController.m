//
//  ViewController.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DEWTableManager.h"
#import "DEWTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DEWTableManager *tableManager;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
    self.tableView.delegate = self.tableManager;
    self.tableView.dataSource = self.tableManager;
    
    [self.tableView registerClass:[DEWTableViewCell class] forCellReuseIdentifier:@"dew"];
    
    DEWTableStaticSection *section0 = [[DEWTableStaticSection alloc]init];
    
    UITableViewCell *cell0 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"default1"];
    DEWTableStaticCellModel *cell0Model = [[DEWTableStaticCellModel alloc]initWithCell:cell0 rowHeight:UITableViewAutomaticDimension selected:^(NSIndexPath *indexPath) {
        NSLog(@"selected %@",indexPath);
    }];
    cell0.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell0.textLabel.text = @"0";
    [section0 addCellModel:cell0Model];
    
    
    UITableViewCell *cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"default1"];
    DEWTableStaticCellModel *cell1Model = [[DEWTableStaticCellModel alloc]initWithCell:cell1 rowHeight:UITableViewAutomaticDimension selected:^(NSIndexPath *indexPath) {
        NSLog(@"selected %@",indexPath);
    }];
    cell1.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell1.textLabel.text = @"1";
    [section0 addCellModel:cell1Model];
    [self.tableManager addSection:section0];
    
    
    NSMutableArray *dataArray = @[].mutableCopy;
    for (int i = 0; i < 50; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    DEWTableDynamicSection *section1 = [[DEWTableDynamicSection alloc]initWithCellIdenfier:@"dew" dataArray:dataArray configure:^(DEWTableViewCell *cell, NSString *data) {
        cell.nameLabel.text = data;
        cell.detailLabel.text = data;
    } didSelected:^(NSIndexPath *indexPath) {
        NSLog(@"selected %@",indexPath);
    }];
    section1.rowHeight = UITableViewAutomaticDimension;
    [self.tableManager addSection:section1];

    
}

- (UITableView *)tableView
{
    if (_tableView)return _tableView;
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    return _tableView;
}

- (DEWTableManager *)tableManager
{
    if (_tableManager) return _tableManager;
    _tableManager = [[DEWTableManager alloc]init];
    
    return _tableManager;
}

@end
