//
//  TorrentCellController.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TorrentCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *torrentLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *torrentProgress;
@end
