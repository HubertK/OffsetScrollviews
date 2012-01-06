//
//  HKDetailViewController.h
//  OffsetSlider
//
//  Created by Helene Brooks on 1/5/12.
//  Copyright (c) 2012 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKDetailViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *bottomScrollView;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
