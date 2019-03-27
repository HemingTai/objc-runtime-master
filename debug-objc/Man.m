//
//  Man.m
//  RTDemo
//
//  Created by Hem1ngTai on 2019/3/7.
//

#import "Man.h"
#import "TestObj.h"
#import <objc/runtime.h>

@implementation Man

- (instancetype)init
{
    if(self = [super init])
    {
        //如果对应类实现了class方法，则返回方法中设置的类，如果未实现则沿着继承链中查找class方法的实现，以下两个输出结果都是Man，是因为当前类和父类都没有实现class方法，所以查找继承链中的class方法，NSObject类实现了这个方法，底层中都是找object_getClass(self)返回的类对象isa指针，所以结果一样
        NSLog(@"self class----%@",[self class]);
        NSLog(@"super class----%@",[super class]);
        
        /**********object_getClass(obj)与[obj class]的区别***********************
         *在Object-C的类型结构中，有几个比较重要的概念：Object（实例），Class（类）,
         *Metaclass（元类），Rootclass(根类)，Rootclass‘s metaclass(根元类)，
         *且这些都是对象，因此标题中的obj这个对象可以是上面五个概念的任意一个，需要一一探讨
         ***********************************************************************/
        //1、obj为实例对象，object_getClass(obj)与[obj class]输出结果一致，均获得isa指针，即指向类对象的指针
        TestObj *obj = [[TestObj alloc] init];
        
        Class cls = object_getClass(obj);
        Class cls2 = [obj class];
        NSLog(@"cls == %p, cls2 == %p", cls, cls2);
        
        //2、obj为类对象，object_getClass(obj)返回类对象中的isa指针，即指向元类对象的指针；[obj class]返回的则是其本身
        Class classObj = [obj class];
        
        Class cls3 = object_getClass(classObj);
        Class cls4 = [classObj class];
        NSLog(@"cls3 == %p, cls4 == %p", cls3, cls4);
        
        //3、obj为元类对象，object_getClass(obj)返回元类对象中的isa指针，因为元类对象的isa指针指向根类，所以返回的是根类对象的地址指针；[obj class]返回的则是其本身
        Class metaClassObj = object_getClass(classObj);
        
        Class cls5 = object_getClass(metaClassObj);
        Class cls6 = [metaClassObj class];
        NSLog(@"cls5 == %p, cls6 == %p", cls5, cls6);
        
        //4、当obj为根类对象时，object_getClass(obj)返回根类对象中的isa指针，因为跟类对象的isa指针指向Rootclass‘s metaclass(根元类)，即返回的是根元类的地址指针；[obj class]返回的则是其本身。因为根类的isa指针其实是指向本身的，所有根元类其实就是根类，所有输出的结果是一样的
        Class rootClassObj = object_getClass(metaClassObj);
        
        Class cls7 = object_getClass(rootClassObj);
        Class cls8 = [rootClassObj class];
        NSLog(@"cls7 == %p, cls8 == %p", cls7, cls8);
        
        //当类对象调用时，底层中是通过for循环对比object_getClass获得的元类与类对象是否相等而得出结果 0
        NSLog(@"class kind ---- %d",[[Man class] isKindOfClass:[Man class]]);
        //当类对象调用时，底层中是通过对比object_getClass获得的元类与类对象是否相等而得出结果 0
        NSLog(@"class member ---- %d",[[Man class] isMemberOfClass:[Man class]]);
        //当实例对象调用时，底层中是通过for循环对比[self class]获得的类对象与类对象是否相等而得出结果 1
        NSLog(@"instance kind ---- %d",[self isKindOfClass:[Man class]]);
        //当实例对象调用时，底层中是通过对比[self class]获得的类对象与类对象是否相等而得出结果 1
        NSLog(@"instance member ---- %d",[self isMemberOfClass:[Man class]]);
        //当根类对象调用时，底层中是通过for循环先对比object_getClass获得的根元类与根类对象不相等，然后获取根元类的父类即根类本身再和根类做对比从而得出结果 1
        NSLog(@"rootClass kind ---- %d",[[NSObject class] isKindOfClass:[NSObject class]]);
        //当根类对象调用时，底层中是通过对比object_getClass获得的根元类与类对象是否相等而得出结果 0
        NSLog(@"rootClass member ---- %d",[[NSObject class] isMemberOfClass:[NSObject class]]);
    }
    return self;
}

//- (Class)class{
//    const char *name = "Man";
//    return objc_getClass(name);
//}

@end
