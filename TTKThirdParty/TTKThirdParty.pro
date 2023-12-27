# ***************************************************************************
# * This file is part of the TTK Tiny Tools project
# * Copyright (C) 2015 - 2024 Greedysky Studio
#
# * This program is free software; you can redistribute it and/or modify
# * it under the terms of the GNU Lesser General Public License as published by
# * the Free Software Foundation; either version 3 of the License, or
# * (at your option) any later version.
#
# * This program is distributed in the hope that it will be useful,
# * but WITHOUT ANY WARRANTY; without even the implied warranty of
# * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# * GNU Lesser General Public License for more details.
#
# * You should have received a copy of the GNU Lesser General Public License along
# * with this program; If not, see <http://www.gnu.org/licenses/>.
# ***************************************************************************

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4){ #Qt5
    QT += widgets
    equals(QT_MAJOR_VERSION, 6){ #Qt6
        QT += core5compat
    }
}

TEMPLATE = lib
CONFIG += plugin lib

include($$PWD/../TTKVersion.pri)

DESTDIR = $$OUT_PWD/../bin/$$TTK_VERSION
TARGET = TTKThirdParty

DEFINES += TTK_LIBRARY

win32:msvc{
    CONFIG += c++11
}else{
    equals(QT_MAJOR_VERSION, 6){ #Qt6
        QMAKE_CXXFLAGS += -std=c++17
    }else{
        QMAKE_CXXFLAGS += -std=c++11
    }
}

INCLUDEPATH += \
    $$PWD \
    $$PWD/../TTKCommon

include($$PWD/qrencode/QRencode.pri)
include($$PWD/zxing/ZXing.pri)

win32:RC_FILE = $$PWD/TTKThirdParty.rc
