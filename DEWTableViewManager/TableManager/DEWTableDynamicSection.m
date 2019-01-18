//
//  DEWTableDynamicSection.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "DEWTableDynamicSection.h"

@implementation DEWTableDynamicSection

- (instancetype)initWithCellIdenfier:(NSString *)idenfier
                           dataArray:(NSArray *)dataArray
                           configure:(DEWTableConfigureBlock)configureBlock
                         didSelected:(DEWTableSelectBlock)selectedCellBlock;
{
    
    self = [super init];
    if (!self) return nil;
    
    self.idenfier = idenfier;
    self.cellConfigure = [configureBlock copy];
    self.cellSelected = [selectedCellBlock copy];
    
    if (dataArray) {
        self.dataArray = dataArray;
    }else {
        self.dataArray = [[NSArray alloc]init];
    }
    
    return self;
}

- (NSInteger)numberOfRows
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.idenfier forIndexPath:indexPath];
    if (self.cellConfigure) {
        id data = [self.dataArray objectAtIndex:indexPath.row];
        self.cellConfigure(cell, data);
    }
    return cell;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellSelected) {
        self.cellSelected(indexPath);
    }
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (self.rowHeight) {
        return self.rowHeight;
    }
    
    return UITableViewAutomaticDimension;
}

- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.canEdit) {
       return self.canEdit(indexPath);
    }else {
        return NO;
    }
}

- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editingStyle) {
        return self.editingStyle(indexPath);
    }else {
        return UITableViewCellEditingStyleNone;
    }
}

- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.commitEditing) {
        self.commitEditing(editingStyle, indexPath);
    }
}

@end
