//
//  ViewController.m
//  TestScrollViewAutoLayout
//
//  Created by Jowyer on 15/1/9.
//  Copyright (c) 2015年 jo2studio. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ContentView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController {
    ContentView *contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    contentView = [[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:self options:nil] objectAtIndex:0];
    [self.scrollView addSubview:contentView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(contentView);
    }];
}

- (void)viewDidLayoutSubviews {
    contentView.widthConstrait.constant = self.scrollView.frame.size.width;
    contentView.heightConstraint.constant = self.scrollView.frame.size.height;
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:contentView.widthConstrait.constant * 3]);
        make.height.equalTo([NSNumber numberWithFloat:contentView.heightConstraint.constant]);
    }];
    
    [super viewDidLayoutSubviews];
}

@end
