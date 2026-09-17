#import <UIKit/UIKit.h>

__attribute__((constructor)) static void HamaVipWelcomeWithLogo() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_main_queue(), ^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (!keyWindow) {
            keyWindow = [[UIApplication sharedApplication].windows firstObject];
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\nHAMA ⚡️ VIP" 
            message:@"ئەم هاکە دروست کراوی چەناڵی HAMA⚡️VIP یە وەک هاوکاریەک ئەگەر جۆینی چەناڵیت نەکردوە.. بیکە بۆ ئەوەی بێبەش نەبی لەهاکی تر😍❤️\n\nجۆین کردنی چەناڵ..." 
            preferredStyle:UIAlertControllerStyleAlert];
            
        // دابینکردنی لۆگۆیەکی بازنەیی لە سەرەوەی پەنجەرەکە
        UIView *customView = alert.view;
        UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(customView.bounds.size.width / 2 - 40, 15, 80, 80)];
        logoView.layer.cornerRadius = 40;
        logoView.layer.masksToBounds = YES;
        logoView.layer.borderWidth = 2.0;
        logoView.layer.borderColor = [UIColor redColor].CGColor;   // چوارچێوەیەکی سور بۆ لۆگۆکە
        
        // خوێندنەوەی وێنەکەی لۆگۆ لە بەندرڵی توەکەکە یان دایلیبەکە
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *imagePath = [bundle pathForResource:@"logo" ofType:@"png"]; // ناوی وێنەکەی لۆگۆکەت
        if (imagePath) {
            logoView.image = [UIImage imageWithContentsOfFile:imagePath];
        }
        
        // ئەگەر وێنەکە لە نەتبووک یان دەشتبەجێ لە ڕێگەیەکی ترە دەتوانە لێرە ببەسترێت
        [customView addSubview:logoView];

        // دوگمەی جۆین کردنی تێلگرام
        UIAlertAction *joinAction = [UIAlertAction actionWithTitle:@"🔗 جۆین کردنی چەناڵ" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/hama_vip1"] options:@{} completionHandler:nil];
        }];
        
        // دوگمەی بەردەوامبوون بۆ چوونە ناو هاکەکە
        UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"🚀 بەردەوام بوون" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            // لێرەدا هاکەکە دەست بە کار دەکات
        }];
        
        [alert addAction:joinAction];
        [alert addAction:continueAction];
        
        [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
