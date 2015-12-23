
//
//  CodeBlockViewController.m
//  GXOnlineDemo
//
//  Created by xin gao on 14-2-27.
//  Copyright (c) 2014年 xin gao. All rights reserved.
//

#import "CodeBlockViewController.h"

@interface CodeBlockViewController ()
{
}
@property (assign) NSInteger memberVariable;
@end

@implementation CodeBlockViewController

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
    self.title = @"Block";
    /*
//    int (^maxBlock)(int, int) = ^(int x, int y) { return x > y ? x : y; };
//    常来说，block都是一些简短代码片段的封装，适用作工作单元，通常用来做并发任务、遍历、以及回调。
    block的几种适用场合：
    
    任务完成时回调处理
    消息监听回调处理
    错误回调处理
    枚举回调
    视图动画、变换
    排序
    */
    // block 其实也是一个 NSObject 对象，并且在大多数情况下，block 是分配在栈上面的，只有当 block 被定义为全局变量或 block 块中没有引用任何 automatic 变量时，block 才分配在全局数据段上。 __block 变量也是分配在栈上面的。

}


/*
 
 4，block 内存管理分析
 
 block 其实也是一个 NSObject 对象，并且在大多数情况下，block 是分配在栈上面的，只有当 block 被定义为全局变量或 block 块中没有引用任何 automatic 变量时，block 才分配在全局数据段上。 __block 变量也是分配在栈上面的。
 
 在 ARC 下，编译器会自动检测为我们处理了 block 的大部分内存管理，但当将 block 当作方法参数时候，编译器不会自动检测，需要我们手动拷贝该 block 对象。幸运的是，Cocoa 库中的大部分名称中包含”usingBlock“的接口以及 GCD 接口在其接口内部已经进行了拷贝操作，不需要我们再手动处理了。但除此之外的情况，就需要我们手动干预了。
 http://blog.csdn.net/kesalin/article/details/8870578
 执行上面的代码中，在调用 testManageBlockMemory 时，程序会 crash 掉。因为从 getBlockArray 返回的 block 是分配在 stack 上的，但超出了定义 block 所在的作用域，block 就不在了。正确的做法（被屏蔽的那段代码）是在将 block 添加到 NSArray 中时先 copy 到 heap 上，这样就可以在之后的使用中正常访问。
 
 在 ARC 下，对 block 变量进行 copy 始终是安全的，无论它是在栈上，还是全局数据段，还是已经拷贝到堆上。对栈上的 block 进行 copy 是将它拷贝到堆上；对全局数据段中的 block 进行 copy 不会有任何作用；对堆上的 block 进行 copy 只是增加它的引用记数。
 
 如果栈上的 block 中引用了__block 类型的变量，在将该 block 拷贝到堆上时也会将 __block 变量拷贝到堆上如果该 __block 变量在堆上还没有对应的拷贝的话，否则就增加堆上对应的拷贝的引用记数。
 
 http://blog.csdn.net/kesalin/article/details/6721481  多线程与block
 */
@end
