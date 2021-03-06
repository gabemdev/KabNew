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

@implementation RolloutDynamic(blocks_1)


- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
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

- (id)blockFor_classMethod_BOOL___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0) {
    BOOL (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___Int___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, int arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, int, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithInt:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).intValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___ULongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, unsigned long long arg0) {
    void (*originalFunction)(id, SEL, unsigned long long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithULongLong:arg0], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uLongLongValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___Enum___Enum_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_enum arg0, __rollout_enum arg1) {
    id (*originalFunction)(id, SEL, __rollout_enum, __rollout_enum) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).enumValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Enum___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_enum arg0, id arg1) {
    id (*originalFunction)(id, SEL, __rollout_enum, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___LongLong___LongLong___LongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, long long arg2, long long arg3, long long arg4) {
    void (*originalFunction)(id, SEL, id, id, long long, long long, long long) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithLongLong:arg2], 
     [[RolloutTypeWrapper alloc] initWithLongLong:arg3], 
     [[RolloutTypeWrapper alloc] initWithLongLong:arg4], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).longLongValue, ((RolloutTypeWrapper*)arguments[3]).longLongValue, ((RolloutTypeWrapper*)arguments[4]).longLongValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    RolloutInvocationContext *invocationContext = [[RolloutInvocationContext alloc] initWithTarget:rcv tweakId:tweakId arguments:@[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
]];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithContext:invocationContext originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
