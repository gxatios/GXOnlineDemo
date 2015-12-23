//
//  DataFilterViewController.m
//  GXOnlineDemo
//
//  Created by gaoxin on 14-3-18.
//  Copyright (c) 2014年 xin gao. All rights reserved.
//

#import "DataFilterViewController.h"

@interface DataFilterViewController ()

@end

@implementation DataFilterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)matchCode
{
    
}

- (void)regularCode
{
    /*
    char *utf8CString = "test;;; test2 what are you doing, now?";
    NSString *regexString = @";";
    NSString *sourceString = [NSString stringWithUTF8String:utf8CString];
    NSString *resultString = [sourceString stringByReplacingOccurrencesOfRegex:regexString withString:@"_"];
    
    NSLog(@"sourceString: \"%@\"", sourceString);
    NSLog(@"resultString: \"%@\"", resultString);
    
    char *utf8CString1 = "Copyright \xC2\xA9 \xE2\x89\x85 2008";
    NSString *regexString1 = @"Copyright (.*) (\\d+)";
    NSString *sourceString1 = [NSString stringWithUTF8String:utf8CString1];
    NSString *resultString1 = [sourceString1 stringByMatching:regexString1 capture:1L];
    
    NSLog(@"sourceString: \"%@\"", sourceString1);
    NSLog(@"resultString: \"%@\"", resultString1);
    
    char *utf8CString2 = "One\t Two \tThree ";
    NSString *source = [NSString stringWithUTF8String:utf8CString2];
    NSString *result = [source stringByReplacingOccurrencesOfRegex:@"\\s+"withString:@" "];
    
    NSLog(source);
    NSLog(result);
    
    NSString *source1 = @"Test;12;Y";
    NSArray *columns = [source1 componentsSeparatedByRegex:@";\\s*"];
    NSLog([columns description]);
    NSString *source2 = @"<foo no=\"12\">Name</foo>";
    NSString *regex2 = @"<foo no=\"(.+?)\">(.*?)</foo>";
    
    int no = [[source2 stringByMatching:regex2 capture:1] intValue];
    NSString *data = [source2 stringByMatching:regex2 capture:2];
    NSLog(@"no: %d data: %@", no, data);
     */
}

- (void)methodOne
{
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"pict", @"blackrain", @"ip", nil];
    NSArray *arrayContents = [NSArray arrayWithObjects:@"I am a picture.", @"I am a guy", @"I am gagaga", @"ipad", @"iphone", nil];
    //     我想过滤arrayContents的话只要循环 arrayFilter就好了
    int i = 0, count = [arrayFilter count];
    for(i = 0; i < count; i ++)
    {
        NSString *arrayItem = (NSString *)[arrayFilter objectAtIndex:i];
        //        NSPredicate *filterPredicate = [[NSPredicate predicateWithFormat:@"SELF CONTAINS %@", arrayItem];
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",arrayItem];
        NSLog(@"Filtered array with filter %@, %@", arrayItem, [arrayContents filteredArrayUsingPredicate:filterPredicate]);
    }
    
}
//
- (void)methodTwo
{
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"abc1", @"abc2", nil];
    NSArray *arrayContent = [NSArray arrayWithObjects:@"a1", @"abc1", @"abc4", @"abc2", nil];
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arrayFilter];
    //    [arrayContent filterUsingPredicate:thePredicate];
    [arrayContent filteredArrayUsingPredicate:thePredicate];
    NSLog(@"arrayFilter %@",arrayFilter);
    NSLog(@"arraycontern %@",[arrayContent filteredArrayUsingPredicate:thePredicate]);
}

- (void)methodThree
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultPath = [[NSBundle mainBundle] resourcePath];
    NSError *error;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:defaultPath error:&error];
    NSLog(@"path --- %@",directoryContents);
}
/*
 match的用法
 NSString *match = @"imagexyz-999.png";
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", match];
 NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
 ﻿2. match里like的用法（类似Sql中的用法）
 NSString *match = @"imagexyz*.png";
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like %@", match];
 NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
 ﻿3. 大小写比较［c］表示忽略大小写，［d］表示忽略重音，可以在一起使用，如下：
 NSString *match = @"imagexyz*.png";
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like[cd] %@", match];
 NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];﻿
 4.使用正则 NSString *match = @"imagexyz-\\d{3}\\.png"; //imagexyz－123.png
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
 NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];﻿
 
 */

@end
