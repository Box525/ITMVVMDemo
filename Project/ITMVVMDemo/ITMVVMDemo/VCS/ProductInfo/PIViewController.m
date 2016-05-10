//
//  PIViewController.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/7.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "PIViewController.h"
#import "ProductItemCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface PIViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_listTable;
}
@property(nonatomic,strong)NSArray *products;
@end

@implementation PIViewController

- (void)dealloc {
    self.publicModel = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    KSLog(@"info is %@",self.publicModel);
    [self getData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData {
    self.products = self.publicModel.items;
}

- (void)initView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:ProductItemCell.self forCellReuseIdentifier:@"CellID"];
    //去掉底部多余的表格线
    [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    [self.view addSubview:table];
    
    _listTable = table;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    HDItems *item = self.products[indexPath.row];
    
    cell.item = item;
//    cell.textLabel.text = [NSString stringWithFormat:@"time : %@",item.publishTime];
    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;
    
    return cell;
}




#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.products.count != 0) {
        return self.products.count;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    return 160*2;
    return [tableView cellHeightForIndexPath:indexPath model:self.products[indexPath.row] keyPath:@"item" cellClass:[ProductItemCell class] contentViewWidth:[self cellContentViewWith]];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    PublicProductModelClass *publicViewModel = [[PublicProductModelClass alloc] init];
//    [publicViewModel productDetailWithPublicModel:self.products[indexPath.row] WithViewController:self];
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}





@end
