//
//  TorrentDetailsViewController.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Torrent.h"
@interface TorrentDetailsViewController : UIViewController{
    @public
    Torrent *currentTorrent;
}

- (IBAction)backButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *torrentName;
@property (weak, nonatomic) IBOutlet UILabel *torrentURL;
@property (weak, nonatomic) IBOutlet UILabel *torrentSeeders;
@property (weak, nonatomic) IBOutlet UILabel *torrentLeechers;
@property (weak, nonatomic) IBOutlet UILabel *torrentSize;
@property (weak, nonatomic) IBOutlet UIProgressView *torrentProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *balanceProgress;
@property (weak, nonatomic) IBOutlet UILabel *URLLabel;
@property (weak, nonatomic) IBOutlet UILabel *seedersLabel;
@property (weak, nonatomic) IBOutlet UILabel *leechersLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *megabytesLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressionLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;



@end
