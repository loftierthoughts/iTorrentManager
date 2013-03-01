//
//  TorrentDetailsViewController.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "TorrentDetailsViewController.h"

@implementation TorrentDetailsViewController
-(void)viewDidAppear:(BOOL)animated{
    UIImage *aImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:aImage];
    [self.view setOpaque:NO];
}
@end
