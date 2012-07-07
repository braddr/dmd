# Execute the dmd test suite
#
# Targets:
#
#    default | all:      run all unit tests that haven't been run yet
#
#    run_tests:          run all tests
#    run_runnable_tests:         run just the runnable tests
#    run_compilable_tests:       run just the runnable tests
#    run_fail_compilation_tests: run just the runnable tests
#
#    quick:              run all tests with no default permuted args
#                        (individual test specified options still honored)
#
#    clean:              remove all temporary or result files from prevous runs
#
#
# In-test variables:
#
#   COMPILE_SEPARATELY:  if present, forces each .d file to compile separately and linked
#                        together in an extra setp.
#                        default: (none, aka compile/link all in one step)
#
#   EXECUTE_ARGS:        parameters to add to the execution of the test
#                        default: (none)
#
#   EXTRA_SOURCES:       list of extra files to build and link along with the test
#                        default: (none)
#
#   EXTRA_OBJC_SOURCES:  list of extra Objective-C files to build and link along with the test
#                        default: (none). Test files with this variable will be ignored unless
#                        the D_OBJC environment variable is set to "1"
#
#   PERMUTE_ARGS:        the set of arguments to permute in multiple $(DMD) invocations
#                        default: the make variable ARGS (see below)
#
#   TEST_OUTPUT:         the output is expected from the compilation (if the
#                        output of the compilation doesn't match, the test
#                        fails). You can use the this format for multi-line
#                        output:
#                        TEST_OUTPUT:
#                        ---
#                        Some
#                        Output
#                        ---
#
#   POST_SCRIPT:         name of script to execute after test run
#                        note: arguments to the script may be included after the name.
#                              additionally, the name of the file that contains the output
#                              of the compile/link/run steps is added as the last parameter.
#                        default: (none)
#
#   REQUIRED_ARGS:       arguments to add to the $(DMD) command line
#                        default: (none)
#                        note: the make variable REQUIRED_ARGS is also added to the $(DMD)
#                              command line (see below)
#
#   DISABLED:            text describing why the test is disabled (if empty, the test is
#                        considered to be enabled).
#                        default: (none, enabled)

ifeq (,$(OS))
    OS:=$(shell uname)
    ifeq (Darwin,$(OS))
        OS:=osx
    else
        ifeq (Linux,$(OS))
            OS:=linux
        else
            ifeq (FreeBSD,$(OS))
                OS:=freebsd
            else
                ifeq (Solaris,$(OS))
                    OS:=solaris
                else
                    ifeq (SunOS,$(OS))
                        OS:=solaris
                    else
                        $(error Unrecognized or unsupported OS for uname: $(OS))
                    endif
                endif
            endif
        endif
    endif
else
    ifeq (Windows_NT,$(OS))
        ifeq ($(findstring WOW64, $(shell uname)),WOW64)
            OS:=win64
        else
            OS:=win32
        endif
    endif
    ifeq (Win_32,$(OS))
	OS:=win32
    endif
    ifeq (Win_64,$(OS))
	OS:=win64
    endif
endif
export OS

ifeq (freebsd,$(OS))
    SHELL=/usr/local/bin/bash
else
    SHELL=/bin/bash
endif
QUIET=@
export RESULTS_DIR=test_results
export MODEL=32
export REQUIRED_ARGS=

ifneq (x,x$(MODEL))
    MODEL_FLAG=-m$(MODEL)
endif

ifeq (,$(TARGET_CPU))
    $(warning no cpu specified, assuming X86)
    TARGET_CPU=X86
endif

ifeq ($(findstring win,$(OS)),win)
export ARGS=-inline -release -g -O -unittest
export DMD=../src/dmd.exe
export EXE=.exe
export OBJ=.obj
export DSEP=\\
export SEP=$(subst /,\,/)

DRUNTIME_PATH=..\..\druntime
PHOBOS_PATH=..\..\phobos
export DFLAGS=-I$(DRUNTIME_PATH)\import -I$(PHOBOS_PATH)
export LIB=$(PHOBOS_PATH)
else
export ARGS=-inline -release -gc -O -unittest -fPIC
export DMD=../src/dmd
export EXE=
export OBJ=.o
export DSEP=/
export SEP=/

DRUNTIME_PATH=../../druntime
PHOBOS_PATH=../../phobos
export DFLAGS=-I$(DRUNTIME_PATH)/import -I$(PHOBOS_PATH) -L-L$(PHOBOS_PATH)/generated/$(OS)/release/$(MODEL)
endif

