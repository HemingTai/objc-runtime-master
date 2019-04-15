//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import "Man.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *a = @"hello";
        NSString *b = [NSString stringWithFormat:@"hello"];
        if (a == b)
        {
            NSLog(@"a == b");
        }
        if ([a isEqualToString:b])
        {
            NSLog(@"a isEqualToString b");
        }
        Man *m = [[Man alloc] init];
        /*__weak的实现原理：全局维护了一份weak_table_t表，该表使用不定类型对象的地址作为key，用 weak_entry_t 类型结构体对象作为 value。其中的 weak_entries 保存了所有指向该对象的weak指针，内部是一个结构体，它负责维护和存储指向一个对象的所有弱引用hash表
         *当该对象被释放时，weak表会找到以该对象地址为key所对应的weak_entries，然后将其中的所有weak指针置为nil，以保证内存的正常回收；
             *struct weak_table_t {
             weak_entry_t *weak_entries;
             size_t    num_entries;              // weak对象的存储空间
             uintptr_t mask;                     //参与判断引用计数辅助量
             uintptr_t max_hash_displacement;    //hash key 最大偏移值
             };
         *
         */
        id __weak m1 = m;
    }
    return 0;
}
