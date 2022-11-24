from os.path import join, dirname

import testgear
from behave import given
from behave import then
from behave import when


@given("I authorize on the portal")
def authorization(context):
    with testgear.step("I set login"):
        pass
    with testgear.step("I set password"):
        pass


@when("I create a project")
def create_project(context):
    pass


@when("I open the project")
def enter_project(context):
    pass


@when("I create a section")
def create_section(context):
    testgear.addLinks(
        title='component_dump.dmp',
        type=testgear.LinkType.RELATED,
        url='https://dumps.example.com/module/some_module_dump',
        description='Description'
    )


@when("I create a section - failed")
def create_section(context):
    assert 1 == 2


@then("I create a test case")
def create_test_case(context):
    testgear.addAttachments('pictures/picture.jpg')


@then("I check something")
def check_something(context):
    pass


@then("I check something - failed")
def check_something(context):
    assert 1 == 2
