#-------------------------------------------------
#
# Project created by QtCreator 2015-04-19T08:45:06
#
#-------------------------------------------------

QT       += core gui

TARGET = gleke
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

OTHER_FILES += \
    main.qml \
    BTN.qml \
    BTN_TEXT.qml \
    BTN_MOUSEAREA.qml \
    TEXT_INPUT.qml \
    RECT_TEXT_INPUT.qml \
    LABEL_TEXT.qml

RESOURCES += \
    qrc.qrc

QT += core declarative
LIBS = -lwininet
