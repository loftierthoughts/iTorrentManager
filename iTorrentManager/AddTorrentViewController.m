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
- (IBAction)addTorrentAction:(UIButton *)sender {
    if(![torrentName isEqual:@""]){
        if(![torrentURL isEqual:@""]){
            Torrent *newTorrent = [[Torrent alloc]initWith:torrentName.text AndURL:torrentURL.text];
            NSMutableArray *torrentsArray = [TorrentPersistenceManager getTorrentsFromJSON];
            [torrentsArray addObject:newTorrent];
            NSMutableString *toWrite =[TorrentParser serialize:torrentsArray];
            [TorrentPersistenceManager writeJSONFile:toWrite];
            [addButton setEnabled:FALSE];
        }
        
    }
    
}
-(void)viewDidAppear:(BOOL)animated{    
    torrentName.delegate = self;    
    torrentURL.delegate = self;
    [addButton setEnabled:TRUE];
    torrentURL.text=@"";
    torrentName.text=@"";
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    
    
    NSLog(@"return keyboard");
    
    [textField resignFirstResponder];
    
    return YES;
} 

@end
