//
//  GoogleController.m
//  nursenextdoor
//
//  Created by Kian Davoudi-Rad on 2017-06-15.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoogleController.h"
#import "Firebase.h"
#import "GoogleViewManager.h"

@interface GoogleController ()
@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@property(strong, nonatomic) GoogleViewManager* googleViewManager;
@end

@implementation GoogleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Google Controller was loaded");

    // manage and build view
    _googleViewManager = [[GoogleViewManager alloc] init];
    [self.view addSubview:_googleViewManager.initializetWithGIDSignInButton];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Notifies the view controller that its view is about to be added to a view hierarchy.
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // [START auth_listener]
    self.handle = [[FIRAuth auth]
                   addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user) {
                       // [START_EXCLUDE]
                       NSLog(@" user = %@", user);
                       // [END_EXCLUDE]
                   }];
    // [END auth_listener]
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // [START remove_auth_listener]
    [[FIRAuth auth] removeAuthStateDidChangeListener:_handle];
    // [END remove_auth_listener]
}

// Notifies the view controller that its view is about to be added to a view hierarchy.
- (void)viewDidDisappear:(BOOL)animated{
}

// Notifies the view controller that its view was added to a view hierarchy.
- (void)viewDidAppear:(BOOL)animated{
}
@end
