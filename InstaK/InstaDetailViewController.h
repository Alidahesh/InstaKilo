//
//  InstaDetailViewController.h
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Insta;


@interface InstaDetailViewController : UIViewController


@property (nonatomic, strong) Insta *detailImage;

@property (weak, nonatomic) IBOutlet UIImageView *detaiImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailImageTitle;


@end
