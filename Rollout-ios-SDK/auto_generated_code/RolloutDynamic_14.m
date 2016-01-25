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

@implementation RolloutDynamic(blocks_14)


- (id)blockFor_instanceMethod_Record_struct_RolloutSpace_CGVector_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_dummy_struct__ZssiGLMM9VI_EtRScogFvzRYVIw(id rcv) {
    __rollout_dummy_struct__ZssiGLMM9VI_EtRScogFvzRYVIw (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    __block __rollout_dummy_struct__ZssiGLMM9VI_EtRScogFvzRYVIw record;
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        record = originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector));
        return [[RolloutTypeWrapper alloc] initWithRecordPointer:&record ofSize:sizeof(__rollout_dummy_struct__ZssiGLMM9VI_EtRScogFvzRYVIw) shouldBeFreedInDealloc:NO];
    }];

    return *(__rollout_dummy_struct__ZssiGLMM9VI_EtRScogFvzRYVIw *)result.recordPointer;
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_BOOL___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, void* arg0) {
    BOOL (*originalFunction)(id, SEL, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, long arg1) {
    id (*originalFunction)(id, SEL, id, long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).longValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___Record_struct_RolloutSpace_UIEdgeInsets_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, __rollout_dummy_struct__mSHPEsPe28phFBQPXD5Jz7dF_lI arg0) {
    void (*originalFunction)(id, SEL, __rollout_dummy_struct__mSHPEsPe28phFBQPXD5Jz7dF_lI) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg0 ofSize:sizeof(__rollout_dummy_struct__mSHPEsPe28phFBQPXD5Jz7dF_lI) shouldBeFreedInDealloc:NO], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), *(__rollout_dummy_struct__mSHPEsPe28phFBQPXD5Jz7dF_lI*)((RolloutTypeWrapper*)arguments[0]).recordPointer); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___BOOL___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, BOOL arg0, BOOL arg1) {
    void (*originalFunction)(id, SEL, BOOL, BOOL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithBool:arg0], 
     [[RolloutTypeWrapper alloc] initWithBool:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).boolValue, ((RolloutTypeWrapper*)arguments[1]).boolValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___Pointer___Pointer___Pointer___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, void* arg2, void* arg3, void* arg4, BOOL arg5) {
    void (*originalFunction)(id, SEL, id, id, void*, void*, void*, BOOL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg4], 
     [[RolloutTypeWrapper alloc] initWithBool:arg5], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue, ((RolloutTypeWrapper*)arguments[3]).pointerValue, ((RolloutTypeWrapper*)arguments[4]).pointerValue, ((RolloutTypeWrapper*)arguments[5]).boolValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___Pointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, void* arg2, void* arg3) {
    void (*originalFunction)(id, SEL, id, id, void*, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg3], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue, ((RolloutTypeWrapper*)arguments[3]).pointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___BlockPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2) {
    id (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).blockPointerValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}
@end
