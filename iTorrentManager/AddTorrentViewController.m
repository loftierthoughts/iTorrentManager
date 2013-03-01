//
//  AddTorrentViewController.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "AddTorrentViewController.h"
#import "TorrentPersistenceManager.h"
#import "Torrent.h"
#import "TorrentParser.h"
#import "TorrentListViewController.h"
@implementation AddTorrentViewController
@synthesize torrentName,torrentURL,addButton;
@synthesize torrentLabel,torretnNameLabel,torretnURLLabel;
- (IBAction)addTorrentAction:(UIButton *)sender {    
    if(![torrentName isEqual:@""]){
        if(![torrentURL isEqual:@""]){
            Torrent *newTorrent = [[Torrent alloc]initWith:torrentName.text AndURL:torrentURL.text];
            newTorrent.size = 365.0;
            newTorrent.seeders = 10254;
            newTorrent.leechers = 898;
            NSMutableArray *torrentsArray = [TorrentPersistenceManager getTorrentsFromJSON];
            [torrentsArray addObject:newTorrent];
            NSMutableString *toWrite =[TorrentParser serialize:torrentsArray];
            [TorrentPersistenceManager writeJSONFile:toWrite];
            [self performSegueWithIdentifier:@"segueFromAddToList" sender:nil];
        }
        
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueFromAddToList"]){
        UITabBarController *destination = (UITabBarController *) segue.destinationViewController;
    }
}
-(void)viewDidAppear:(BOOL)animated{    
    torrentName.delegate = self;    
    torrentURL.delegate = self;
    [addButton setEnabled:TRUE];
    torrentURL.text=@"";
    torrentName.text=@"";
    UIImage *aImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:aImage];
    [self.view setOpaque:NO];
    [torretnURLLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torretnNameLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
    [torrentLabel setTextColor:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f]];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    
    
    NSLog(@"return keyboard");
    
    [textField resignFirstResponder];
    
    return YES;
} 

@end
