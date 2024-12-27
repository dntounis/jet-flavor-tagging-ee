# WHIZARD: Makefile for process library 'default_lib'
# Automatically generated file, do not edit

# Integrity check (don't modify the following line!)
MD5SUM = '1785F6EE465A8E5F510AB87F06B7BE6E'

# Library name
BASE = default_lib

# Compiler
FC = /cvmfs/sw.hsf.org/contrib/x86_64-almalinux9-gcc11.4.1-opt/gcc/14.2.0-yuyjov/bin/gfortran
CC = /cvmfs/sw.hsf.org/contrib/x86_64-almalinux9-gcc11.4.1-opt/gcc/14.2.0-yuyjov/bin/gcc

# Included libraries
FCINCL = -I/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib/mod/whizard -I/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib/mod/omega -I/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib/mod/models -I/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/openloops/2.1.2-eh75iu/lib_src/openloops/mod 

# Compiler flags
FCFLAGS =  -fopenmp  -g -O2
FCFLAGS_PIC =  -fPIC
CFLAGS = -g -O2
CFLAGS_PIC = 
LDFLAGS = -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib -lwhizard_main -lwhizard -lomega -I/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/libtirpc/1.3.3-db2ekl/include/tirpc -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/libtirpc/1.3.3-db2ekl/lib -ltirpc -Wl,-rpath,/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/hepmc3/3.3.0-c2oek4/lib -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/hepmc3/3.3.0-c2oek4/lib -lHepMC3  -Wl,-rpath,/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/lcio/c2db7a5cbf5afa883070d7ec3dc0484395bd71b2_develop-bedd2j/lib -Wl,-rpath,/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/lcio/c2db7a5cbf5afa883070d7ec3dc0484395bd71b2_develop-bedd2j/lib64 -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/lcio/c2db7a5cbf5afa883070d7ec3dc0484395bd71b2_develop-bedd2j/lib -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/lcio/c2db7a5cbf5afa883070d7ec3dc0484395bd71b2_develop-bedd2j/lib64 -llcio   -Wl,-rpath,/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/openloops/2.1.2-eh75iu/lib -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/openloops/2.1.2-eh75iu/lib -Wl,-rpath,/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/openloops/2.1.2-eh75iu/lib64 -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-09-21/x86_64-almalinux9-gcc14.2.0-opt/openloops/2.1.2-eh75iu/lib64 -lopenloops    -lomega -L/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib/whizard/models -lwhizard

# LaTeX setup
LATEX = latex -halt-on-error
MPOST = mpost --math=scaled -halt-on-error
DVIPS = dvips
PS2PDF = ps2pdf14
TEX_FLAGS = "/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/share/texmf/whizard:$$TEXINPUTS"
MP_FLAGS  = "/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/share/texmf/whizard:$$MPINPUTS"

# Libtool
LIBTOOL = /cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/lib/whizard/libtool
FCOMPILE = @$(LIBTOOL) --silent --tag=FC --mode=compile
CCOMPILE = @$(LIBTOOL) --silent --tag=CC --mode=compile
LINK = @$(LIBTOOL) --silent --tag=FC --mode=link

# Compile commands (default)
LTFCOMPILE = $(FCOMPILE) $(FC) -c $(FCINCL) $(FCFLAGS) $(FCFLAGS_PIC)
LTCCOMPILE = $(CCOMPILE) $(CC) -c $(CFLAGS) $(CFLAGS_PIC)

# Default target
all: link diags

# Matrix-element code files
SOURCES += procZ_i1.f90
OBJECTS += procZ_i1.lo
procZ_i1.f90:
	@echo  "  OMEGA     procZ_i1.f90"
	@/cvmfs/sw-nightlies.hsf.org/key4hep/releases/2024-12-27/x86_64-almalinux9-gcc14.2.0-opt/whizard/3.1.4-xqzlt3/bin/omega_SM.opt -o procZ_i1.f90 -target:whizard -target:parameter_module parameters_SM -target:module opr_procZ_i1 -target:md5sum 'FEA46B2406387C43D6412451A8EE3EF0' -target:openmp -fusion:progress -scatter 'e- e+ -> d dbar' 
clean-procZ_i1:
	@echo  "  RM        procZ_i1.f90,.mod,.lo"
	@rm -f procZ_i1.f90
	@rm -f opr_procZ_i1.mod
	@rm -f procZ_i1.lo
CLEAN_SOURCES += procZ_i1.f90
CLEAN_OBJECTS += opr_procZ_i1.mod
CLEAN_OBJECTS += procZ_i1.lo
procZ_i1.lo: procZ_i1.f90
	$(LTFCOMPILE) $<

# Library driver
$(BASE).lo: $(BASE).f90 $(OBJECTS)
	$(LTFCOMPILE) $<
	@echo  "  FC       " $@

# Library
$(BASE).la: $(BASE).lo $(OBJECTS)
	@echo  "  FCLD     " $@
	$(LINK) $(FC) -module -rpath /dev/null $(FCFLAGS) $(LDFLAGS) -o $(BASE).la $^

# Main targets
link: compile $(BASE).la
compile: source $(OBJECTS) $(TEX_OBJECTS) $(BASE).lo
compile_tex: $(TEX_OBJECTS)
source: $(SOURCES) $(BASE).f90 $(TEX_SOURCES)
.PHONY: link diags compile compile_tex source

# Specific cleanup targets
clean-procZ_i1:
.PHONY: clean-procZ_i1

# Generic cleanup targets
clean-library:
	@echo  "  RM        $(BASE).la"
	@rm -f $(BASE).la
clean-objects:
	@echo  "  RM        $(BASE).lo $(BASE)_driver.mod $(CLEAN_OBJECTS)"
	@rm -f $(BASE).lo $(BASE)_driver.mod $(CLEAN_OBJECTS)
clean-source:
	@echo  "  RM        $(CLEAN_SOURCES)"
	@rm -f $(CLEAN_SOURCES)
clean-driver:
	@echo  "  RM        $(BASE).f90"
	@rm -f $(BASE).f90
clean-makefile:
	@echo  "  RM        $(BASE).makefile"
	@rm -f $(BASE).makefile
.PHONY: clean-library clean-objects clean-source clean-driver clean-makefile

clean: clean-library clean-objects clean-source
distclean: clean clean-driver clean-makefile
.PHONY: clean distclean
