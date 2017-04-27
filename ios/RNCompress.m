
#import "RNCompress.h"
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAsset.h>

@implementation RNCompress

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(compressVideo:(NSString *)filePath byQuality:(NSString*)compressQuality resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    @try {
        filePath = [filePath stringByReplacingOccurrencesOfString:@"file://"
                                                       withString:@""];
        NSString *preset = nil;
        if (compressQuality == nil || [compressQuality isEqualToString:@"medium"]) {
            preset = AVAssetExportPresetMediumQuality;
        } else if ([compressQuality isEqualToString:@"high"]) {
            preset = AVAssetExportPresetHighestQuality;
        } else if ([compressQuality isEqualToString:@"low"]) {
            preset = AVAssetExportPresetLowQuality;
        } else {
            preset = AVAssetExportPresetMediumQuality;
        }
        
        // save to temp directory
        NSString* tempDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                                       NSUserDomainMask,
                                                                       YES) lastObject];
        NSString *outputFilePath = [tempDirectory stringByAppendingPathComponent: [NSString stringWithFormat:@"%@.mp4", [[NSProcessInfo processInfo] globallyUniqueString]]];
        
        NSURL* inputURL = [NSURL fileURLWithPath:filePath];
        NSURL* outputURL = [NSURL fileURLWithPath:outputFilePath];
        
        [[NSFileManager defaultManager] removeItemAtURL:outputURL error:nil];
        AVURLAsset *asset = [AVURLAsset URLAssetWithURL:inputURL options:nil];
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:asset presetName:preset];
        exportSession.shouldOptimizeForNetworkUse = YES;
        exportSession.outputURL = outputURL;
        exportSession.outputFileType = AVFileTypeMPEG4;
        
        [exportSession exportAsynchronouslyWithCompletionHandler:^(void) {
            if (exportSession.status == AVAssetExportSessionStatusCompleted)
            {
                if (resolve)
                    resolve(@{ @"path": outputFilePath });
            }
            else
            {
                if (reject) reject(@"Cannot compress video", nil, nil);
            }
        }];
    } @catch(NSException *e) {
        reject(e.reason, nil, nil);
    }
}

@end
  
