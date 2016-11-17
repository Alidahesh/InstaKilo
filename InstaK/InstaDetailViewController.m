//
//  InstaDetailViewController.m
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//


#import "InstaDetailViewController.h"
#import <UIKit/UIKit.h>
#import "Insta.h"

@interface InstaDetailViewController ()

@end

@implementation InstaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.detailImage) {
        self.detaiImageView.image = self.detailImage.image;
        self.detailImageTitle.text = self.detailImage.imageTitle;
    }
}




@end
