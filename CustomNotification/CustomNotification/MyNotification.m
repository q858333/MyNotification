//
//  MyNotification.m
//  CustomNotification
//
//  Created by DengBin on 15/11/2.
//  Copyright © 2015年 DengBin. All rights reserved.
//

#import "MyNotification.h"
#import "Notification.h"

@implementation MyNotification
+(id)shareNotification{

    static MyNotification *myNotifiation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        myNotifiation = [[MyNotification alloc]init];
        
        
    });
    return myNotifiation;
    
}


-(void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name{
    
    if (!_dic)
    {
        _dic = [NSMutableDictionary new];
    }
    

    Notification *no = [Notification new];
    no.delegate = observer;
    no.selector = selector;
    [_dic setValue:no forKey:name];

    
}

-(void)postWithName:(NSString *)name{

    Notification *no = _dic[name];

//    objc_msgSend(no.delegate,no.selector,no);

}
@end
