//
//  DEWTableSection.h
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEWTableSectionProtocol.h"
#import "DEWTableStaticCellModel.h"

@interface DEWTableStaticSection : NSObject<DEWTableSectionProtocol>

//protocol
@property (nonatomic, strong) UIView *sectionHeader;
@property (nonatomic, strong) UIView *sectionFooter;

@property (nonatomic, assign) NSInteger numberOfRows;

//
@property (nonatomic, strong, readonly) NSArray <DEWTableStaticCellModel *> *cellModels;

- (void)addCellModel:(DEWTableStaticCellModel *)cellModel;
- (void)insertCellModel:(DEWTableStaticCellModel *)cellModel atIndex:(NSInteger)index;
- (void)removeCellModelAtIndex:(NSInteger)index;

@end


