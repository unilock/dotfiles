#!/bin/bash

source functions/common

if [[ "$OSTYPE" == "darwin"* ]]; then

    darwin_vers=${OSTYPE:6}

    macos_prefix=$(sw_vers -productName)
    macos_version=$(sw_vers -productVersion)
    macos_build=$(sw_vers -buildVersion)


    # Check macOS version.
    # TODO: Make this not horrible.

     # Tiger. Probably won't work, as I think $OSTYPE returns decimal point version. Needs further testing.
    if (( $darwin_vers == 8 )); then
        if [ "$macos_build" == "8S165" ] || [ "$macos_build" == "8S2167" ]; then
            print_line "Mac OS X Tiger ($macos_build) detected. (Why are you still running Tiger...?)"
            # ./[appropriate script here].sh
            exit 0
        else
            print_line "Mac OS X Tiger detected, but you are not running the latest build!"
            exit 1
        fi

     # Leopard. Probably won't work, as I think $OSTYPE returns decimal point version. Needs further testing.
    elif (( $darwin_vers == 9 )); then
        if [ "$macos_build" != "9L30" ]; then
            print_line "Max OS X Leopard (9L30) detected."
            # ./[appropriate script here].sh
            exit 0
        else
            print_line "Mac OS X Leopard detected, but you are not running the latest build!"
            exit 1
        fi

    # Lion.
    elif (( $darwin_vers == 11 )); then
        if [ "$macos_build" == "11G63" ]; then
            print_line "Mac OS X Lion (11G63) detected."
            # ./[appropriate script here].sh
            exit 0
        else
            print_line "Mac OS X Lion detected, but you are not running the latest build!"
            exit 1
        fi

    # TODO: add something for Mountain Lion?

    # Yosemite or above.
    elif (( $darwin_vers >= 14 )); then
        print_line "$macos_prefix $macos_version ($macos_build) detected."
        # ./[appropriate script here].sh
        exit 0

    else
        print_line "Unsupported version of $macos_prefix!"
        exit 1
    fi

else
    print_line "This is not a Darwin system!"
    exit 1
fi

# TODO: Implement checks for other operating systems.