//
//  TorrentDetailsViewController.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "TorrentDetailsViewController.h"
#import "TorrentListViewController.h"
@implementation TorrentDetailsViewController

@synthesize torrentName,torrentURL,torrentLeechers,torrentProgress,torrentSeeders,torrentSize,balanceProgress;
@synthesize seedersLabel,leechersLabel,progressionLabel,balanceLabel,megabytesLabel,sizeLabel,URLLabel;
-(void)viewDidLoad{
    UIImage *aImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:aImage];
    [self.view setOpaque:NO];
    [seedersLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [leechersLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [progressionLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [balanceLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [megabytesLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [sizeLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [URLLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torrentName setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    
    
    [torrentURL setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torrentLeechers setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torrentSeeders setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torrentSize setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    
    torrentName.text = currentTorrent.name;
    torrentURL.text = currentTorrent.url;
    torrentSize.text = [NSString stringWithFormat:@"%.2f",currentTorrent.size];
    torrentLeechers.text = [NSString stringWithFormat:@"%.2d",currentTorrent.leechers];
    
    torrentSeeders.text = [NSString stringWithFormat:@"%.2d",currentTorrent.seeders];
    
    
    int totalPeers = currentTorrent.seeders + currentTorrent.leechers;
    double progress = (100*currentTorrent.seeders)/totalPeers;
    balanceProgress.progress = (progress/100);
    torrentProgress.progress = currentTorrent.completion /100;
}
- (IBAction)backButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"segueToList" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToList"]){
        UITabBarController *destination = (UITabBarController *) segue.destinationViewController;
    }
}
@end
