//
//  LKViewController.m
//  LKDataDemo
//
//  Created by licrk on 13-12-12.
//  Copyright (c) 2013年 LK. All rights reserved.
//

#import "LKViewController.h"
#import <LKHttpQueue.h>
#import <LKASIHttpUtil.h>
#import <ASIHTTP/ASIHTTPRequest.h>

@interface LKViewController (){
    IBOutlet UIButton *_btnTest;
}

@end

@implementation LKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testQueue:(id)sender{
    LKHttpQueue *quque=[[LKHttpQueue alloc] init];
    [quque createBlockRequest:[NSURL URLWithString:@"http://news.163.com"] requestFinished:^(NSArray *array, id request) {        
        if ([request isKindOfClass:[LKASIHttpUtil class] ]) {
            LKASIHttpUtil *util=request;
            NSLog(@"%@",[[util request] responseString]);
        }
        [_btnTest setTitle:@"test" forState:UIControlStateNormal];
        NSLog(@"%@",[request performSelector:@selector(responseString)]);
    }];
}
-(void)dealloc{
}

@end
