//
//  CUIHallListViewController.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "CUIHallListViewController.h"
#import "CUIHallViewControlViewController.h"
#import "CUIHallViewAnimationViewController.h"

#define SmallCellHeight   120
#define BigCellHeight   242
#define Cellwidth (kScreenWidth - 2) / 2.0;

@interface CUIHallListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@end

@implementation CUIHallListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:self.tableView];
    [self loadTitleArray];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)loadTitleArray
{
    self.titleArr = [NSMutableArray new];
    NSArray *array = @[
        @"控件视图",
        @"动画视图",
    ];
    [self.titleArr addObjectsFromArray:array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!contentCell) {
        contentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    contentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    contentCell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    return contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    UIViewController *vc = nil;
    if (0 == index) {
        vc = [[CUIHallViewControlViewController alloc]init];
    }
    if (1 == index) {
        vc = [[CUIHallViewAnimationViewController alloc]init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
