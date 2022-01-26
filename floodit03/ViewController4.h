//
//  ViewController4.h
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

#define MY_BANNER_UNIT_ID   @"ca-app-pub-9150436864073478/2344859346"


@interface ViewController4 : UIViewController {
    IBOutlet UIButton *white;
    IBOutlet UIButton *gray;
    IBOutlet UIButton *brown;
    IBOutlet UIButton *darkbrown;
    IBOutlet UIButton *forest;
    IBOutlet UIButton *black;
    
    GADBannerView *bannerView_;

}

@property(nonatomic ,retain) NSMutableArray *tileArray;

- (IBAction)pushedWhite:(id)sender;
- (IBAction)pushedGray:(id)sender;
- (IBAction)pushedBrown:(id)sender;
- (IBAction)pushedDBrown:(id)sender;
- (IBAction)pushedForest:(id)sender;
- (IBAction)pushedBlack:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *limitNum;

- (IBAction)pushedPause:(id)sender;

@property double height_barance;
@property int limit;
@property int result;


@end
