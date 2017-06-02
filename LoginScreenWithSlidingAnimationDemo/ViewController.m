//
//  ViewController.m
//  LoginScreenWithSlidingAnimationDemo
//
//  Created by WebsoftProfession on 7/25/16.
//   WebsoftProfession. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *imgArray;
    NSTimer *timer;
    NSUInteger imageIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imgArray=[[NSArray alloc] initWithObjects:[UIImage imageNamed:@"img1.jpg"],[UIImage imageNamed:@"img2.jpg"],[UIImage imageNamed:@"img3.jpg"], nil];
    //imageIndex=1;
    pageControl.numberOfPages=imgArray.count;
    pageControl.currentPage=imageIndex;
    timer=[NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateImageIndex:) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)updateImageIndex:(NSTimer *)timerObject
{
    CATransition *transition=[CATransition animation];
    transition.type=kCATransitionPush;
    transition.subtype=kCATransitionFromRight;
    //transition.subtype=kCATransitionFade;
    transition.duration=0.5;
    
    [slideImageView.layer addAnimation:transition forKey:nil];
    
    if (imageIndex<imgArray.count-1) {
        
        imageIndex++;
        slideImageView.image=[imgArray objectAtIndex:imageIndex];
        pageControl.currentPage=imageIndex;
        
        
    }
    else
    {
        imageIndex=0;
        slideImageView.image=[imgArray objectAtIndex:imageIndex];
        pageControl.currentPage=imageIndex;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
