//
//  DEWTableDynamicSection.h
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEWTableSectionProtocol.h"

typedef void(^DEWTableConfigureBlock)(id cell, id data);
typedef void(^DEWTableSelectBlock)(NSIndexPath *indexPath);

typedef BOOL(^DEWDynaicSectionCanEditBlock)(NSIndexPath *indexPath);
typedef UITableViewCellEditingStyle(^DEWDynaicSectionEditingStyleBlock)(NSIndexPath *indexPath);
typedef void(^DEWDynaicSectionCommitEditingBlock)(UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);

@interface DEWTableDynamicSection : NSObject<DEWTableSectionProtocol>

//protocol
@property (nonatomic, strong) UIView *sectionHeader;
@property (nonatomic, strong) UIView *sectionFooter;

@property (nonatomic, copy) DEWTableConfigureBlock cellConfigure;
@property (nonatomic, copy) DEWTableSelectBlock cellSelected;

@property (nonatomic, assign) NSInteger numberOfRows;

//

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, strong) NSString *idenfier;

@property (nonatomic, copy) DEWDynaicSectionCanEditBlock canEdit;
@property (nonatomic, copy) DEWDynaicSectionEditingStyleBlock editingStyle;
@property (nonatomic, copy) DEWDynaicSectionCommitEditingBlock commitEditing;


- (instancetype)initWithCellIdenfier:(NSString *)idenfier
                           dataArray:(NSArray *)dataArray
                       configure:(DEWTableConfigureBlock)configureBlock
                     didSelected:(DEWTableSelectBlock)selectedCellBlock;


- (instancetype)init NS_UNAVAILABLE;

@end


