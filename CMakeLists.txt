CMAKE_MINIMUM_REQUIRED(VERSION 3.21.1)

PROJECT(ExamplePrj LANGUAGES CXX)

FIND_PACKAGE(Qt6 6.0 REQUIRED COMPONENTS Core Gui Qml Quick Widgets Charts QuickControls2)

#FOR QT
SET(CMAKE_AUTOMOC ON)
SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)
SET(CMAKE_CONFIGURATION_TYPES Debug;Release)

#QT STAFF
qt6_standard_project_setup()

qt6_add_executable(ExamplePrj
    src/source/main.cpp
    src/include/ChartData.h
    src/source/ChartData.cpp
)

qt6_add_resources(ExamplePrj "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
        src/img/cpu.png
        src/img/loop.svg
        src/img/loop.png

        src/qml/ButtonMyStyle.qml
        src/qml/main.qml
        src/qml/Example1.qml
        src/qml/Example2.qml
        src/qml/Example3.qml
        src/qml/Example4.qml
        src/qml/Example5.qml
        src/qml/Example6.qml

        src/js/externalScript.js
)

TARGET_LINK_LIBRARIES(ExamplePrj PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Widgets
    Qt6::Charts
    Qt6::QuickControls2
)


