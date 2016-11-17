//
//  Insta.h
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Insta : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *imageTitle;

- (instancetype)initWithImage:(UIImage *)image andTitle:(NSString *)title;

@end
