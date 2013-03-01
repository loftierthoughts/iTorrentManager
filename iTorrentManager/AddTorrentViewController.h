//
//  AddTorrentViewController.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTorrentViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *torrentLabel;
@property (weak, nonatomic) IBOutlet UILabel *torretnNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *torretnURLLabel;

@property (weak, nonatomic) IBOutlet UITextField *torrentName;
@property (weak, nonatomic) IBOutlet UITextField *torrentURL;
- (IBAction)addTorrentAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end
