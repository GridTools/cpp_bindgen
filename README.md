gridtools
=========

Design project for a C++ library for applications on regular or block regular grids, like PDE solvers.

Coding conventions
==================

the coding conventions follow those implemented by Boost.
* The object member names are lowercase, start with 'm_' and each word is split with an underscore (m_class_member)
* The static object member names are lowercase, start with 's_' and each word is split with an underscore (s_static_member)
* the object names are lowercase and and each word is split with an underscore (class_name)
* the template arguments have the first letter of each word capitalized, no underscores (TemplateArgument)
* the local variables are lowercase and the words are separated by underscores (same as for object names, well, it's not easy mistake them)
* the typedef names are lowercase, words separated by underscores, and they end with _t (some_def_t)
* the class methods and all the functions follow the same convention: lowercase, words separated by underscores
* enum types follow the convention of the object names, but are defined inside the enumtype namespace (enumtype::some_id)

# Google Test #

[![Build Status](https://travis-ci.org/google/googletest.svg?branch=master)](https://travis-ci.org/google/googletest)
[![Build status](https://ci.appveyor.com/api/projects/status/4o38plt0xbo1ubc8/branch/master?svg=true)](https://ci.appveyor.com/project/BillyDonahue/googletest/branch/master)

Welcome to **Google Test**, Google's C++ test framework!

This repository is a merger of the formerly separate GoogleTest and
GoogleMock projects. These were so closely related that it makes sense to
maintain and release them together.

Please see the project page above for more information as well as the
mailing list for questions, discussions, and development.  There is
also an IRC channel on OFTC (irc.oftc.net) #gtest available.  Please
join us!

Getting started information for **Google Test** is available in the 
[Google Test Primer](googletest/docs/Primer.md) documentation.

**Google Mock** is an extension to Google Test for writing and using C++ mock
classes.  See the separate [Google Mock documentation](googlemock/README.md).

More detailed documentation for googletest (including build instructions) are
in its interior [googletest/README.md](googletest/README.md) file.

## Features ##

  * An [XUnit](https://en.wikipedia.org/wiki/XUnit) test framework.
  * Test discovery.
  * A rich set of assertions.
  * User-defined assertions.
  * Death tests.
  * Fatal and non-fatal failures.
  * Value-parameterized tests.
  * Type-parameterized tests.
  * Various options for running the tests.
  * XML test report generation.

## Platforms ##

Google test has been used on a variety of platforms:

  * Linux
  * Mac OS X
  * Windows
  * Cygwin
  * MinGW
  * Windows Mobile
  * Symbian

## Who Is Using Google Test? ##

In addition to many internal projects at Google, Google Test is also used by
the following notable projects:

  * The [Chromium projects](http://www.chromium.org/) (behind the Chrome
    browser and Chrome OS).
  * The [LLVM](http://llvm.org/) compiler.
  * [Protocol Buffers](https://github.com/google/protobuf), Google's data
    interchange format.
  * The [OpenCV](http://opencv.org/) computer vision library.

## Related Open Source Projects ##

[Google Test UI](https://github.com/ospector/gtest-gbar) is test runner that runs
your test binary, allows you to track its progress via a progress bar, and
displays a list of test failures. Clicking on one shows failure text. Google
Test UI is written in C#.

[GTest TAP Listener](https://github.com/kinow/gtest-tap-listener) is an event
listener for Google Test that implements the
[TAP protocol](https://en.wikipedia.org/wiki/Test_Anything_Protocol) for test
result output. If your test runner understands TAP, you may find it useful.

## Requirements ##

Google Test is designed to have fairly minimal requirements to build
and use with your projects, but there are some.  Currently, we support
Linux, Windows, Mac OS X, and Cygwin.  We will also make our best
effort to support other platforms (e.g. Solaris, AIX, and z/OS).
However, since core members of the Google Test project have no access
to these platforms, Google Test may have outstanding issues there.  If
you notice any problems on your platform, please notify
<googletestframework@googlegroups.com>. Patches for fixing them are
even more welcome!

### Linux Requirements ###

These are the base requirements to build and use Google Test from a source
package (as described below):

  * GNU-compatible Make or gmake
  * POSIX-standard shell
  * POSIX(-2) Regular Expressions (regex.h)
  * A C++98-standard-compliant compiler

### Windows Requirements ###

  * Microsoft Visual C++ v7.1 or newer

### Cygwin Requirements ###

  * Cygwin v1.5.25-14 or newer

### Mac OS X Requirements ###

  * Mac OS X v10.4 Tiger or newer
  * Xcode Developer Tools

### Requirements for Contributors ###

We welcome patches.  If you plan to contribute a patch, you need to
build Google Test and its own tests from a git checkout (described
below), which has further requirements:

  * [Python](https://www.python.org/) v2.3 or newer (for running some of
    the tests and re-generating certain source files from templates)
  * [CMake](https://cmake.org/) v2.6.4 or newer

## Regenerating Source Files ##

Some of Google Test's source files are generated from templates (not
in the C++ sense) using a script.
For example, the
file include/gtest/internal/gtest-type-util.h.pump is used to generate
gtest-type-util.h in the same directory.

You don't need to worry about regenerating the source files
unless you need to modify them.  You would then modify the
corresponding `.pump` files and run the '[pump.py](googletest/scripts/pump.py)'
generator script.  See the [Pump Manual](googletest/docs/PumpManual.md).

### Contributing Code ###

We welcome patches.  Please read the
[Developer's Guide](googletest/docs/DevGuide.md)
for how you can contribute. In particular, make sure you have signed
the Contributor License Agreement, or we won't be able to accept the
patch.

Happy testing!

Unit test naming conventions
==================
* the unit test folder structure has to match the code folder structure (e.g., a unit test for some element in `gridtools/include/storage/` has to be placed in `gridtools/unit_tests/storage/`)
* the unit test file name has to match following regex ```/(test)(_cxx11)?([a-z|A-Z|0-9|_]*)((\.cpp|\.cu))```
* cuda unit test file extension is `.cu`. host unit test file extension is `.cpp`
* as described in the regular expression cxx11 tests have to be named like `test_cxx11_<testname>.<cpp|cu>`
* the cmakelists mustn't be modified. tests are discovered automatically if named correctly.
* if you have a very special test case put it into examples or in case it really has to be in the unit_test folder discuss with the gridtools members how to proceed.
