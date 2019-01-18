//
//  DEWTableCellModel.h
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DEWTableCellSelected)(NSIndexPath *indexPath);
typedef void(^DEWTableCellEditCommit)(NSIndexPath *indexPath, UITableViewCellEditingStyle editingStyle);


@interface DEWTableStaticCellModel : NSObject

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) UITableViewCellEditingStyle editStyle;

@property (nonatomic, copy) DEWTableCellSelected selected;
@property (nonatomic, copy) DEWTableCellEditCommit editCommit;

- (instancetype)initWithCell:(UITableViewCell *)cell
                   rowHeight:(CGFloat)rowHeight
                    selected:(DEWTableCellSelected)selected;

@end



