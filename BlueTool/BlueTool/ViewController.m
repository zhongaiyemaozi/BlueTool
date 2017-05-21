//
//  ViewController.m
//  BlueTool
//
//  Created by 夜猫子 on 2017/5/21.
//  Copyright © 2017年 夜猫子. All rights reserved.
//

#import "ViewController.h"
#import "CLBlueToothManager.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray <CBPeripheral *>*dataSourceArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)scanButtonClick:(UIButton *)sender {
    
    [[CLBlueToothManager cl_shareInstance] cl_beginScanCBPeripheral:^(NSArray *peripheraArr) {
        
        self.dataSourceArr = peripheraArr;
        //刷新UI
        [self.tableView reloadData];
    }];
    
}
#pragma mark - 实现数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    CBPeripheral *peripheral = self.dataSourceArr[indexPath.row];
    cell.textLabel.text = [peripheral.identifier UUIDString];
    cell.detailTextLabel.text = peripheral.name;
    
    return cell;
}
#pragma tableView选中某一行的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CBPeripheral *peripheral = self.dataSourceArr[indexPath.row];
    [[CLBlueToothManager cl_shareInstance] cl_connectPeripheral:peripheral Completion:^(NSError *error) {
        if (error == nil) {
            NSLog(@"连接成功");
        }else{
            NSLog(@"%@",error);
        }
        
    }];
    
}

@end
