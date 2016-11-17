//
//  AppDelegate.h
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end

