//
//  DEWTableManager.h
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEWTableStaticSection.h"
#import "DEWTableDynamicSection.h"

@interface DEWTableManager : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) NSArray <id <DEWTableSectionProtocol>> *sections;

- (void)addSection:(id <DEWTableSectionProtocol>)section;
- (void)insertSection:(id <DEWTableSectionProtocol>)section atIndex:(NSInteger)index;
- (void)removeSectionAtIndex:(NSInteger)index;

- (void)removeSection:(id <DEWTableSectionProtocol>)section;

///如果不存在该section，返回-1
- (NSInteger)indexForSection:(id <DEWTableSectionProtocol>)section;

@end


