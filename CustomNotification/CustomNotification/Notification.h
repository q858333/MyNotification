//
//  Notification.h
//  CustomNotification
//
//  Created by DengBin on 15/11/2.
//  Copyright © 2015年 DengBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject
@property(nonatomic,assign)SEL  selector;
@property(nonatomic,weak)id   delegate;
@end
