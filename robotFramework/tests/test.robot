*** Settings ***
Documentation      Main Suite with examples
Library            testgear_adapter_robotframework.TMSLibrary

*** Variables ***
&{SIMPLE_LINK}             url=http://google.com
&{FULL_LINK}               url=http://google.co.uk   title=Google     type=Related   description=just a link

@{LINKS}               ${SIMPLE_LINK}   ${FULL_LINK}


*** Test Cases ***
Simple Test
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Simple Test with link as variable
    [Tags]   testgear.links:${SIMPLE_LINK}
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Simple Test with link as dict
    [Tags]   testgear.links:${{{'url': 'http://google.com', 'type':'Issue'}}}
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Simple Test with WorkitemId as string
    [Tags]   testgear.workitemsID:123
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Simple Test with WorkitemId as list5
    [Tags]   testgear.workitemsID:${{[123, '456']}}
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Simple Test with Title or Description or DisplayName with simple formatting
    [Documentation]  Tags are space sensitive, use only one space between words
    [Tags]   testgear.displayName:This works     testgear.title:'This also works'
    ...    testgear.description:"This works too"
    [Setup]  Setup
    Do Something
    Do Another Thing
    Log  I'am a step
    [Teardown]  Teardown

Test With All Params
    [Documentation]  It's better to use this kind of formatting for different data types in tags
    [Tags]   testgear.externalID:123    testgear.title:${{'Different title'}}   testgear.displayName:${{'Different name'}}
    ...     testgear.description:${{'Different description'}}    testgear.workitemsID:${{[123, '456']}}
    ...     testgear.links:${{{'url': 'http://google.com', 'type':'Issue'}}}   testgear.labels:${{['smoke', 'lol']}}
    [Setup]  Setup
    Log    Something
    Log    Another
    [Teardown]  Teardown

Test With Add Link
    [Setup]  Setup
    Do Something
    Do Another Thing
    Add Links    @{LINKS}
#    You can also add one link (default type is Defect)
    Add Link    http://google.com
    Add Link    http://google.com    type=Issue
    Add Link    ${SIMPLE_LINK}[url]
    [Teardown]  Teardown

Test With Add Attachment
    [Setup]  Setup
    Do Something
    Do Another Thing
    ${V}   Get Variables
    Add Attachment    '${V}'    file.txt
    Add Attachments    images/banner.png     images/icon.png
    [Teardown]  Teardown

Test With Add Message
    [Setup]  Setup
    Do Something
    Do Another Thing
    Add Message    Wow, it's my error message!
    Fail
    [Teardown]  Teardown

Templated
    [Template]  Template
    first 1   second 1
    second 1
    [Teardown]  Teardown

Normal test case with embedded arguments
    The result of 1 + 1 should be ${2}
    The result of 1 + 2 should be ${3}

Template with embedded arguments
    [Template]    The result of ${calculation} should be ${expected}
    1 + 1    ${2}
    1 + 2    ${3}

???????? ???? ??????????????
    [Setup]  Setup
    My best keyword
    [Teardown]  Teardown

*** Keywords ***
Do Something
    Log Variables
    Log  something

Template
    [Arguments]   ${LOGIN}=789   ${PASSWORD}=123
    Log  ${LOGIN}
    Log  ${PASSWORD}

Do Another Thing
    Do Something
    Log  Another

Setup
    Log  I'm a setup
    Log  Still a setup

Teardown
    Setup
    Log  I'm a teardown
    Log  End

The result of ${calculation} should be ${expected}
    ${result}    Evaluate    1 + 1
    Should Be Equal    2     2

Setup
    Log    I'm setup

Teardown
    Log    I'm teardown

My best keyword
    Log    Hello world!!!