ifeq ($(OS),osx)
ifeq ($(MODEL),64)
export D_OBJC=1
endif
endif

ifeq (ARM,$(TARGET_CPU))
DISABLED_TESTS += A16.d
DISABLED_TESTS += a17.d
DISABLED_TESTS += a18.d
DISABLED_TESTS += a19.d
DISABLED_TESTS += a20.d
DISABLED_TESTS += a21.d
DISABLED_TESTS += aliasthis.d
DISABLED_TESTS += argufilem.d
DISABLED_TESTS += arrayop.d
DISABLED_TESTS += assignable.d
DISABLED_TESTS += auto1.d
DISABLED_TESTS += b26.d
DISABLED_TESTS += bench1.d
DISABLED_TESTS += bitops.d
DISABLED_TESTS += bug5.d
DISABLED_TESTS += bug846.d
DISABLED_TESTS += builtin.d
DISABLED_TESTS += c22.d
DISABLED_TESTS += circular.d
DISABLED_TESTS += closure.d
DISABLED_TESTS += complex.d
DISABLED_TESTS += constfold.d
DISABLED_TESTS += cov2.d
DISABLED_TESTS += ctorpowtests.d
DISABLED_TESTS += delegate.d
DISABLED_TESTS += deprecate1.d
DISABLED_TESTS += dhry.d
DISABLED_TESTS += eh.d
DISABLED_TESTS += eh2.d
DISABLED_TESTS += entity1.d
DISABLED_TESTS += extern1.d
DISABLED_TESTS += foreach.d
DISABLED_TESTS += foreach2.d
DISABLED_TESTS += foreach3.d
DISABLED_TESTS += foreach4.d
DISABLED_TESTS += foreach5.d
DISABLED_TESTS += hello.d
DISABLED_TESTS += hello-profile.d
DISABLED_TESTS += helloUTF16.d
DISABLED_TESTS += helloUTF16BE.d
#DISABLED_TESTS += helloUTF8.d
DISABLED_TESTS += hospital.d
DISABLED_TESTS += iasm.d
DISABLED_TESTS += iasm64.d
DISABLED_TESTS += ifti.d
DISABLED_TESTS += implicit.d
DISABLED_TESTS += inline.d
DISABLED_TESTS += inline2.d
DISABLED_TESTS += inner.d
DISABLED_TESTS += integrate.d
DISABLED_TESTS += interface.d
DISABLED_TESTS += interface1.d
DISABLED_TESTS += interface2.d
DISABLED_TESTS += interface3.d
DISABLED_TESTS += interpret.d
DISABLED_TESTS += interpret2.d
DISABLED_TESTS += lazy.d
DISABLED_TESTS += lexer.d
DISABLED_TESTS += literal.d
DISABLED_TESTS += m1.d
DISABLED_TESTS += manboy.d
DISABLED_TESTS += mars1.d
DISABLED_TESTS += mixin1.d
DISABLED_TESTS += mixin2.d
DISABLED_TESTS += mod1.d
DISABLED_TESTS += nested.d
DISABLED_TESTS += newdel.d
DISABLED_TESTS += opover.d
DISABLED_TESTS += opover2.d
DISABLED_TESTS += pi.d
DISABLED_TESTS += printargs.d
DISABLED_TESTS += property.d
DISABLED_TESTS += s2ir.d
DISABLED_TESTS += Same.d
DISABLED_TESTS += sdtor.d
DISABLED_TESTS += sieve.d
DISABLED_TESTS += statictor.d
DISABLED_TESTS += stress.d
DISABLED_TESTS += structlit.d
DISABLED_TESTS += template1.d
DISABLED_TESTS += template2.d
DISABLED_TESTS += template3.d
DISABLED_TESTS += template4.d
DISABLED_TESTS += template6.d
DISABLED_TESTS += template8.d
DISABLED_TESTS += template9.d
DISABLED_TESTS += test10.d
DISABLED_TESTS += test11.d
DISABLED_TESTS += test12.d
DISABLED_TESTS += test13.d
DISABLED_TESTS += test15.d
DISABLED_TESTS += test16.d
DISABLED_TESTS += test17.d
DISABLED_TESTS += test19.d
DISABLED_TESTS += test20.d
DISABLED_TESTS += test21.d
DISABLED_TESTS += test22.d
DISABLED_TESTS += test23.d
DISABLED_TESTS += test24.d
DISABLED_TESTS += test27.d
DISABLED_TESTS += test28.d
DISABLED_TESTS += test29.d
DISABLED_TESTS += test3.d
DISABLED_TESTS += test30.d
DISABLED_TESTS += test31.d
DISABLED_TESTS += test32.d
DISABLED_TESTS += test34.d
DISABLED_TESTS += test36.d
DISABLED_TESTS += test37.d
DISABLED_TESTS += test38.d
DISABLED_TESTS += test4.d
DISABLED_TESTS += test40.d
DISABLED_TESTS += test41.d
DISABLED_TESTS += test42.d
DISABLED_TESTS += test42a.d
DISABLED_TESTS += test45.d
DISABLED_TESTS += test46.d
DISABLED_TESTS += test48.d
DISABLED_TESTS += test49.d
DISABLED_TESTS += test5.d
DISABLED_TESTS += test52.d
DISABLED_TESTS += test57.d
DISABLED_TESTS += test58.d
DISABLED_TESTS += test60.d
DISABLED_TESTS += test61.d
DISABLED_TESTS += test7.d
DISABLED_TESTS += test8.d
DISABLED_TESTS += test9.d
DISABLED_TESTS += testaa.d
DISABLED_TESTS += testaa2.d
DISABLED_TESTS += testappend.d
DISABLED_TESTS += testarray.d
DISABLED_TESTS += testbitarray.d
DISABLED_TESTS += testbounds.d
DISABLED_TESTS += testconst.d
DISABLED_TESTS += testcontracts.d
DISABLED_TESTS += testdstress.d
DISABLED_TESTS += testdt.d
DISABLED_TESTS += testenum.d
DISABLED_TESTS += testfile.d
DISABLED_TESTS += testformat.d
DISABLED_TESTS += testgc2.d
DISABLED_TESTS += testgc3.d
DISABLED_TESTS += testinvariant.d
DISABLED_TESTS += testline.d
DISABLED_TESTS += testmath.d
DISABLED_TESTS += testminit.d
DISABLED_TESTS += testmmfile.d
DISABLED_TESTS += testmod1.d
DISABLED_TESTS += testmod2.d
DISABLED_TESTS += testmodule.d
DISABLED_TESTS += testprofile.d
DISABLED_TESTS += testsafe.d
DISABLED_TESTS += testscope.d
DISABLED_TESTS += testsignals.d
DISABLED_TESTS += testsocket.d
DISABLED_TESTS += teststdio.d
DISABLED_TESTS += testswitch.d
DISABLED_TESTS += testthread.d
DISABLED_TESTS += testthread2.d
DISABLED_TESTS += testtypeid.d
DISABLED_TESTS += testUTF32.d
DISABLED_TESTS += testv.d
DISABLED_TESTS += testzip.d
DISABLED_TESTS += tls.d
DISABLED_TESTS += tls_dup.d
DISABLED_TESTS += traits.d
DISABLED_TESTS += untag.d
DISABLED_TESTS += variadic.d
DISABLED_TESTS += version.d
DISABLED_TESTS += warning1.d
DISABLED_TESTS += wc.d
DISABLED_TESTS += wc2.d
DISABLED_TESTS += wc3.d
DISABLED_TESTS += xtest46.d
DISABLED_TESTS += xtest55.d
DISABLED_TESTS += xtestenum.d

