#import <UIKit/UIKit.h>

__attribute__((constructor)) static void custom_constructor() {
    NSLog(@"[HAMA ⚡️ VIP Universal Dylib] Loaded successfully!");
}
