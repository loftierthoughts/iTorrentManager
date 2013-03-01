//
//  TorrentListViewController.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TorrentListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableViewCell *cell;
    @public
    NSMutableArray *mytorrents;
}

@property (weak, nonatomic) IBOutlet UITableView *torrentTable;


@end
