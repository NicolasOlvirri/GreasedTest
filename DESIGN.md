# Design

## Why asynchronous

* Dynamically adding components to the DOM is asynchronous
* Code being tested might call Apex, which is asynchronous

## Promises vs Callbacks

Promises only available in SFDC "Supported" browsers. In Communities, you have to assume users
will use un-supported browsers. For this reason, tests can be written using callbacks instead of 
Promises by passing callbacks to each assertion.

This means Promises cannot be used in client code. They could still be used in test code since you
control the browsers used to invoke tests but that means the tests cannot be used to check your code 
in all browsers that users might use.

## Component/App Structure

Tests are made up of the following parts:

1. TestSomeComponent.app - which extends...
2. greased_TestCommon.app - which contains...
3. greased_TestBase.cmp

Most of the behaviours come from the TestBase component and it can be re-used inside other applications if that's useful.

The TestCommon app exists to provide:

1. An app to extend/inherit from for tests
2. SLDS style for tests
3. Parameter parsing features (TODO) for tests
4. Simplified initialisation and access to the driver object for tests

The last item is the most useful for tests because it keeps them simple. 
Under the covers, there is some complexity which addresses LockerService rules around inheritance and composition but tests don't see this.

If you want to use the TestBase component, you will need to learn [how the TestCommon app initialises the TestBase](https://github.com/stevebuik/greased/blob/master/src/aura/greased_TestCommon/greased_TestCommonHelper.js).
The comments in those fns should provide a good example.