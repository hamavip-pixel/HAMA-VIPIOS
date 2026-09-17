#import <UIKit/UIKit.h>

__attribute__((constructor)) static void HamaVipWelcome() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_main_queue(), ^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (!keyWindow) {
            keyWindow = [[UIApplication sharedApplication].windows firstObject];
        }
        
        // دروستکردنی سەرەکی پەنجەرەکە (Alert)
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"HAMA ⚡️ VIP" 
            message:@"ئەم هاکە دروست کراوی چەناڵی HAMA⚡️VIP یە وەک هاوکاریەک ئەگەر جۆینی چەناڵیت نەکردوە.. بیکە بۆ ئەوەی بێبەش نەبی لەهاکی تر😍❤️" 
            preferredStyle:UIAlertControllerStyleAlert];
            
        // دوگمەی جۆین کردنی چەناڵ
        UIAlertAction *joinAction = [UIAlertAction actionWithTitle:@"جۆین کردنی چەناڵ 🔗" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/hama_vip1"] options:@{} completionHandler:nil];
            // دووبارە نیشاندانەوەی پەنجەرەکە تاوەکو بتنۆرێت دوگمەی بەردەوامبوون بگرێت
            [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }];
        
        // دوگمەی بەردەوام بوون (بۆ کردنەوەی هاکەکە)
        UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"بەردەوام بوون 🚀" style:UIAlertActionStyleCancel handler:^(BOOL action) {
            // لێرەدا هاکەکە دەست بە کار دەکات
        }];
        
        [alert addAction:joinAction];
        [alert addAction:continueAction];
        
        [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
