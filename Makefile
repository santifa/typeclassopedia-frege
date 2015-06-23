#
# A simple Makefile to compile plain frege projects
#

# define project name
PROJNAME := frege-typeclassopedia
# project dirs
SRCDIRS := src/main/frege
TSTDIRS := src/test/frege
BUILDDIR := build
SRCFILES := $(shell find $(SRCDIRS) -type f -name "*.fr")
TSTFILES := $(shell find $(TSTDIRS) -type f -name "*.fr")
AUXFILE := Readme.md Makefile
RUNFILES := com.santifa.TypeclassopediaTest

# define frege compiler
FCC=fregec.jar
FCCFLAGS=-v -d
J=java
JFLAGS=-Xss1m -jar
RUNFLAGS=-Xss1m -cp

# define rm
RM=rm -rf

.PHONY: clean

clean :
			-@$(RM) $(BUILDDIR)/*

all : $(PROJNAME)-src $(PROJNAME)-test

run : $(PROJNAME)-run

$(PROJNAME)-src : $(SRCFILES)
			 $(J) $(JFLAGS) $(FCC) $(FCCFLAGS) $(BUILDDIR)/ $?

$(PROJNAME)-test : $(TSTFILES)
			 $(J) $(JFLAGS) $(FCC) $(FCCFLAGS) $(BUILDDIR)/ $?

$(PROJNAME)-run : 
			 $(J) $(RUNFLAGS) $(BUILDDIR):$(FCC) $(RUNFILES)
