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

@implementation RolloutDynamic(blocks_5)


- (id)blockFor_instanceMethod_Record_CMTimeRange_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_dummy_struct__D5dusVdWOlVyabEzby8G2F77Wtc(id rcv) {
    __rollout_dummy_struct__D5dusVdWOlVyabEzby8G2F77Wtc (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    __block __rollout_dummy_struct__D5dusVdWOlVyabEzby8G2F77Wtc record;
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        record = originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector));
        return [[RolloutTypeWrapper alloc] initWithRecordPointer:&record ofSize:sizeof(__rollout_dummy_struct__D5dusVdWOlVyabEzby8G2F77Wtc) shouldBeFreedInDealloc:NO];
    }];

    return *(__rollout_dummy_struct__D5dusVdWOlVyabEzby8G2F77Wtc *)result.recordPointer;
  };
}

- (id)blockFor_instanceMethod_Void___Record_struct_RolloutSpace_CGSize_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, __rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4 arg0) {
    void (*originalFunction)(id, SEL, __rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg0 ofSize:sizeof(__rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4) shouldBeFreedInDealloc:NO], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), *(__rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4*)((RolloutTypeWrapper*)arguments[0]).recordPointer); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Long___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, id arg0) {
    long (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1) {
    id (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, void* arg2) {
    id (*originalFunction)(id, SEL, id, id, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Record_struct_RolloutSpace_CGPoint___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk(id rcv, id arg0) {
    __rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
]];
    __block __rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk record;
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        record = originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue);
        return [[RolloutTypeWrapper alloc] initWithRecordPointer:&record ofSize:sizeof(__rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk) shouldBeFreedInDealloc:NO];
    }];

    return *(__rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk *)result.recordPointer;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Record_struct_RolloutSpace_CGPoint___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk arg0, id arg1) {
    id (*originalFunction)(id, SEL, __rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg0 ofSize:sizeof(__rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk) shouldBeFreedInDealloc:NO], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), *(__rollout_dummy_struct__IXvVpDhVIAT4DPy7Erk5nSWcznk*)((RolloutTypeWrapper*)arguments[0]).recordPointer, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___Record_struct_RolloutSpace__NSRange_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0 arg1) {
    id (*originalFunction)(id, SEL, id, __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg1 ofSize:sizeof(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0) shouldBeFreedInDealloc:NO], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, *(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0*)((RolloutTypeWrapper*)arguments[1]).recordPointer)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___Enum___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_enum arg0, unsigned long arg1) {
    id (*originalFunction)(id, SEL, __rollout_enum, unsigned long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithULong:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).uLongValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___Record_struct_RolloutSpace__NSRange___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0 arg1, id arg2) {
    id (*originalFunction)(id, SEL, id, __rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg1 ofSize:sizeof(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0) shouldBeFreedInDealloc:NO], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, *(__rollout_dummy_struct__cO1vzwCDUNmksCug6I0KbtE_W_0*)((RolloutTypeWrapper*)arguments[1]).recordPointer, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_ULongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned long long(id rcv) {
    unsigned long long (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithULongLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.uLongLongValue;
  };
}
@end
