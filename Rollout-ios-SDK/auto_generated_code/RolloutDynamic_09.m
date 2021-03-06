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

@implementation RolloutDynamic(blocks_9)


- (id)blockFor_classMethod_ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv) {
    id (*originalFunction)(id, SEL) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_CGFloat___ObjCObjectPointer___ObjCObjectPointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^CGFloat(id rcv, id arg0, id arg1, long arg2) {
    CGFloat (*originalFunction)(id, SEL, id, id, long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithLong:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithDouble:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).longValue)];
    }];

    return result.doubleValue;
  };
}

- (id)blockFor_instanceMethod_BOOL___Pointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, void* arg0, id arg1) {
    BOOL (*originalFunction)(id, SEL, void*, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2, id arg3) {
    void (*originalFunction)(id, SEL, id, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___BlockPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
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

- (id)blockFor_instanceMethod_BOOL___ObjCObjectPointer___Int_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, int arg1) {
    BOOL (*originalFunction)(id, SEL, id, int) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithInt:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).intValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1) {
    void (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
