//
//  BeginView.h
//  MyOwnStudy
//
//  Created by liqunfei on 16/2/23.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BeginViewDelegate <NSObject>

- (void)removeSelf;

@end

@interface BeginView : UIView
@property (nonatomic,weak) id<BeginViewDelegate>delegate;

@end
