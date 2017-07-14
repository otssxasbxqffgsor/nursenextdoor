//
//  SlidingUIViewServices.m
//  nursenextdoor
//
//  Created by Kian Davoudi-Rad on 2017-06-29.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SlidingUIViewDataModel.h"
#import "SlidingUIViewServices.h"
#import "MainPreviewScreenUIViewInteractionEntity.h"
#import "MasterUIViewCLass.h"
@implementation SlidingUIViewServices:NSObject

bool animationIsInProgress;


#pragma Cunstroctors
- (instancetype)init {
    self = [super init];
    if (self) {

        // init SlidingUIViewDataModel it contains all UIVIews
        _slidingUIViewDataModel = [[SlidingUIViewDataModel alloc]initWithSlidingUIViewDataModel:_slidingUIViewDataModel];

        // this is the class for interaction components: it contains button and gesture
         _mainPreviewScreenUIViewInteractionEntity = [[MainPreviewScreenUIViewInteractionEntity alloc]initWithMainPreviewScreenUIViewInteractionEntityWithModel:_mainPreviewScreenUIViewInteractionEntity];



    }
    return self;
}


//SlidingUIViewDataModel
#pragma Private Members

- (UIView*)ButtonWithTitle {



        UIView *uiBrandFooterView =[[UIView alloc]initWithFrame:CGRectMake(0,0,150,100)];
        uiBrandFooterView.backgroundColor = [UIColor clearColor];

        UIButton *upcomingVisistsButton = [UIButton buttonWithType:UIButtonTypeSystem];
        upcomingVisistsButton.frame = CGRectMake(0,0,150,100);
        upcomingVisistsButton.backgroundColor = [UIColor yellowColor];
        // This shall be localized for various languages
        NSString *UpcomingVisits = [[NSString alloc] initWithFormat:@"upcoming visits"];
        upcomingVisistsButton.userInteractionEnabled = YES;
        [upcomingVisistsButton setTitle:UpcomingVisits forState:UIControlStateNormal];
        [upcomingVisistsButton setTintColor:[UIColor whiteColor]];
        [upcomingVisistsButton addTarget:self  action:@selector(taggleUIViews:) forControlEvents:UIControlEventTouchDown];
        [uiBrandFooterView addSubview:upcomingVisistsButton];
        
        return uiBrandFooterView;
    }
- (instancetype) initWithSlidingUIViewDataModel {

/*
 Author: Kian D.Rad
 Date:   Jun 29th 2017
 ReadMe: This function will initalize three UIVIews, master, left and right. 
        The master contains a function to toggle, and the two will transtiion.
 */


    self = [super init];
    if (self) {

        // init SlidingUIViewDataModel it contains all UIVIews
        //_slidingUIViewDataModel =
        _slidingUIViewDataModel = [[SlidingUIViewDataModel alloc]initWithSlidingUIViewDataModel:nil];

        // this is the class for interaction components: it contains button and gesture
//        _mainPreviewScreenUIViewInteractionEntity = [[MainPreviewScreenUIViewInteractionEntity alloc]initWithMainPreviewScreenUIViewInteractionEntityWithModel:_mainPreviewScreenUIViewInteractionEntity];


//- (instancetype) initWithMainPreviewScreenUIViewInteractionEntityWithModel:(MainPreviewScreenUIViewInteractionEntity*)model AndWithSlidingUIViewDataModel: (SlidingUIViewDataModel*)slidingUIViewDataModel;
        _mainPreviewScreenUIViewInteractionEntity = [[MainPreviewScreenUIViewInteractionEntity alloc]initWithMainPreviewScreenUIViewInteractionEntityWithModel:_mainPreviewScreenUIViewInteractionEntity AndWithSlidingUIViewDataModel:_slidingUIViewDataModel];



        // _masterUIViewCLass.masterUIViewCLass.mainPewviewScreenUIView
        _masterUIViewCLass = [[MasterUIViewCLass alloc] initWithMasterUIViewDataStructureApplicationUIView];

        // this is the main movable UIVIew that moves from a to b
        UIView *test = _masterUIViewCLass.mainPewviewScreenUIView;

        //
        //_slidingUIViewDataModel.templateOfMasterUIView = [UIView alloc];
        [_slidingUIViewDataModel.templateOfMasterUIView insertSubview: _masterUIViewCLass.mainPewviewScreenUIView atIndex:0];
        [_slidingUIViewDataModel.templateOfMasterUIView insertSubview:_mainPreviewScreenUIViewInteractionEntity.bringOnSlidingMenueUIButton atIndex:1];
        

        
    }
    return self;


}




/*
 Author: Kian D.Rad
 Date: July 13th 2017
 README: callBack Functions
 */

//- (void)taggleUIViews:(id)sender {
//
///*
// Author: Kian D.RAd
// Date:   Jun 30th 2017
// README: Here, I only call private methods to perform transition on number of UIVIews, 
//        But, the actual position of X and Y (Coordinates) have been built in more generic 
//        manner, please have a look at those function to change transition direction.
// */
//
//
//
//
//    if (!animationIsInProgress){
//
//
//        // If its running dont do anything waite.
//        animationIsInProgress  = true;
//
//        // Transition sequence
//        [UIView beginAnimations:@"ShowHideView" context:nil];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [UIView setAnimationDuration:0.250];
//        [UIView setAnimationDelegate:self];
//        [UIView setAnimationDidStopSelector:@selector(showHideDidStop:finished:context:)];
//
//        // Make the animatable changes.
//        // _leftUiView.alpha = 1.0;
//        // _rightUiView.alpha = 0.0;
//
//
//        // Transition Direction
//        _rightUiView.frame = CGRectMake(100, 0, 500, 500);
//
//        // Commit the changes and perform the animation.
//        [UIView commitAnimations];
//    }
//    else {
//
//        UIButton * myButton = sender;
//        NSLog(@"did call arrive to taggleUIViews function by UIBotton:[%@], but it did not run!",myButton);
//
//    }
//
//
//}
//- (void)showHideDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
//    /*
//     Author: Kian D.RAd
//     Date:   Jun 30th 2017
//     README: This is a delegate like method that informs me, when the transition or 
//     animation have been completed. So based on this accurately take the next step */
//
//    // Set book value to false, so the progam knows that the transition was finished.
//    // This is for internal use, if you wanna use publicly use, the Objective C method.
//     animationIsInProgress  = false;
//
//    // Test Animation
//    [UIView beginAnimations:@"ShowHideView2" context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//    [UIView setAnimationDuration:0.25];
//    [UIView setAnimationDelay:0.5];
//
//    //    _rightUiView.alpha = 1.0;
//    _rightUiView.frame = CGRectMake(0, 0, 500, 500);
//
//    [UIView commitAnimations];
//
//
//}
//
//
//
//
/*
 Author: Kian D.Rad
 Date: July 13th 2017
 README: Getters and Setter;
 */
- (UIView*) getterMasterUIView{
    /*
     Author: Kian D.Rad
     Date:   July 13th 2017
     ReadMe: Get master UIView, abstraction
     */

    //UIView *t = _slidingUIViewDataModel.masterUIViewClass.mainPewviewScreenUIView;
    return _slidingUIViewDataModel.templateOfMasterUIView;

};

@end