DISABLED_TESTS += testhtml.html
DISABLED_TESTS += testhtml2.html
DISABLED_TESTS += testhtml3.html

DISABLED_TESTS += test2.sh
DISABLED_TESTS += test35.sh
DISABLED_TESTS += test39.sh
DISABLED_TESTS += test44.sh

DISABLED_COMPILABLE_TESTS += 99bottles.d
DISABLED_COMPILABLE_TESTS += art4769.d
DISABLED_COMPILABLE_TESTS += b33.d
DISABLED_COMPILABLE_TESTS += callconv.d
DISABLED_COMPILABLE_TESTS += compile1.d
DISABLED_COMPILABLE_TESTS += const.d
DISABLED_COMPILABLE_TESTS += ddoc10.d
DISABLED_COMPILABLE_TESTS += ddoc11.d
DISABLED_COMPILABLE_TESTS += ddoc12.d
DISABLED_COMPILABLE_TESTS += ddoc13.d
DISABLED_COMPILABLE_TESTS += ddoc14.d
DISABLED_COMPILABLE_TESTS += ddoc1.d
DISABLED_COMPILABLE_TESTS += ddoc2.d
DISABLED_COMPILABLE_TESTS += ddoc3.d
DISABLED_COMPILABLE_TESTS += ddoc4.d
DISABLED_COMPILABLE_TESTS += ddoc5.d
DISABLED_COMPILABLE_TESTS += ddoc6491.d
DISABLED_COMPILABLE_TESTS += ddoc6.d
DISABLED_COMPILABLE_TESTS += ddoc7.d
DISABLED_COMPILABLE_TESTS += ddoc8.d
DISABLED_COMPILABLE_TESTS += ddoc9.d
DISABLED_COMPILABLE_TESTS += defa.d
DISABLED_COMPILABLE_TESTS += deprecate2.d
DISABLED_COMPILABLE_TESTS += empty_file.d
DISABLED_COMPILABLE_TESTS += extra-files
DISABLED_COMPILABLE_TESTS += forward1.d
DISABLED_COMPILABLE_TESTS += header.d
DISABLED_COMPILABLE_TESTS += imports
DISABLED_COMPILABLE_TESTS += interpret3.d
DISABLED_COMPILABLE_TESTS += json.d
DISABLED_COMPILABLE_TESTS += parse6719.d
DISABLED_COMPILABLE_TESTS += test1537.d
DISABLED_COMPILABLE_TESTS += test1.d
DISABLED_COMPILABLE_TESTS += test25.d
DISABLED_COMPILABLE_TESTS += test4375.d
DISABLED_COMPILABLE_TESTS += test50.d
DISABLED_COMPILABLE_TESTS += test55.d
DISABLED_COMPILABLE_TESTS += test59.d
DISABLED_COMPILABLE_TESTS += test61.d
DISABLED_COMPILABLE_TESTS += test62.d
DISABLED_COMPILABLE_TESTS += test63.d
DISABLED_COMPILABLE_TESTS += test65.d
DISABLED_COMPILABLE_TESTS += test66.d
DISABLED_COMPILABLE_TESTS += test67.d
DISABLED_COMPILABLE_TESTS += test68.d
DISABLED_COMPILABLE_TESTS += test69.d
DISABLED_COMPILABLE_TESTS += testcov1.d
DISABLED_COMPILABLE_TESTS += testfptr.d
DISABLED_COMPILABLE_TESTS += testInference.d
DISABLED_COMPILABLE_TESTS += testprofile.d
DISABLED_COMPILABLE_TESTS += testVRP.d
DISABLED_COMPILABLE_TESTS += xheader.d
endif

