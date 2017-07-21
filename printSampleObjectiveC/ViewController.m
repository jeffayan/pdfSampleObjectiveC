//
//  ViewController.m
//  printSampleObjectiveC
//
//  Created by Developer on 21/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://stackoverflow.com/questions/26883816/open-pdf-file-using-swift"];
    
    [_webView loadRequest: [NSURLRequest requestWithURL:url]];

    
}

- (IBAction)getPdf:(id)sender {
    
    
    UIPrintPageRenderer *render = [[UIPrintPageRenderer alloc] init];
    
    CGRect page = CGRectMake(0, 0, 500, 800);
    
    [render setValue:[NSValue valueWithCGRect:page] forKey:@"paperRect"];
    
    
    NSMutableData *pdfData = [[NSMutableData alloc] init];
    
    UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil);
    
    
    UIGraphicsBeginPDFPage();
    
    
    [[[self webView] layer] renderInContext: UIGraphicsGetCurrentContext()];
    
    
    UIGraphicsEndPDFContext();
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    
    NSString *filePath = [path stringByAppendingString:@"/file.pdf"];
    
    
    [pdfData writeToFile:filePath atomically:YES];
    
    
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    [_webView loadRequest: [NSURLRequest requestWithURL:url]];
    
    
    
}



@end
