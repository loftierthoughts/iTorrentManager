//
//  TorrentParser.m
//  iTorrentManager
//
//  Created by USERCCI on 28/02/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "TorrentParser.h"
#import "Torrent.h"
@implementation TorrentParser
@synthesize torrents;

-(id)init:(NSDictionary*) _torrents{
    self = [super init];
    self.torrents = _torrents;
    return self;
}
-(NSMutableArray *)getTorrents{
    NSMutableArray *torrentObjectArray = [[NSMutableArray alloc]init];
    for (NSString* key in torrents) {
        NSLog(@"Parsing torrent :%@",key);
        id name = [[torrents objectForKey:key] objectForKey:@"name"];
        id url = [[torrents objectForKey:key] objectForKey:@"url"];
        id date = [[torrents objectForKey:key] objectForKey:@"date"];
        id seeders = [[torrents objectForKey:key] objectForKey:@"seeders"];
        id leechers = [[torrents objectForKey:key] objectForKey:@"leechers"];
        id completion = [[torrents objectForKey:key] objectForKey:@"completion"];
        id size =[[torrents objectForKey:key] objectForKey:@"completion"];
        
        Torrent *toReturn = [[Torrent alloc]initWith:name AndURL:url AndSeeders:[seeders integerValue] AndLeechers:[leechers integerValue]];
        toReturn.size = [size doubleValue];
        if(toReturn.completion <100)
            [toReturn setCompletion:[completion doubleValue]+10];
        else
            [toReturn setCompletion:[completion doubleValue]];
        [toReturn setDate:date];
        [torrentObjectArray addObject:toReturn];
        
    }
    return torrentObjectArray;
}

+(NSMutableString*)serialize:(NSMutableArray*)torrents{
    NSMutableString *stringToReturn = [[NSMutableString alloc] init];
    [stringToReturn appendString:@"{ \"torrents\":{"];
    for(int i=0;i<[torrents count];i++){
        Torrent *cur = [torrents objectAtIndex:i];
        
        NSString *name =[cur name];
        NSString *url = [cur url];
        NSDate *date = [cur date];
        int seeders = [cur seeders];
        int leechers =  [cur leechers];
        double completion = [cur completion];
        //simulate completion evolution
        if(completion <100){
           completion +=5;
        }
        
        if(i!=0){
            [stringToReturn appendString:@","];
        }
        NSString *string=[NSString stringWithFormat:@"\"torrent%d\":{\"name\":\"%@\",",i,name];
        [stringToReturn appendString:string];
        string=[NSString stringWithFormat:@"\"url\":\"%@\",",url];
        [stringToReturn appendString:string];
        string=[NSString stringWithFormat:@"\"date\":\"%@\",",date];
        [stringToReturn appendString:string];
        string=[NSString stringWithFormat:@"\"seeders\":%d,",seeders];
        [stringToReturn appendString:string];
        string=[NSString stringWithFormat:@"\"leechers\":%d,",leechers];
        [stringToReturn appendString:string];
        string=[NSString stringWithFormat:@"\"completion\":%f}",completion];
        [stringToReturn appendString:string];
    }
    
    NSString *string=@"}}";
    [stringToReturn appendString:string];
    return stringToReturn;
}
@end
