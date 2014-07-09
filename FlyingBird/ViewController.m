//
//  ViewController.m
//  FlyingBird
//
//  Created by bsauniv25 on 20/06/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "Values.h"


@implementation ViewController

-(void)viewDidLoad
{
     [self bird];
    RemoveButton=0;
    self.cellCount = 10;
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
    [self.collectionView reloadData];
    self.collectionView.backgroundColor = [UIColor cyanColor];
   _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_button addTarget:self
               action:@selector(check)
     forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"START" forState:UIControlStateNormal];
    _button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:_button];
    _delObj=[[AppDelegate alloc]init];
    
    _voiceObj=[[voiceViewController alloc]init];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
   
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
   

    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    _values=[_delObj getNumbers];
    Values *modObj=[_values objectAtIndex:indexPath.row];
    [cell.label setText:modObj.numbers];
    
   
    
    
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (randomIndex == tappedCellPath.row) {
            
      
        
        if (tappedCellPath!=nil)
        {
            [_delObj insertNumber:tappedCellPath.row];
            CGRect frameRect = CGRectMake(310, 75, 650, 650);
            _hideView = [[UIView alloc] initWithFrame:frameRect];
            _hideView.backgroundColor=[UIColor clearColor];
            [self.view addSubview:_hideView];

            [self touchesEnded:initialPinchPoint];

            double delayInSeconds = 1.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
                
                
                self.cellCount = self.cellCount - 1;
                [self.collectionView performBatchUpdates:^{
                    [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
                    self.cellCount = self.cellCount + 1;
                    [self.collectionView performBatchUpdates:^{
                        [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
                        NSLog(@"%d",tappedCellPath.row);
                        
                    } completion:nil];
                    
                    
                } completion:nil];
                
                
                
                
            });
            
            
            
        }
        }
        else
        {
            
            UIAlertView *alertUser = [[UIAlertView alloc]initWithTitle:@"Warning !" message:@"Wrong..Try Again" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [alertUser show];

        }
    }
}

-(void)bird
{
    
    _scaleFactor = 2;
    _angle = 0;
  NSArray *imgary=@[@"bird .png",@"bird1.png"];
    NSMutableArray *img=[[NSMutableArray alloc]init];
    for (int i=0; i<imgary.count; i++) {
        [img addObject:[UIImage imageNamed:[imgary objectAtIndex:i]]];
        
    }
   _animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 400, 230, 320)];
    _animationImageView.animationImages = img;
    _animationImageView.animationDuration = 0.3;
    [self.view addSubview:_animationImageView];
    [_animationImageView startAnimating];
    
 /*
    _scaleFactor = 1;
    _angle = 0;
    CGRect frameRect = CGRectMake(80, 500, 230, 320);
    _boxView = [[UIView alloc] initWithFrame:frameRect];
     UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bird.png"]]; 
     [_boxView addSubview:imageView];
    [self.view addSubview:_boxView];
 */

}

-(void)touchesEnded:(CGPoint)intialpoint
{
    [_animationImageView removeFromSuperview];
    CGRect frameRect = CGRectMake(80, 500, 230, 320);
    _boxView = [[UIView alloc] initWithFrame:frameRect];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bird_1.png"]];
    [_boxView addSubview:imageView];
    [self.view addSubview:_boxView];
    CGPoint location = intialpoint;
    
    [UIView animateWithDuration:1.0
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGAffineTransform scaleTrans =
                         CGAffineTransformMakeScale(_scaleFactor, _scaleFactor);
                         
                         CGAffineTransform rotateTrans =
                         CGAffineTransformMakeRotation(_angle * M_PI / 180);
                         
                         _boxView.transform = CGAffineTransformConcat(scaleTrans,
                                                                      rotateTrans);
                         _angle = 0;//(_angle == 180 ? 360 : 180);
                         _scaleFactor = (_scaleFactor == 1 ? 1 : 1);
                         _boxView.center = location;
                         

                     } completion:Nil];
   
    [self performSelector:@selector(animationMid) withObject:nil afterDelay:1.0];

    
    
    
}
-(void)animationMid
{
    CGPoint endlocation;
    endlocation.x=1150.0;
    endlocation.y=0.0;
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGAffineTransform scaleTrans =
                         CGAffineTransformMakeScale(_scaleFactor, _scaleFactor);
                         
                         CGAffineTransform rotateTrans =
                         CGAffineTransformMakeRotation(_angle * M_PI / 180);
                         
                         _boxView.transform = CGAffineTransformConcat(scaleTrans,
                                                                      rotateTrans);
                         _angle = 0;//(_angle == 180 ? 360 : 180);
                         _scaleFactor = (_scaleFactor == 1 ? 1 : 1);
                         _boxView.center = endlocation;
                         
                         
                     } completion:Nil];
    [self performSelector:@selector(animationFinished) withObject:nil afterDelay:2.0];

    
}
-(void)animationFinished {
    [_boxView removeFromSuperview];
    [self bird];
    [_hideView removeFromSuperview];
    [self check];
}
-(void)check
{
    _values=[_delObj getNumbers];
    randomIndex = arc4random() % [_values count];
    Values *modObj=[_values objectAtIndex:(randomIndex)];
   [_voiceObj speak:modObj.numbers];
    
    
    if (RemoveButton==0) {
        [_button removeFromSuperview];
       RemoveButton=1;
    }
    
}


@end
