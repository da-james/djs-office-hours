# compiler
FC = gfortran

# compiler flags
# standard
CFLAGS = -std=f2008ts
# warning flags
CFLAGS += -Wall
# debugging options
CFLAGS += -fPIC -fmax-errors=3 -fcheck=all -fbacktrace
# GDB flag
CFLAGS += -g 

# source files
SRCS = mod_learn main
OBJS = $(SRCS:=.o)

# executable
MAIN = main

# compile project
all : $(MAIN)
	@echo Model compiled

$(MAIN)	: $(OBJS)
	$(FC) $(CFLAGS) -o $(MAIN) $(OBJS)

.SUFFIXES : .o .f90

.f90.o :
	$(FC) $(CFLAGS) -c $<

clean :
	$(RM) *.o *.so *.mod $(MAIN)