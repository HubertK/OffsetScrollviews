//
//  HKDetailViewController.m
//  OffsetSlider
//
//  Created by Helene Brooks on 1/5/12.
//  Copyright (c) 2012 vaughn. All rights reserved.
//

#import "HKDetailViewController.h"

@interface HKDetailViewController ()
- (void)configureView;
@end

@implementation HKDetailViewController

@synthesize detailItem = _detailItem;
@synthesize topScrollView = _topScrollView;
@synthesize bottomScrollView = _bottomScrollView;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
   
    self.topScrollView.scrollEnabled = YES;
    self.bottomScrollView.scrollEnabled = YES;
    CGRect labelFrame = CGRectMake(0, 15, 60, 15);
     CGRect labelFrame1 = CGRectMake(20, 132, 280, 65);
    for (int i = 0; i < 10; i++) {
        
        
        
        UILabel *label = [[UILabel alloc]init];
        
        label.frame = labelFrame;
        
        label.text = [NSString stringWithFormat:@"Label:%d",i];
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        [self.topScrollView addSubview:label];
        
        
        UILabel *label1 = [[UILabel alloc]init];
        
        label1.frame = labelFrame1;
        
        label1.text = [NSString stringWithFormat:@"Label:%d",i];
        label1.font = [UIFont systemFontOfSize:70];
        label1.backgroundColor = [UIColor clearColor];
        label1.textAlignment = UITextAlignmentCenter;
        [self.bottomScrollView addSubview:label1];
        labelFrame.origin.x += 120 + 10;
        labelFrame1.origin.x += 320;

    }
    [self.topScrollView setContentSize:CGSizeMake(1300, 45)];
    [self.bottomScrollView setContentSize:CGSizeMake(3200, 372)];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


#pragma mark-UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.bottomScrollView) {
      float bOffset =  self.bottomScrollView.contentOffset.x/2.46153846;
        CGPoint theOffset = CGPointMake(self.bottomScrollView.contentOffset.x, self.topScrollView.contentOffset.y);
        theOffset.x = bOffset;
        
        [self.topScrollView setContentOffset:theOffset animated:NO];
    }
}





- (void)viewDidUnload
{
    [self setTopScrollView:nil];
    [self setBottomScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
