//
//  Torrent.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "Torrent.h"

@implementation Torrent
@synthesize name;
@synthesize url;
@synthesize date;
@synthesize seeders;
@synthesize leechers;
@synthesize completion;
@synthesize size;
-(id)initWith:(NSString *)_name AndURL:(NSString *)_url{
    self = [super init];
    self.name = _name;
    self.url = _url;
    self.date = [[NSDate alloc]init];
    self.completion = 0;
    return self;
}
-(id)initWith:(NSString *)_name AndURL:(NSString *)_url AndSeeders:(int) _seeders AndLeechers:(int) _leechers{
    self = [super init];
    self.name = _name;
    self.url = _url;
    self.seeders = _seeders;
    self.leechers = _leechers;
    self.date = [[NSDate alloc]init];    
    self.completion = 0;
    return self;
}
@end
