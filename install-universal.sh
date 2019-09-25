#!/bin/bash

source functions/common

if [[ "$OSTYPE" == "darwin"* ]]; then

    darwin_vers=${OSTYPE:6}

    macos_prefix=$(sw_vers -productName)
    macos_version=$(sw_vers -productVersion)
    macos_build=$(sw_vers -buildVersion)


    # Check macOS version.
    # TODO: Make this not horrible.

     # Tiger.
    if [ "$darwin_vers" == "8.0" ]; then
        if [ "$macos_build" == "8S165" ] || [ "$macos_build" == "8S2167" ]; then
            print_line "Mac OS X Tiger ($macos_build) detected. (Why are you still running Tiger...?)"
            # ./installers/install-4.sh
            exit 0
        else
            print_line "Mac OS X Tiger detected, but you are not running the latest build!"
            exit 1
        fi

     # Leopard.
    elif [ "$darwin_vers" == "9.0" ]; then
        if [ "$macos_build" == "9L30" ]; then
            print_line "Max OS X Leopard (9L30) detected."
            # ./installers/install-5.sh
            exit 0
        else
            print_line "Mac OS X Leopard detected, but you are not running the latest build!"
            exit 1
        fi

    # Lion.
    elif (( $darwin_vers == 11 )); then
        if [ "$macos_build" == "11G63" ]; then
            print_line "Mac OS X Lion (11G63) detected."
            # ./installers/install-7.sh
            exit 0
        else
            print_line "Mac OS X Lion detected, but you are not running the latest build!"
            exit 1
        fi

    # TODO: Mountain Lion support.

    # Yosemite or above.
    elif (( $darwin_vers >= 14 )); then
        print_line "$macos_prefix $macos_version ($macos_build) detected."
        ./installers/install-10.sh
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
