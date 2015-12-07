//
//  ViewController.m
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 11/30/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "ViewController.h"
#import "HotelsViewController.h"
#import "DateViewController.h"
#import "LookUpViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    [self setupCustomLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Guest"];
    
    NSArray *guests = [context executeFetchRequest:request error:nil];
    
    NSLog(@"%li", guests.count);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupViewController {
    [self.navigationItem setTitle:@"HtlMngr"];
}

- (void)setupCustomLayout {
    
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *bookButton = [[UIButton alloc]init];
    UIButton *lookupButton = [[UIButton alloc]init];
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Lookup" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.1 blue:0.25 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:0.1 green:0.25 blue:1.0 alpha:1.0]];
    
    [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lookupButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *browseButtonLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *browseButtonTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:64.0];
    NSLayoutConstraint *browseButtonTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookButtonLeading = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bookButtonCenterY= [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:navigationBarHeight / 1.4];
    NSLayoutConstraint *bookButtonTrailing = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupButtonLeading = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonBottom = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonTrailing = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    

    NSLayoutConstraint *bookButtonHeight = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0.0];
    NSLayoutConstraint *browseButtonHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:bookButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *lookupButtonHeight = [NSLayoutConstraint constraintWithItem:lookupButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:bookButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    [self.view addSubview:browseButton];
    [self.view addSubview:bookButton];
    [self.view addSubview:lookupButton];
    
    browseButtonLeading.active = YES;
    browseButtonTop.active = YES;
    browseButtonTrailing.active = YES;
    
    bookButtonLeading.active = YES;
    bookButtonCenterY.active = YES;
    bookButtonTrailing.active = YES;
    
    lookupButtonLeading.active = YES;
    lookupButtonBottom.active = YES;
    lookupButtonTrailing.active = YES;
    
    bookButtonHeight.active = YES;
    browseButtonHeight.active = YES;
    lookupButtonHeight.active = YES;
    
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)browseButtonSelected:(UIButton *)sender {
    [self.navigationController pushViewController:[[HotelsViewController alloc]init] animated:YES];
}

- (void)bookButtonSelected:(UIButton *)sender {
    [self.navigationController pushViewController:[[DateViewController alloc]init] animated:YES];
}

- (void)lookupButtonSelected:(UIButton *)sender {
    [self.navigationController pushViewController:[[LookUpViewController alloc]init] animated:YES];
}

@end