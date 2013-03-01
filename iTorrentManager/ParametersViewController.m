//
//  ParametersViewController.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "ParametersViewController.h"

@implementation ParametersViewController
@synthesize serverAddressLabel,tokenLabel;
@synthesize token,serverAddress;

-(void)viewDidAppear:(BOOL)animated{
    //reset field
    token.text = @"";
    serverAddress.text=@"";
    UIImage *aImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:aImage];
    [self.view setOpaque:NO];
    [serverAddressLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [tokenLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    
    token.delegate = self;
    serverAddress.delegate = self;
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSLog(@"return keyboard");
    
    [textField resignFirstResponder];
    
    return YES;
}
@end
