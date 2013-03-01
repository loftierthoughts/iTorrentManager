//
//  Torrent.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Torrent : NSObject
@property(readwrite)NSString *name;
@property(readwrite)NSString *url;
@property(readwrite)NSDate *date;
@property(readwrite)int seeders;
@property(readwrite)int leechers;
@property(readwrite)double size;
@property(readwrite)double completion;
-(id)initWith:(NSString *)_name AndURL:(NSString *)_url;
-(id)initWith:(NSString *)_name AndURL:(NSString *)_url AndSeeders:(int) _seeders AndLeechers:(int) _leechers;
@end
