//
//  CLBlueToothManager.h
//  蓝牙Tool
//
//  Created by 夜猫子 on 2017/5/21.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CLBlueToothManager : NSObject

//创建单例类
+(instancetype)cl_shareInstance;


/**
 开始扫描外设
 @param updataPeripheral 扫描外设回调
 */
-(void)cl_beginScanCBPeripheral:(void(^)(NSArray *peripheraArr))updataPeripheral;


/**
 连接设备
 @param peripheral 外设
 @param completionBlock 连接回调
 */
-(void)cl_connectPeripheral:(CBPeripheral *)peripheral Completion:(void(^)(NSError *error))completionBlock;


@end
