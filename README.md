#  Citizen Services (CS20) Automation

Robot Automation scripts for the Citizen Services (CS20) Project.

There a are two system in scope, both of these have there own resource directory
1. Digital Helper (Citizen Portal)
2. Enquiries Console (Agent Portal)

## Environments
There are 3 env's (comptest, uat & preprod). The uat env runs by default, 
set the `ENV` variable in the console to switch between env's. 

Alternatively you can manually change the `ENV` variable in `EnvLoginsAndDHSetup.robot`

##### Examples
###### to run in comptest (default)
```bash
robot -v ENV:comptest TestSuite/E2E
```
###### to run in uat
```bash
robot -v ENV:uat TestSuite/E2E
```
###### to run in preprod
```bash
robot -v ENV:preprod TestSuite/E2E
```

## Usage
##### E2E test cases

###### Assignment rule tests
```bash
robot -T -d Results TestSuite/E2E/AssignmentRules
```
###### Digital Helper tests
```bash
robot -T -d Results TestSuite/E2E/DigitalHelper
```

##### Re-execute failed tests
If a handful of tests fail you can re-execute only the failed tests to save time. 
Then merge the results into one report with the following commands
```bash
robot --rerunfailed output.xml --output output2.xml TestSuite/E2E/DigitalHelper  # re-execute failing
rebot --merge output.xml output2.xml                       # merge results into a single report
```
## Useful links
###### Framework
- [SeleniumLibrary for Robot Framework](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [How to write good test cases using Robot Framework (blog)](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)

###### Project specific
- [System Information (Confluence)](https://bluesquirrel.atlassian.net/wiki/spaces/CSC/pages/454232801/System+information)
- [Agent Logins (Confluence)](https://bluesquirrel.atlassian.net/wiki/spaces/CSC/pages/425656931/Test+Team+Role+Access)
- [Project Kanban Board (Jira)](https://bluesquirrel.atlassian.net/jira/software/projects/CS20/boards/182)
- [Manual Test Cycles (Jira/Zephyr)](https://bluesquirrel.atlassian.net/projects/CS20?selectedItem=com.thed.zephyr.je__cycle-summary)
- [Digital Helper Screenshots (Zeplin)](https://app.zeplin.io/project/60427102f8d8ba806a077770/dashboard?sid=6058ca1f01a1fb12ebf770f8)
- [NHS Design Manual](https://service-manual.nhs.uk/design-system/components/hint-text)