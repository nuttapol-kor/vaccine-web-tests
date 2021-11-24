# E2E Tests with Robot Framework
- Project to test: Vaccine Haven (Service Taker)

| Test Case ID |             Name               |
|--------------|--------------------------------|
|     TC-01    | Verify 2 item on the home page |
|     TC-02    | Test Create Reservation        |
|     TC-03    | Test Cancel Reservation        |

## Installation

```bash
pip install -r requirements.txt
```

## How to run the test

```bash
robot .\test_service_taker.robot
```

### Which do you think is a better framework for E2E testing of web applications or web services:  Robot Framework or Cucumber with Selenium/HTTP library and JUnit?

> I think Cucumber is better because it readable more than Robot Framework for non-programmer and it implement the test like a unit test just need the glue code for matching with behavior tests (Gherkin language)

## What tutorial or online resource(s) did you find most helpful for learning Robot Framework?
- https://robotframework.org/Selenium2Library/Selenium2Library.html