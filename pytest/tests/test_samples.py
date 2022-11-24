import pytest
import testgear


class TestClass1:
    def setup_method(self):
        with testgear.step('Open Chrome browser'):
            pass

    def teardown_method(self):
        with testgear.step('Close Chrome browser'):
            pass

    @testgear.workItemID(3791)
    @testgear.displayName('Authorization tests with test_suite [{test_suite}]')
    @testgear.externalID('authorization_test_{test_suite}')
    @testgear.title('Authorization')
    @testgear.description('E2E_autotest')
    @testgear.labels('{labels}')
    @testgear.link(type='{link_type}', url='{url}', title='{link_title}')
    @testgear.link(type=testgear.LinkType.REQUIREMENT, url='https://best-tms.test-gear.io/projects')
    @testgear.link(type=testgear.LinkType.BLOCKED_BY, url='https://test-gear.io/')
    @testgear.link(type=testgear.LinkType.REPOSITORY, url='https://git.test-gear.io/users/sign_in')
    @pytest.mark.parametrize('test_suite, labels, url, link_type, link_title', [
        ('suite 3', ['E2E', 'Auth'], 'https://dumps.example.com/module/JCP-15593', testgear.LinkType.DEFECT, 'JCP-15593'),
        ('suite 5', (), 'https://github.com/testgear-tms/autotest-integration-python', testgear.LinkType.RELATED,
         'Integration python')
    ])
    @pytest.mark.tag
    def test_authorization(self, test_suite, labels, url, link_type, link_title):
        testgear.addLink(url="http://best-tms.test-gear.io/", title="Тестируемый продукт")
        with testgear.step('Log in the system', 'system authentication'):
            pass
        with testgear.step('Create a project', 'the project was created'):
            with testgear.step('Enter the project', 'the contents of the project are displayed'):
                assert True
            with testgear.step('Create a section', 'section was created'):
                assert True
            with testgear.step('Create a tests case', 'tests case was created'):
                assert True


class TestClass2:
    def setup_method(self):
        with testgear.step('Open Chrome browser'):
            pass

    def teardown_method(self):
        with testgear.step('Close Chrome browser'):
            pass

    @testgear.workItemID(3788)
    @testgear.displayName('Load files tests')
    @testgear.externalID('load_files_test')
    @testgear.title('Attachments')
    @testgear.description('E2E_autotest')
    @testgear.labels('E2E', 'File')
    @pytest.mark.mag
    def test_load_files(self):
        testgear.addLink(url="http://best-tms.test-gear.io/", title="Тестируемый продукт")
        authorization('admin', 'Qwerty123')
        with testgear.step('Attachments'):
            testgear.addAttachments("123", True)
            testgear.addAttachments('tests/pictures/picture.jpg')
            load_attachment('tests/pictures/picture.jpg')
            load_attachment('tests/docs/document.docx')
            load_attachment('tests/docs/logs.log')
            load_attachment('tests/docs/text_file.txt')
            load_attachment('tests/docs/document.doc')


@testgear.step('Log in the system', 'system authentication')
def authorization(username, password):
    assert set_login(username)
    assert set_password(password)


@testgear.step
def set_login(username):
    return 'admin' == username


@testgear.step
def set_password(password):
    return 'Qwerty123' == password


@testgear.step
def load_attachment(file):
    testgear.addAttachments(file)
