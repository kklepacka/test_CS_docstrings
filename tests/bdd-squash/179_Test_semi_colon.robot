*** Settings ***
Documentation    Test semi colon
Metadata         ID                           179
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Test semi colon
    [Documentation]    Test semi colon

    &{docstrings} =    Retrieve Docstrings

    Given testing ; echo toto "${docstrings}[docstring_1]"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_179_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_179_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_179_SETUP_VALUE} =    Get Variable Value    ${TEST_179_SETUP}
    IF    $TEST_SETUP_VALUE is not None        Run Keyword    ${TEST_SETUP}
    IF    $TEST_179_SETUP_VALUE is not None    Run Keyword    ${TEST_179_SETUP}

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_179_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_179_TEARDOWN}.

    ${TEST_179_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_179_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_179_TEARDOWN_VALUE is not None    Run Keyword    ${TEST_179_TEARDOWN}
    IF    $TEST_TEARDOWN_VALUE is not None        Run Keyword    ${TEST_TEARDOWN}

Retrieve Docstrings
    [Documentation]    Retrieves Squash TM's docstrings and stores them in a dictionary.
    ...
    ...                For instance, two docstrings have been defined in Squash TM,
    ...                the first one containing the string
    ...                "I am the
    ...                FIRST    docstring",
    ...                the second one containing the string "I am the second docstring"
    ...
    ...                First, this keyword retrieves values and converts them to an inline string :
    ...                ${docstring_1} =    Set Variable    I am the\nFIRST\tdocstring"
    ...
    ...                Then, this keyword stores the docstrings into the &{docstrings} dictionary
    ...                with each docstring name as key, and each docstring value as value :
    ...                ${docstrings} =    Create Dictionary    docstring_1=${docstring_1}    docstring_2=${docstring_2}

    ${docstring_1} =    Set Variable    testing ; echo toto

    &{docstrings} =    Create Dictionary    docstring_1=${docstring_1}

    RETURN    &{docstrings}
