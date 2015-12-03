//
//  DateViewController.m
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 12/1/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) UIDatePicker *startDatePicker;
@property (strong, nonatomic) UIDatePicker *endDatePicker;

@end

@implementation DateViewController

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItemViewController];
    [self setUpDatePickers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavigationItemViewController {
    [self.navigationItem setTitle:@"Pick Dates"];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)]];
}

- (void)setUpDatePickers {
    self.startDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, CGRectGetWidth(self.view.frame), 200.0)];
    self.startDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.startDatePicker];
    
    self.endDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.startDatePicker.frame.size.height + 20, CGRectGetWidth(self.view.frame), 200)];
    self.endDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.endDatePicker];
}

- (void)doneButtonPressed:(UIBarButtonItem *)sender {
    
    NSDate *startDate = [self.startDatePicker date];
    NSDate *endDate = [self.endDatePicker date];
    
    if ([startDate timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Nope" message:@"You cannot have a start date after your end date" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"I understand" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.startDatePicker.date = [NSDate date];
            self.endDatePicker.date = [NSDate date];
        }];
        
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    
    AvailabilityViewController *availabilityViewController = [[AvailabilityViewController alloc]init];
    
    availabilityViewController.startDate = startDate;
    availabilityViewController.endDate = endDate;
    
    [self.navigationController pushViewController:availabilityViewController animated:YES];
    
}


@end
