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
        if (a == b) {
            NSLog(@"a == b");
        }
        if ([a isEqualToString:b]) {
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
        NSArray *array1 = @[@{@"key":@"1"}];
        NSArray *array2 = @[@{@"key":@"1"}];
        if ([array1 isEqual:array2]) {
            NSLog(@"array1 isEqual array2");
        } else if ([array1 isEqualToArray:array2]) {
            NSLog(@"array1 isEqualToArray array2");
        } else {
            NSLog(@"array1 not Equal array2");
        }
        NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
        [temp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%lu", (unsigned long)idx);
            [temp removeObjectAtIndex:temp.count-1];
        }];
    }
    return 0;
}
