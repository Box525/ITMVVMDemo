//
//  MainViewController.m
//  ITMVVMDemo
//
//  Created by Box on 16/4/1.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "MainViewController.h"
#import "NetRequestClass.h"
#import "DataModels.h"
#import "PublicProductModelClass.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_listTable;
}

@property(nonatomic,strong)NSArray *products;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main";
    
//    [self initView];
//    [self getData];
    
//    [self pPostRequest];
    [self gGETRequest];
//    BOOL ret = [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL];
//
//    if (ret) {
//        KSLog(@"YES");
//    }else{
//        KSLog(@"NO");
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gGETRequest {
    
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=eeec77fc9690c7c0b1e70f6a3fb021d2&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                if (!error) {
                     KSLog(@"------post1---->%@",responseObject);
                    [NetRequestClass netRequestGETWithRequestURL:@"http://gw.api.taobao.com/router/rest?sign=3B5E745F8A2FC2CB70F88E19AF6BA877&timestamp=2016-05-10+13%3A13%3A40&v=2.0&app_key=12129701&method=taobao.ju.groupids.get&partner_id=top-apitools&format=json&page_size=5&page_no=1&terminal_type=IPHONE&force_sensitive_param_fuzzy=true" WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                        if (!error) {
                            KSLog(@"------post222222---->%@",responseObject);
                            
                        }
                    }];
                }
            }];
        }else{
            KSLog(@"NO Networking!!!");
        }
    }];

    
    //http://gw.api.taobao.com/router/rest?sign=3B5E745F8A2FC2CB70F88E19AF6BA877&timestamp=2016-05-10+13%3A13%3A40&v=2.0&app_key=12129701&method=taobao.ju.groupids.get&partner_id=top-apitools&format=json&page_size=5&page_no=1&terminal_type=IPHONE&force_sensitive_param_fuzzy=true
    
//    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=eeec77fc9690c7c0b1e70f6a3fb021d2&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
//    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
//        if (netConnetState) {
//            [NetRequestClass requestWithASIURL:url parmas:nil httpMethod:@"GET" completeBlock:^(id responseObject, NSError *error) {
//                KSLog(@"------post1---->%@",responseObject);
//                
//                [NetRequestClass requestWithASIURL:@"http://gw.api.taobao.com/router/rest?sign=3B5E745F8A2FC2CB70F88E19AF6BA877&timestamp=2016-05-10+13%3A13%3A40&v=2.0&app_key=12129701&method=taobao.ju.groupids.get&partner_id=top-apitools&format=json&page_size=5&page_no=1&terminal_type=IPHONE&force_sensitive_param_fuzzy=true" parmas:nil httpMethod:@"GET" completeBlock:^(id responseObject, NSError *error) {
//                    KSLog(@"------post2222222---->%@",responseObject);
//                    
//                    
//                }];
//            }];
//        } else {
//            KSLog(@"NO Networking!!!");
//        }
//    }];
}

- (void)pPostRequest{
    NSString *url = @"http://www.haoduorou.net/";
    NSDictionary *dict = @{@"command": @"getAllLinks"};
    
#if 0
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestPOSTWithRequestURL:url WithParameter:dict WithReturnValeuBlock:^(id responseObject, NSError *error) {
                if (!error) {
                    
                    KSLog(@"------post---->%@",responseObject);
                    
//                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    
//                    NSData *data = [[NSData alloc]initWithData:[responseObject JSONData]];
                    
                    
//                    NSData *data = [responseObject JSONData];
//                    NSDictionary *dict = [data objectFromJSONData];
//                    KSLog(@"%@",dict);
                }else{
                    
                    KSLog(@"-----------error %@",error.localizedDescription);
                }
            }];
        }else{
            KSLog(@"NO Networking!!!");
        }
    }];
    
#else
    
/*
     NSString* urlString=@"http://192.168.1.101:8080/PengFu/jokController/getPhoneJok";
     NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObject:@"1 " forKey:@"rows"];
     UIImage *image=[UIImage imageNamed:@"test3.gif"];
     [params setObject:image forKey:@"pic"];
     [params setObject:@"test gif image upload" forKey:@"status"];
     
     [DataService requestWithASIURL:urlString1 parmas:params httpMethod:@"POST" completeBlock:^(id result) {
     NSLog(@"%@",result);
     }];
*/
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass requestWithASIURL:url parmas:(NSMutableDictionary *)dict httpMethod:@"POST" completeBlock:^(id responseObject, NSError *error) {
                KSLog(@"-----------post1---->%@",responseObject);
                [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
                    if (netConnetState) {
                        [NetRequestClass requestWithASIURL:url parmas:(NSMutableDictionary *)dict httpMethod:@"GET" completeBlock:^(id responseObject, NSError *error) {
                            KSLog(@"-------------------post2---->%@",responseObject);
                        }];
                    } else {
                        KSLog(@"NO Networking!!!");
                    }
                }];
            }];
        } else {
            KSLog(@"NO Networking!!!");
        }
    }];

    
#endif
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)getData {
//    BOOL ret = [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL];
//    if (ret) {
//        KSLog(@"YES");
//    }else{
//        KSLog(@"NO");
//    }
#if 0
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=eeec77fc9690c7c0b1e70f6a3fb021d2&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                if (!error) {
                    NSDictionary *dict = (NSDictionary *)responseObject;//[responseObject objectFromJSONData];
                    HDHDBasicClass *data = [HDHDBasicClass modelObjectWithDictionary:dict];
                    //                    KSLog(@"%@",data.content.issues);
                    for (HDIssues *issues in data.content.issues) {
                        KSLog(@"%@",issues);
                    }
                    
                }
            }];
        }else{
            KSLog(@"NO Networking!!!");
        }
    }];
#else
    
    PublicProductModelClass *products = [PublicProductModelClass new];
    [products setBlockWithReturnBlock:^(id responseObject, NSError *error) {
        if (!error) {
            
            HDHDBasicClass *data = (HDHDBasicClass *)responseObject;
            
            self.products = data.content.issues;
            
            [_listTable reloadData];
            
            
            
        }
    }];
    [products fetchPublicProductList];
    
    
#endif
    
}

- (void)initView {
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:UITableViewCell.self forCellReuseIdentifier:@"CellID"];
    //去掉底部多余的表格线
    [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:table];
    
    _listTable = table;
    
}

#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    
    
    HDIssues *issue = self.products[indexPath.row];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"issue id = %f",issue.issueId];
    
    
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
    
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicProductModelClass *publicViewModel = [[PublicProductModelClass alloc] init];
    [publicViewModel productDetailWithPublicModel:self.products[indexPath.row] WithViewController:self];
}









@end







