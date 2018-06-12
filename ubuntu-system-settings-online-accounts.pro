include(common-vars.pri)
include(common-project-config.pri)

TEMPLATE = subdirs
SUBDIRS = \
    po \
    online-accounts-service \
    online-accounts-ui \
    click-hooks \
    client \
    system-settings-plugin \
    plugins

!CONFIG(no_tests) {
    SUBDIRS += \
        tests
    tests.depends = online-accounts-service online-accounts-ui client plugins
}

system-settings-plugin.depends = client
online-accounts-ui.depends = plugins

include(common-installs-config.pri)

DISTNAME = $${PROJECT_NAME}-$${PROJECT_VERSION}
dist.commands = "bzr export $${DISTNAME}.tar.bz2"
QMAKE_EXTRA_TARGETS += dist
