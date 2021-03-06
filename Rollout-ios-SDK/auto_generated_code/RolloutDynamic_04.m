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

@implementation RolloutDynamic(blocks_4)


- (id)blockFor_instanceMethod_BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv) {
    BOOL (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_classMethod_ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned long(id rcv) {
    unsigned long (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithULong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.uLongValue;
  };
}

- (id)blockFor_instanceMethod_Void___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, BOOL arg0) {
    void (*originalFunction)(id, SEL, BOOL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithBool:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).boolValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___BlockPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2, id arg3, void* arg4) {
    id (*originalFunction)(id, SEL, id, id, id, id, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg4], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue, ((RolloutTypeWrapper*)arguments[4]).pointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Enum_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_enum arg0) {
    id (*originalFunction)(id, SEL, __rollout_enum) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___Int_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, int arg1) {
    void (*originalFunction)(id, SEL, id, int) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithInt:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).intValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, id arg2, id arg3, void* arg4) {
    BOOL (*originalFunction)(id, SEL, id, id, id, id, void*) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg4], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[4]).pointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___Pointer___BlockPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, void* arg1, id arg2, id arg3) {
    void (*originalFunction)(id, SEL, id, void*, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___Enum___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, __rollout_enum arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, __rollout_enum, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
