//
//  ViewController.m
//  MyOwnStudy
//
//  Created by liqunfei on 16/2/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "ViewController.h"
#import "MySQLite.h"
#import "MyFMDB.h"
#import "BeginView.h"
#import "AppDelegate.h"
@interface ViewController ()<BeginViewDelegate>
{
    CALayer *layer;
    __weak IBOutlet UIButton *sqliteButton;
    BeginView *bgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bgView = [[BeginView alloc] initWithFrame:self.view.bounds];
    bgView.delegate = (id<BeginViewDelegate>)self;
    [self.view addSubview:bgView];
    [self.view bringSubviewToFront:bgView];
    layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.position = CGPointMake(50.0, 30.0);
    layer.bounds = CGRectMake(0, 0, 60, 60);
    layer.cornerRadius = 30.0f;
    [sqliteButton.layer addSublayer:layer];
}

- (void)removeSelf {
    [bgView removeFromSuperview];
}

- (IBAction)buttonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    switch (sender.tag) {
        case 101:
        {
            MySQLite *sq = [[MySQLite alloc] init];
            [sq createDB];
            if (sender.selected) {
                layer.bounds = CGRectMake(0, 0, 100, 60.0);
            }
            else {
               layer.bounds = CGRectMake(0.0, 0.0, 60, 60);
            }
            
        }
            break;
        case 102:
        {
            MyFMDB *db = [[MyFMDB alloc] init];
            [db createFMDB];
        }
            break;
        case 103:
        {
            [appDelegate insertCoreData];
        }
            break;
        case 104:
        {
            [appDelegate insertCoreData1];
        }
        default:
            break;
    }
}

@end
