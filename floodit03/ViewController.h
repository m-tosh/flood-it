//
//  ViewController.h
//  floodit03
//
//  Created by ToshiyA on 2013/11/15.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    IBOutlet UIButton *rookie;
    IBOutlet UIButton *easy;
    IBOutlet UIButton *regular;
    IBOutlet UIButton *hard;
    IBOutlet UIButton *htp;
}
- (IBAction)pushrookie:(id)sender;
- (IBAction)pusheasy:(id)sender;
- (IBAction)pushregular:(id)sender;
- (IBAction)pushhard:(id)sender;

@property double height_barance;

@end
