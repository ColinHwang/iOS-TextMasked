//
//  ViewController.m
//  iOS-TextMasked
//
//  Created by colin on 16/7/4.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"

#import "CHTestCell.h"

#import "NSValue+Add.h"

typedef NS_ENUM(NSInteger, CHTestRowType) {
    CHTestRowTypeOne = 0,
    CHTestRowTypeTwo,
    CHTestRowTypeThree,
};

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [tableView registerClass:[CHTestCell class] forCellReuseIdentifier:CHTestCellID];
        
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)configureTestCell:(CHTestCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0) return;
        
    if (indexPath.row == CHTestRowTypeOne)
    {
        [cell configureWithLeftTitle:@"居住地" leftMaskRange:NSRangeZero rightTitle:@"职一业" rightMaskRange:NSMakeRange(1, 1)];
        return;
    }
    
    if (indexPath.row == CHTestRowTypeTwo)
    {
        [cell configureWithLeftTitle:@"爱一好" leftMaskRange:NSMakeRange(1, 1) rightTitle:@"电一话" rightMaskRange:NSMakeRange(1, 1)];
        return;
    }
    
    if (indexPath.row == CHTestRowTypeThree)
    {
        [cell configureWithLeftTitle:@"生一日" leftMaskRange:NSMakeRange(1, 1) rightTitle:@"手机号" rightMaskRange:NSRangeZero];
        return;
    }
}

#pragma mark - UITableView DataSource && Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHTestCell *cell = [tableView dequeueReusableCellWithIdentifier:CHTestCellID forIndexPath:indexPath];
    
    [self configureTestCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

@end
