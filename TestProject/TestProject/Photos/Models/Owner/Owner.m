//
//  Owner.m
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "Owner.h"

@implementation Owner

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _nsid = [dictionary valueForKey:@"nsid"];
        _username = [dictionary valueForKey:@"username"];
        _realname = [dictionary valueForKey:@"realname"];
        _location = [dictionary valueForKey:@"location"];
        _iconserver = [dictionary valueForKey:@"iconserver"];
        _iconfarm =[dictionary valueForKey:@"iconfarm"];
        _pathAlias = [dictionary valueForKey:@"path_alias"];
    }
    return self;
}

@end


