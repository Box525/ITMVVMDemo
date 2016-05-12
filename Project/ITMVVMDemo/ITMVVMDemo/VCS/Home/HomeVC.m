//
//  HomeVC.m
//  ITMVVMDemo
//
//  Created by Box on 16/5/10.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "HomeVC.h"
#import "NetRequestClass.h"
#import "STDataModels.h"
#import "MJRefresh.h"
#import "StyleView.h"
#import "ThemeView.h"

@interface HomeVC ()

@property (nonatomic,strong)STHDSTDataBase *datas;

@end

@implementation HomeVC

- (void)dealloc {
    self.datas = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"商品";
    self.automaticallyAdjustsScrollViewInsets = NO;
    //
    
    [self gGETRequest];
//    [self initView];
}

- (void)initView {
    
    if (!self.datas) {
        return;
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    scrollView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:scrollView];
    
    StyleView *styleView = [[StyleView alloc]initWithFrame:CGRectMake(0, 10, kMainBoundsW, 200)];
    styleView.modelD = self.datas;
    [scrollView addSubview:styleView];
    
    ThemeView *themeView = [[ThemeView alloc]initWithFrame:CGRectMake(0, 220, kMainBoundsW, 100)];
    themeView.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:themeView];
    
    
    
    
}

- (void)gGETRequest {
    //http://gw.api.taobao.com/router/rest?sign=3B5E745F8A2FC2CB70F88E19AF6BA877&timestamp=2016-05-10+13%3A13%3A40&v=2.0&app_key=12129701&method=taobao.ju.groupids.get&partner_id=top-apitools&format=json&page_size=5&page_no=1&terminal_type=IPHONE&force_sensitive_param_fuzzy=true
    
//    NSString *url = @"http://180.97.34.118/naserver/item/ItemRelatedSearch?appid=ios&bduss=&channel=com_dot_apple&cityid=100010000&cuid=11a2e62839f7bed05437dcb826be61a0c47a515c&deal_id=5039138&device=iPhone&ha=5&lbsidfa=ACAF9226-F987-417B-A708-C95D482A732D&locate_city_id=100010000&location=39.989410%2C116.324400&logpage=DealDetail&net=wifi&os=8.2&s=6407d0bdb7fd7ef47d30786b435cb493&sheight=1334&sign=34636751140f178be81ef21b5b64292d&swidth=750&terminal_type=ios&timestamp=1443426373126&tn=ios&uuid=11a2e62839f7bed05437dcb826be61a0c47a515c&v=5.13.0";
   
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass requestWithASIURL:kURLStyleAndTheme parmas:nil httpMethod:@"GET" completeBlock:^(id responseObject, NSError *error) {
//                KSLog(@"------post1---->%@",responseObject);
                
                NSDictionary *dict = (NSDictionary *)responseObject;
//                KSLog(@"%@",dict.description);
                if (dict) {
                    STHDSTDataBase *model = [STHDSTDataBase modelObjectWithDictionary:dict];
//                    KSLog(@"%@",model);
                    for (STData *d in model.data) {
//                        KSLog(@"item : %@",d)
                        for (STItems *item in d.items) {
                            KSLog(@"item : %@",item.classifyIcon);
                            KSLog(@"item : %@",item.classifyName);
                            KSLog(@"item : %.0f",item.classifyId);
                            KSLog(@"****************************");
                        }
                    }
                    
                    self.datas = model;
                    
                    [self initView];
                }else{
                    KSLog(@"No Data.......");
                    //数据没有回来要处理
                }
                
                
            }];
        } else {
            KSLog(@"NO Networking!!!");
            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
