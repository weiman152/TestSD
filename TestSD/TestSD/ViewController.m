//
//  ViewController.m
//  TestSD
//
//  Created by weiman on 2017/12/29.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, mScreenWidth-20, 100)];
    [self.view addSubview:imageV];
    imageV.backgroundColor = [UIColor yellowColor];
    
    NSString * imageurl = @"http://images21.happyjuzi.com/test/ea/09/91f522741b7a0976b5f21a3b9f78.jpg!200.nw.webp";
    //1、加载网络图片
    //[self loadWebImageWithUrl:imageurl andImageV:imageV];
    //2.加载webp图片
    [self loadWebPImageWithUrl:imageurl andImageV:imageV];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebImageWithUrl:(NSString *)imageurl andImageV:(UIImageView *)imageV{
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:imageurl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"图片展示成功");
    }];
}

-(void)loadWebPImageWithUrl:(NSString *)url andImageV:(UIImageView *)imageV{
    
    NSError * error;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingMappedIfSafe error:&error];
    if (data) {
        UIImage * image = [UIImage sd_imageWithData:data];
        imageV.image = image;
    }else{
        NSLog(@"惨兮兮，没有数据");
    }
}


@end
