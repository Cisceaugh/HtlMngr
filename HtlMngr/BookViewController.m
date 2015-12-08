//
//  BookViewController.m
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 12/2/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "BookViewController.h"
#import "NSObject+NSManagedObjectContext_Category.h"

@interface BookViewController ()

@property (strong, nonatomic) UITextField *nameField;

@end

@implementation BookViewController

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBookViewController];
    [self setUpMessageLabel];
    [self setUpNameField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpBookViewController {
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)]];
}

- (void)setUpMessageLabel {
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    messageLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %i, From: %@ - To: %@", self.room.hotel.name, self.room.number.intValue, [NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle], [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    [self.view addSubview:messageLabel];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    leading.active = YES;
    centerY.active = YES;
    trailing.active = YES;
}

- (void)setUpNameField {
    self.nameField = [[UITextField alloc]init];
    self.nameField.placeholder = @"input name and last name with one space in between";
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameField.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:self.nameField];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:84.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    
    [self.nameField becomeFirstResponder];
}

- (void)saveButtonPressed:(UIBarButtonItem *)sender {
    
    Reservation *reservation = [Reservation reservationWithStartDate:[NSDate date] endDate:self.endDate room:self.room];
    self.room.reservation = reservation;
    
    reservation.guest = [Guest guestWithName:self.nameField.text];
    
    NSError *saveError;
    [[NSManagedObjectContext managerContext] save:&saveError];
    
    if (saveError) {
        NSLog(@"Save error is %@", saveError);
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
