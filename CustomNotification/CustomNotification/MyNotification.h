//
//  MyNotification.h
//  CustomNotification
//
//  Created by DengBin on 15/11/2.
//  Copyright © 2015年 DengBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNotification : NSObject
{
    NSMutableDictionary *_dic;
}
+(id)shareNotification;

-(void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name;

-(void)postWithName:(NSString *)name;
@end
