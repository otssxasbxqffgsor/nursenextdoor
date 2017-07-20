//
//  SlidingUIViewServices.h
//  nursenextdoor
//
//  Created by Kian Davoudi-Rad on 2017-06-29.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#ifndef SlidingUIViewServices_h
#define SlidingUIViewServices_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SlidingUIViewDataModel.h"
#import "MainPreviewScreenUIViewInteractionEntity.h"
#import "MasterUIViewCLass.h"
@class SlidingUIViewServices;

@interface SlidingUIViewServices : NSObject

//@property(nonatomic, strong) UIView* leftUiView;
//@property(nonatomic, strong) UIView* rightUiView;
//@property(nonatomic, strong) UIView* masterUIView;
//@property(nonatomic, strong)UIButton *mainButton;
//@property(nonatomic, strong) NSMutableArray* leftUiViewTableView;


@property (nonatomic, strong) MasterUIViewCLass* masterUIViewCLass;

@property (nonatomic, strong) SlidingUIViewDataModel* slidingUIViewDataModel;
// These are buttons
@property (nonatomic, strong) MainPreviewScreenUIViewInteractionEntity *mainPreviewScreenUIViewInteractionEntity;
// This is the low level bar
@property (nonatomic, strong) UIViewNNDBar *uIViewNNDBar;



- (instancetype) init;
- (instancetype) buildMasterUiViewEntryPointToTheClass;
- (UIView*) getterMasterUIView; 
- (instancetype) initWithSlidingUIViewDataModel ;
@end

#endif /* SlidingUIViewServices_h */
