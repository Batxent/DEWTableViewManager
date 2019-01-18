//
//  DEWTableSection.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "DEWTableStaticSection.h"

@interface DEWTableStaticSection ()

@property (nonatomic, strong, readwrite) NSMutableArray <DEWTableStaticCellModel *> *mutableCellModels;

@end


@implementation DEWTableStaticSection

- (void)addCellModel:(DEWTableStaticCellModel *)cellModel
{
    [self.mutableCellModels addObject:cellModel];
}

- (void)insertCellModel:(DEWTableStaticCellModel *)cellModel atIndex:(NSInteger)index
{
    [self.mutableCellModels insertObject:cellModel atIndex:index];
}

- (void)removeCellModelAtIndex:(NSInteger)index
{
    [self.mutableCellModels removeObjectAtIndex:index];
}

- (NSInteger)numberOfRows
{
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    return cellModel.cell;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    if (cellModel.selected) {
        cellModel.selected(indexPath);
    }
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    return cellModel.rowHeight;
}

- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    return cellModel.canEdit;
}

- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    return cellModel.editStyle;
}

- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DEWTableStaticCellModel *cellModel = [self.cellModels objectAtIndex:indexPath.row];
    if (cellModel.editCommit) {
        cellModel.editCommit(indexPath, editingStyle);
    }    
}

#pragma mark Getters

- (NSMutableArray<DEWTableStaticCellModel *> *)mutableCellModels
{
    if (_mutableCellModels) return _mutableCellModels;
    _mutableCellModels = [[NSMutableArray alloc]init];
    return _mutableCellModels;
}

- (NSArray<DEWTableStaticCellModel *> *)cellModels
{
    return self.mutableCellModels.copy;
}


@end
