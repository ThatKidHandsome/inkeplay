//
//  HRHotLiveViewController.m
//  inke
//
//  Created by 众力金融 on 16/11/1.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import "HRHotLiveViewController.h"
#import "HRHotLiveCell.h"
#import "HRLive.h"
#import "HRPlayerViewController.h"

@interface HRHotLiveViewController ()

/** 数据源数组 */
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation HRHotLiveViewController
static NSString *const identifier = @"HRHotLiveCell";
- (void)viewDidLoad {
    [super viewDidLoad];

     [self.tableView setContentInset:UIEdgeInsetsMake(-35, 0, 0, 0)];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     [self.tableView registerNib:[UINib nibWithNibName:@"HRHotLiveCell" bundle:nil] forCellReuseIdentifier:identifier];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadData {
    
   [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
       
       self.dataList = [HRLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
       [self.tableView reloadData];
       
   } failure:^(NSError *error) {
       
       
   }];
    

    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRHotLiveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.live = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70 + self.view.bounds.size.width + 10;
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HRPlayerViewController *vc = [[HRPlayerViewController alloc]init];
    vc.live = self.dataList[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
@end
