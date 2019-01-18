//
//  DEWTableManager.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "DEWTableManager.h"

@interface DEWTableManager ()

@property (nonatomic, strong, readwrite) NSMutableArray <id <DEWTableSectionProtocol>> *mutableSections;

@end


@implementation DEWTableManager

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:section];
    return sectionModel.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    return [sectionModel tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    [sectionModel didSelectRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    return [sectionModel heightForRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:section];
    return sectionModel.sectionHeader;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:section];
    return sectionModel.sectionFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:section];
    return sectionModel.sectionHeader.bounds.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:section];
    return sectionModel.sectionFooter.bounds.size.height;
}

//Edit

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    return [sectionModel canEditRowAtIndexPath:indexPath];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    return [sectionModel editingStyleForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id<DEWTableSectionProtocol> sectionModel = [self.sections objectAtIndex:indexPath.section];
    [sectionModel commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

#pragma mark Public

- (void)addSection:(id<DEWTableSectionProtocol>)section
{
    [self.mutableSections addObject:section];
}

- (void)insertSection:(id<DEWTableSectionProtocol>)section atIndex:(NSInteger)index;
{
    [self.mutableSections insertObject:section atIndex:index];
}

- (void)removeSectionAtIndex:(NSInteger)index
{
    [self.mutableSections removeObjectAtIndex:index];
}

- (void)removeSection:(id<DEWTableSectionProtocol>)section
{
    [self.mutableSections removeObject:section];
}

- (NSInteger)indexForSection:(id<DEWTableSectionProtocol>)section
{
    if (!section) {
        return -1;
    }
    
    __block NSInteger index = -1;
    
    [self.mutableSections enumerateObjectsUsingBlock:^(id<DEWTableSectionProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([section isEqual:obj]) {
            index = idx;
            *stop = YES;
            return;
        }
    }];
    return index;
}

#pragma mark Privite

- (NSMutableArray<id<DEWTableSectionProtocol>> *)mutableSections
{
    if (_mutableSections) return _mutableSections;
    _mutableSections = [[NSMutableArray alloc]init];
    return _mutableSections;
}

- (NSArray <id<DEWTableSectionProtocol>> *)sections
{
    return self.mutableSections.copy;
}

@end
