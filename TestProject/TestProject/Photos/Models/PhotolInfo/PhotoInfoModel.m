//
//  PhotoInfoModel.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotoInfoModel.h"

@implementation PhotoInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _identifier = [dictionary valueForKey:@"id"];
        _secret = [dictionary valueForKey:@"secret"];
        _server = [dictionary valueForKey:@"server"];
        _farm = [dictionary valueForKey:@"farm"];
        _dateuploaded = [dictionary valueForKey:@"dateuploaded"];
        _isfavorite = [dictionary valueForKey:@"isfavorite"];
        _license = [dictionary valueForKey:@"license"];
        _safetyLevel = [dictionary valueForKey:@"safety_level"];
        _rotation = [dictionary valueForKey:@"rotation"];
        _owner = [[Owner alloc]initWithDictionary:[dictionary valueForKey:@"owner"]];
        _title = [[Title alloc]initWithDictionary:[dictionary valueForKey:@"title"]];
        _photoDescription = [[PhotoDescription alloc] initWithDictionary:[dictionary valueForKey:@"description"]];
        _visibility = [[Visibility alloc] initWithDictionary:[dictionary valueForKey:@"visibility"]];
        _dates = [[Dates alloc]initWithDictionary:[dictionary valueForKey:@"dates"]];
        _views = [dictionary valueForKey:@"views"];
        _editability =[[Editability alloc]initWithDictionary:[dictionary valueForKey:@"editability"]];
        _publiceditability = [[Publiceditability alloc]initWithDictionary:[dictionary valueForKey:@"publiceditability"]];
        _usage = [[Usage alloc]initWithDictionary:[dictionary valueForKey:@"usage"]];
        _comments = [[CommentsModel alloc]initWithDictionary:[dictionary valueForKey:@"comments"]];
        _notes = [[Notes alloc]initWithDictionary:[dictionary valueForKey:@"notes"]];
        _people = [[People alloc]initWithDictionary:[dictionary valueForKey:@"people"]];
        _tags = [[PhotoTagsModel alloc]initWithDictionary:[dictionary valueForKey:@"tags"]];
        _location = [[Location alloc]initWithDictionary:[dictionary valueForKey:@"location"]];
        _geoperms = [[Geoperms alloc]initWithDictionary:[dictionary valueForKey:@"geoperms"]];
        _urls = [[Urls alloc]initWithDictionary:[dictionary valueForKey:@"urls"]];
        _media = [dictionary valueForKey:@"media"];
    }
    return self;
}

@end
