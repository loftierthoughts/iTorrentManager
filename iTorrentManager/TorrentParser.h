//
//  TorrentParser.h
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TorrentParser : NSObject
@property NSDictionary *torrents;
-(id)init:(NSDictionary*) _torrents;
-(NSMutableArray *)getTorrents;
+(NSMutableString*)serialize:(NSMutableArray*)torrents;
@end
