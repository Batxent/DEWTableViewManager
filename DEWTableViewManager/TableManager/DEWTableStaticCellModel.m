//
//  DEWTableCellModel.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "DEWTableStaticCellModel.h"

@implementation DEWTableStaticCellModel

- (instancetype)initWithCell:(UITableViewCell *)cell
                   rowHeight:(CGFloat)rowHeight
                    selected:(DEWTableCellSelected)selected
{
    self = [super init];
    if (!self) return nil;
    
    self.cell = cell;
    self.selected = [selected copy];
    self.rowHeight = rowHeight;
    
    return self;
}

@end