ifeq ($(OS),freebsd)
DISABLED_TESTS += dhry
# runnable/dhry.d(488): Error: undefined identifier dtime
endif

ifeq ($(OS),win32)
DISABLED_FAIL_TESTS += fail13939
endif

ifeq ($(OS),win64)
DISABLED_TESTS += testxmm
DISABLED_FAIL_TESTS += fail13939
endif

ifeq ($(OS),osx)
ifeq ($(MODEL),64)
DISABLED_TESTS += test6423
endif
endif

runnable_tests=$(wildcard runnable/*.d) $(wildcard runnable/*.sh)
runnable_test_results=$(addsuffix .out,$(addprefix $(RESULTS_DIR)/,$(runnable_tests)))

compilable_tests=$(wildcard compilable/*.d) $(wildcard compilable/*.sh)
compilable_test_results=$(addsuffix .out,$(addprefix $(RESULTS_DIR)/,$(compilable_tests)))

fail_compilation_tests=$(wildcard fail_compilation/*.d) $(wildcard fail_compilation/*.html)
fail_compilation_test_results=$(addsuffix .out,$(addprefix $(RESULTS_DIR)/,$(fail_compilation_tests)))

all: run_tests

$(addsuffix .out,$(addprefix $(RESULTS_DIR)/runnable/,$(DISABLED_TESTS))): $(RESULTS_DIR)/.created
	@echo " ... $@ - disabled"

$(addsuffix .out,$(addprefix $(RESULTS_DIR)/compilable/,$(DISABLED_COMPILABLE_TESTS))): $(RESULTS_DIR)/.created
	@echo " ... $@ - disabled"

ifeq (,$(USE_SHELL_TESTER))
$(RESULTS_DIR)/runnable/%.d.out: runnable/%.d $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) $(RESULTS_DIR)/d_do_test $(<D) $* d

$(RESULTS_DIR)/runnable/%.sh.out: runnable/%.sh $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) echo " ... $(<D)/$*.sh"
	$(QUIET) ./$(<D)/$*.sh

$(RESULTS_DIR)/compilable/%.d.out: compilable/%.d $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) $(RESULTS_DIR)/d_do_test $(<D) $* d

$(RESULTS_DIR)/compilable/%.sh.out: compilable/%.sh $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) echo " ... $(<D)/$*.sh"
	$(QUIET) ./$(<D)/$*.sh

$(addsuffix .d.out,$(addprefix $(RESULTS_DIR)/fail_compilation/,$(DISABLED_FAIL_TESTS))): $(RESULTS_DIR)/.created
	$(QUIET) echo " ... $@ - disabled"

$(RESULTS_DIR)/fail_compilation/%.d.out: fail_compilation/%.d $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) $(RESULTS_DIR)/d_do_test $(<D) $* d
else
$(RESULTS_DIR)/runnable/%.d.out: runnable/%.d $(RESULTS_DIR)/.created do_test.sh $(DMD)
	$(QUIET) ./do_test.sh $(<D) $* d

$(RESULTS_DIR)/runnable/%.html.out: runnable/%.html $(RESULTS_DIR)/.created do_test.sh $(DMD)
	$(QUIET) ./do_test.sh $(<D) $* html

$(RESULTS_DIR)/runnable/%.sh.out: runnable/%.sh $(RESULTS_DIR)/.created $(DMD)
	$(QUIET) echo " ... $(<D)/$*.sh"
	$(QUIET) ./$(<D)/$*.sh

$(RESULTS_DIR)/compilable/%.d.out: compilable/%.d $(RESULTS_DIR)/.created do_test.sh $(DMD)
	$(QUIET) ./do_test.sh $(<D) $* d

$(RESULTS_DIR)/fail_compilation/%.d.out: fail_compilation/%.d $(RESULTS_DIR)/.created do_test.sh $(DMD)
	$(QUIET) ./do_test.sh $(<D) $* d
endif

$(RESULTS_DIR)/fail_compilation/%.html.out: fail_compilation/%.html $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE) $(DMD)
	$(QUIET) $(RESULTS_DIR)/d_do_test $(<D) $* html

quick:
	$(MAKE) ARGS="" run_tests

clean:
	@echo "Removing output directory: $(RESULTS_DIR)"
	$(QUIET)if [ -e $(RESULTS_DIR) ]; then rm -rf $(RESULTS_DIR); fi

$(RESULTS_DIR)/.created:
	@echo Creating output directory: $(RESULTS_DIR)
	$(QUIET)if [ ! -d $(RESULTS_DIR) ]; then mkdir $(RESULTS_DIR); fi
	$(QUIET)if [ ! -d $(RESULTS_DIR)/runnable ]; then mkdir $(RESULTS_DIR)/runnable; fi
	$(QUIET)if [ ! -d $(RESULTS_DIR)/compilable ]; then mkdir $(RESULTS_DIR)/compilable; fi
	$(QUIET)if [ ! -d $(RESULTS_DIR)/fail_compilation ]; then mkdir $(RESULTS_DIR)/fail_compilation; fi
	$(QUIET)touch $(RESULTS_DIR)/.created

run_tests: start_runnable_tests start_compilable_tests start_fail_compilation_tests

run_runnable_tests: $(runnable_test_results)

start_runnable_tests: $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE)
	@echo "Running runnable tests"
	$(QUIET)$(MAKE) --no-print-directory run_runnable_tests

run_compilable_tests: $(compilable_test_results)

start_compilable_tests: $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE)
	@echo "Running compilable tests"
	$(QUIET)$(MAKE) --no-print-directory run_compilable_tests

run_fail_compilation_tests: $(fail_compilation_test_results)

start_fail_compilation_tests: $(RESULTS_DIR)/.created $(RESULTS_DIR)/d_do_test$(EXE)
	@echo "Running fail compilation tests"
	$(QUIET)$(MAKE) --no-print-directory run_fail_compilation_tests

ifeq (ARM,$(TARGET_CPU))
$(RESULTS_DIR)/d_do_test:
	touch $(RESULTS_DIR)/d_do_test
else
$(RESULTS_DIR)/d_do_test$(EXE): d_do_test.d $(RESULTS_DIR)/.created
	@echo "Building d_do_test tool"
	@echo "OS: $(OS)"
	$(QUIET)$(DMD) -conf= $(MODEL_FLAG) -unittest -run d_do_test.d -unittest
	$(QUIET)$(DMD) -conf= $(MODEL_FLAG) -od$(RESULTS_DIR) -of$(RESULTS_DIR)$(DSEP)d_do_test$(EXE) d_do_test.d
endif

$(RESULTS_DIR)/combinations: combinations.d
	@echo "Building combinations tool"
	$(QUIET)$(DMD) $(MODEL_FLAG) -od$(RESULTS_DIR) -of$(RESULTS_DIR)$(DSEP)combinations combinations.d

#./do_test.sh: $(RESULTS_DIR)/combinations

