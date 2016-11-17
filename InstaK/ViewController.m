//
//  ViewController.m
//  InstaKilo
//
//  Created by Ali Dahesh on 2016-11-16.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//


#import "ViewController.h"
#import "InstaCollectionViewCell.h"
#import "InstaCollectionReusableView.h"
#import "InstaDetailViewController.h"
#import "Insta.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *imageObjects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // data source for testing
    Insta *obj1 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"1"] andTitle:@"Tree"];
    Insta *obj2 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"2"] andTitle:@"RED"];
    Insta *obj3 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"3"] andTitle:@"Borna 1"];
    Insta *obj4 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"4"] andTitle:@"Ali"];
    Insta *obj5 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"5"] andTitle:@"Ball"];
    Insta *obj6 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"6"] andTitle:@"Dad"];
    Insta *obj7 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"7"] andTitle:@"Lion"];
    Insta *obj8 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"8"] andTitle:@"Borna 2"];
    Insta *obj9 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"9"] andTitle:@"Borna 3"];
    Insta *obj10 = [[Insta alloc] initWithImage:[UIImage imageNamed:@"10"] andTitle:@"Borna 4"];

    
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:obj1, obj2, obj4, nil];
    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:obj2, obj3, obj5, nil];
    NSMutableArray *section3 = [NSMutableArray arrayWithObjects:obj6, obj7, obj8, nil];
    NSMutableArray *section4 = [NSMutableArray arrayWithObjects:obj9, obj10, nil, nil];
    self.imageObjects = [NSMutableArray arrayWithObjects:section1, section2, section3, section4,nil];
    
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteCell:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    doubleTapGesture.delaysTouchesBegan = YES;
    [self.collectionView addGestureRecognizer:doubleTapGesture];
    
}


- (void)deleteCell:(UITapGestureRecognizer *)gesture {
    
    NSLog(@"double tap");
    
}


#pragma mark - UICollectionView data source methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *sectionArray = [self.imageObjects objectAtIndex:section];
    return sectionArray.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.imageObjects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InstaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSArray *sectionArray = self.imageObjects[indexPath.section];
    //NSString *imagePath = sectionArray[indexPath.row];
    //cell.instaImageView.image = [UIImage imageNamed:imagePath];
    
    Insta *currentInsta = sectionArray[indexPath.row];
    cell.instaImageView.image = currentInsta.image;
    cell.instaImageTitle.text = currentInsta.imageTitle;
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [[UICollectionReusableView alloc] init];
    if (kind == UICollectionElementKindSectionHeader) {
        InstaCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
        header.headerLabel.text = [NSString stringWithFormat:@"Section: %i", (int)indexPath.section + 1];
        headerView = header;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        InstaCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"sectionFooter" forIndexPath:indexPath];
            headerView = footer;
    }
    return headerView;
}




#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showImageDetail"]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        NSArray *sectionArray = self.imageObjects[indexPath.section];
        Insta *detailInsta = sectionArray[indexPath.row];
        [[segue destinationViewController] setDetailImage:detailInsta];
    }
}



@end
