//
//  Insta.m
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//


#import "Insta.h"

@implementation Insta

- (instancetype)initWithImage:(UIImage *)image andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.image = image;
        self.imageTitle = title;
    }
    return self;
}

@end
