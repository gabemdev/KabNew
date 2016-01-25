// This file is auto generated by Rollout.io SDK during application build process, it should be committed to you repository as part of your code. For more info please checkout the FAQ at http://support.rollout.io

#import <Rollout/private/RolloutDynamic.h>
#import <Rollout/private/RolloutInvocation.h>
#import <Rollout/private/RolloutTypeWrapper.h>
#import <Rollout/private/RolloutInvocationsListFactory.h>
#import <Rollout/private/RolloutErrors.h>
#import <Rollout/private/RolloutMethodId.h>
#import <Rollout/private/RolloutTweakId.h>
#import <Rollout/private/RolloutConfiguration.h>
#import <Rollout/private/RolloutInvocationContext.h>
#import <objc/objc.h>

#import "RolloutDynamic_structs.h"

@implementation RolloutDynamic(blocks_6)


- (id)blockFor_instanceMethod_Record_struct_RolloutSpace__NSRange_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0(id rcv) {
    __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0 (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    __block __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0 record;
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        record = originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector));
        return [[RolloutTypeWrapper alloc] initWithRecordPointer:&record ofSize:sizeof(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0) shouldBeFreedInDealloc:NO];
    }];

    return *(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0 *)result.recordPointer;
  };
}

- (id)blockFor_instanceMethod_Int_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^int(id rcv) {
    int (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithInt:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.intValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___Pointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, void* arg1, void* arg2) {
    id (*originalFunction)(id, SEL, id, void*, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, BOOL arg1) {
    id (*originalFunction)(id, SEL, id, BOOL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithBool:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).boolValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___BlockPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2, id arg3, id arg4) {
    id (*originalFunction)(id, SEL, id, id, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg4], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue, ((RolloutTypeWrapper*)arguments[4]).blockPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___BlockPointer___BlockPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2, id arg3, id arg4) {
    id (*originalFunction)(id, SEL, id, id, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg4], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue, ((RolloutTypeWrapper*)arguments[4]).blockPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___CGFloat_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, CGFloat arg0) {
    id (*originalFunction)(id, SEL, CGFloat) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithDouble:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).doubleValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___Enum___BOOL___BOOL___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, __rollout_enum arg0, BOOL arg1, BOOL arg2, id arg3) {
    void (*originalFunction)(id, SEL, __rollout_enum, BOOL, BOOL, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithBool:arg1], 
     [[RolloutTypeWrapper alloc] initWithBool:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).boolValue, ((RolloutTypeWrapper*)arguments[2]).boolValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Long___ObjCObjectPointer___Pointer___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, id arg0, void* arg1, unsigned long arg2) {
    long (*originalFunction)(id, SEL, id, void*, unsigned long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithULong:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue, ((RolloutTypeWrapper*)arguments[2]).uLongValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___LongLong___LongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, long long arg2, long long arg3) {
    void (*originalFunction)(id, SEL, id, id, long long, long long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithLongLong:arg2], 
     [[RolloutTypeWrapper alloc] initWithLongLong:arg3], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).longLongValue, ((RolloutTypeWrapper*)arguments[3]).longLongValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
