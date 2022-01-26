//
//  ViewController1.h
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

#define MY_BANNER_UNIT_ID   @"ca-app-pub-9150436864073478/2344859346"

@interface ViewController1 : UIViewController {
    
    IBOutlet UIButton *red;
    IBOutlet UIButton *blue;
    IBOutlet UIButton *yellow;
    
    GADBannerView *bannerView_;
}

@property(nonatomic, retain) NSMutableArray *tileArray;

- (IBAction)PRED:(id)sender;
- (IBAction)PYELLOW:(id)sender;
- (IBAction)PBLUE:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *limitNum;

- (IBAction)pause:(id)sender;

@property double height_barance;
@property int limit;
@property int result;


@end
