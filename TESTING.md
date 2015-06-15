# Testing

Binjitsu makes extensive use of unit tests and integration tests to ensure everything is in working order, and no regressions occur.

## Test Suite


To run the test suite, it is beste to use Ubuntu 12.04 or 14.04, and run the following commands.  **Be aware** that this will add a user to the machine, and create a public key for SSH login!

``sh
bash .travis_install.sh
bash .travis_ssh_setup.sh
pip install -e .
pip install -r docs/requirements.txt
cd docs
PWNLIB_NOTERM=1 make clean doctest
``

## New Tests

To add a new test to an existing module, just add an inline doctest.  If the test needs access to an external module, add the import statement to the `testsetup` block in the corresponding file in `docs/source/<module>.rst`.

To add an entirely new module, create a new `module.rst` and add it to the list in `index.rst`.  The best way to see if your tests are actually being run is to add an intentionally-failing test like:

```py
>>> assert False
```

## Example Test Module

The module `pwnlib.testexample` exists to demonstrate how everything is tied together.  The only files which were modified to add this example module and run its tests automatically are:

- `pwnlib/testexample.py`
- `docs/source/testexample.rst`
- `docs/source/index.rst`