//
//  TorrentListViewController.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "TorrentListViewController.h"
#import "SBJson.h"
#import "MBProgressHUD.h"
#import "TorrentParser.h"
#import "Torrent.h"
#import "TorrentCellController.h"
#import "TorrentPersistenceManager.h"
#import "TorrentDetailsViewController.h"
@implementation TorrentListViewController
@synthesize torrentTable;
Torrent *selectedTorrent;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    torrentTable.delegate = self;
    torrentTable.dataSource = self;     
          
    [self loadDataFromJSONFile];
    [torrentTable reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    
    [self loadDataFromJSONFile];
    [torrentTable reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadDataFromJSONFile{    
    mytorrents = [TorrentPersistenceManager getTorrentsFromJSON];
    
   
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [mytorrents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    TorrentCellController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // This part creates the cell for the firs time
    if (cell == nil) {
        NSArray *caca = [[NSBundle mainBundle] loadNibNamed:@"TorrentCell" owner:self options:nil];
        cell = [caca objectAtIndex:0];
    }
    Torrent *curr = (Torrent *)[mytorrents objectAtIndex:indexPath.row];
    cell.torrentLabel.text = [curr name];
    cell.torrentProgress.progress = [curr completion]/100;

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int idx=indexPath.row;
     selectedTorrent = [mytorrents objectAtIndex:idx];
    [self performSegueWithIdentifier:@"segueToDetails" sender:nil];
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToDetails"]){
        TorrentDetailsViewController *destination = (TorrentDetailsViewController *) segue.destinationViewController;
        destination->currentTorrent = selectedTorrent;
        
        
    }
    
}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    /*[tableView beginUpdates];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        //  [contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
    [tableView endUpdates];*/
    
//}
@end
