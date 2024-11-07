#import "DeviceManager.h"
#include <spawn.h>
#import <sys/sysctl.h>
#import <Foundation/Foundation.h>
#import <FrontBoardServices/FBSSystemService.h>

@implementation DeviceManager

void killall(NSString* processName, BOOL softly)
{
    enumerateProcessesUsingBlock(^(pid_t pid, NSString* executablePath, BOOL* stop)
    {
        if ([executablePath.lastPathComponent isEqualToString:processName])
        {
            if (softly)
            {
                kill(pid, SIGTERM); // 软杀进程
            }
            else
            {
                kill(pid, SIGKILL); // 强制杀进程
            }
        }
    });
}

- (void)respring {
    killall(@"SpringBoard", YES); // 重启 SpringBoard
    exit(0); // 退出应用
}


void enumerateProcessesUsingBlock(void (^enumerator)(pid_t pid, NSString* executablePath, BOOL* stop)) {
    static int maxArgumentSize = 0;
    if (maxArgumentSize == 0) {
        size_t size = sizeof(maxArgumentSize);
        if (sysctl((int[]){ CTL_KERN, KERN_ARGMAX }, 2, &maxArgumentSize, &size, NULL, 0) == -1) {
            perror("sysctl argument size");
            maxArgumentSize = 4096; // 默认大小
        }
    }

    int mib[3] = { CTL_KERN, KERN_PROC, KERN_PROC_ALL };
    struct kinfo_proc *info;
    size_t length;
    int count;

    if (sysctl(mib, 3, NULL, &length, NULL, 0) < 0)
        return;

    if (!(info = malloc(length)))
        return;

    if (sysctl(mib, 3, info, &length, NULL, 0) < 0) {
        free(info);
        return;
    }

    count = length / sizeof(struct kinfo_proc);
    for (int i = 0; i < count; i++) {
        @autoreleasepool {
            pid_t pid = info[i].kp_proc.p_pid;
            if (pid == 0) {
                continue;
            }

            size_t size = maxArgumentSize;
            char* buffer = (char *)malloc(length);
            if (sysctl((int[]){ CTL_KERN, KERN_PROCARGS2, pid }, 3, buffer, &size, NULL, 0) == 0) {
                NSString* executablePath = [NSString stringWithCString:(buffer+sizeof(int)) encoding:NSUTF8StringEncoding];

                BOOL stop = NO;
                enumerator(pid, executablePath, &stop);
                if(stop) {
                    free(buffer);
                    break;
                }
            }
            free(buffer);
        }
    }
    free(info);
}

@end
