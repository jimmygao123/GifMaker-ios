//
//  ViewController.m
//  PngGetRGBA
//
//  Created by jimmygao on 2017/5/9.
//  Copyright © 2017年 高国栋. All rights reserved.
//

#import "ViewController.h"
#import "ImageHelper.h"
#import "gifOneHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [self imageWithfileName:@"1.png"];
    UIImage *image2 = [self imageWithfileName:@"2.png"];
    UIImage *image3 = [self imageWithfileName:@"3.png"];
    UIImage *image4 = [self imageWithfileName:@"4.png"];
    UIImage *image5 = [self imageWithfileName:@"5.png"];
    UIImage *image6 = [self imageWithfileName:@"6.png"];
    
    unsigned char *frame1 = [ImageHelper convertUIImageToBitmapRGBA8:image1];
    unsigned char *frame2 = [ImageHelper convertUIImageToBitmapRGBA8:image2];
    unsigned char *frame3 = [ImageHelper convertUIImageToBitmapRGBA8:image3];
    unsigned char *frame4 = [ImageHelper convertUIImageToBitmapRGBA8:image4];
    unsigned char *frame5 = [ImageHelper convertUIImageToBitmapRGBA8:image5];
    unsigned char *frame6 = [ImageHelper convertUIImageToBitmapRGBA8:image6];
    
    NSString *document = (NSString *)[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filepath = [document stringByAppendingPathComponent:@"test.gif"];

    GifWriter maker;
    GifBegin(&maker, filepath.UTF8String, 400, 400, 100);
    GifWriteFrame(&maker, frame1, 249, 202, 100);
    GifWriteFrame(&maker, frame2, 335, 374, 100);
    GifWriteFrame(&maker, frame3, 293, 249, 100);
    GifWriteFrame(&maker, frame4, 206, 86, 100);
    GifWriteFrame(&maker, frame5, 181, 210, 100);
    GifWriteFrame(&maker, frame6, 380, 376, 100);
    if(GifEnd(&maker)){
        NSLog(@"save success");
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(UIImage *)imageWithfileName:(NSString *)filename{
    NSURL * url1 = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    UIImage *image = [UIImage imageWithData:data1];
    return image;
}

@end
