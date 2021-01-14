//
//  FirstViewController.m
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 25.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void) changeViewColor {
    
   // self.view.backgroundColor = [UIColor darkGrayColor] ? [UIColor darkGrayColor] : [UIColor greenColor];
    self.view.backgroundColor = [UIColor darkGrayColor];
}
- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    
    UIView *myRedView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 30, self.view.frame.origin.y + 50, 200, 110)];
    myRedView.backgroundColor = [UIColor redColor];
    [self.view addSubview: myRedView];
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 190, 40)];
    myLabel.backgroundColor = [UIColor yellowColor];
    myLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
    myLabel.textColor = [UIColor darkGrayColor];
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.text = @"Hello, World!";
    [myRedView addSubview: myLabel];
    
    UIButton *myButton = [[UIButton alloc] initWithFrame: CGRectMake(5, 50, 190, 20)];
    [myButton setTitle:@"Press me" forState:UIControlStateNormal];
    myButton.backgroundColor = [UIColor blueColor];
    myButton.tintColor = [UIColor grayColor];
    [myButton addTarget:self action:@selector(changeViewColor) forControlEvents:UIControlEventTouchUpInside];
    [myRedView addSubview: myButton];
    
    UITextField *myTextField = [[UITextField alloc] initWithFrame: CGRectMake(5, 75, 190, 30)];
    myTextField.placeholder = @"Placeholder";
    myTextField.backgroundColor = [UIColor whiteColor];
    myTextField.textAlignment = NSTextAlignmentCenter;
    [myRedView addSubview:myTextField];
    
    UITextView *myTextView = [[UITextView alloc] initWithFrame:CGRectMake(myRedView.frame.origin.x , myRedView.frame.origin.y + myRedView.frame.size.height + 5, myRedView.frame.size.width, 300)];
    myTextView.backgroundColor = [UIColor yellowColor];
    myTextView.text = @"UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.";
    myTextView.textAlignment = NSTextAlignmentCenter;
    myTextView.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightBold];
    [self.view addSubview: myTextView];
    
    UISegmentedControl *mySegmentControl = [[UISegmentedControl alloc] initWithItems:@[@"First", @"Second"]];
    mySegmentControl.frame = CGRectMake(myTextView.frame.origin.x, myTextView.frame.origin.y + myTextView.frame.size.height + 5, 200, 30);
    mySegmentControl.backgroundColor = [UIColor whiteColor];
   // UISegmentedControl *mySegmentControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(myTextView.frame.origin.x, myTextView.frame.origin.y + myTextView.frame.size.height + 5, 200, 15)];
    //mySegmentControl.numberOfSegments == 3;
    mySegmentControl.selectedSegmentIndex = 1;
    mySegmentControl.selectedSegmentTintColor = [UIColor greenColor];
//    [mySegmentControl setTitle:@"First" forSegmentAtIndex:0];
//    [mySegmentControl setTitle:@"Second" forSegmentAtIndex:1];
//    [mySegmentControl setTitle:@"Thurd" forSegmentAtIndex:2];
    [self.view addSubview:mySegmentControl];
    
    UISlider *mySlider = [[UISlider alloc] initWithFrame:CGRectMake(myTextView.frame.origin.x, myTextView.frame.origin.y + myTextView.frame.size.height + 5, myTextView.frame.size.width, 30)];
    mySlider.backgroundColor = [UIColor whiteColor];
    mySlider.value = 0.5;
    [self.view addSubview: mySlider];
    
    UIActivityIndicatorView *myActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    myActivityIndicator.frame = CGRectMake(mySlider.frame.origin.x, mySlider.frame.origin.y + mySlider.frame.size.height + 5, 200, 30);
    myActivityIndicator.backgroundColor = [UIColor yellowColor];
    [myActivityIndicator startAnimating];
    [self.view addSubview: myActivityIndicator];
    
    UIProgressView *myProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    myProgressView.frame = CGRectMake(myActivityIndicator.frame.origin.x, myActivityIndicator.frame.origin.y + myActivityIndicator.frame.size.height + 5, 200, 30);
    myProgressView.backgroundColor = [UIColor yellowColor];
    myProgressView.tintColor = [UIColor blueColor];
    myProgressView.progress = 0.5;
    [self.view addSubview: myProgressView];
    
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(myProgressView.frame.origin.x, myProgressView.frame.origin.y + myProgressView.frame.size.height + 5, 200, 90)];
    myImage.image = [UIImage imageNamed: @"IMG_0989"];
    myImage.contentMode = UIViewContentModeScaleAspectFit;
    myImage.backgroundColor = [UIColor systemYellowColor];
    [self.view addSubview:myImage];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
