# makefile for Microsoft (Visual C++) NMAKE utility for compiling the application using the
# Microsoft compilers provided with the Microsoft Platform SDK 2003 download
# usage: nmake /F visualcpp.mak
# or :   nmake /F visualcpp.mak clean

#					These are the header files for the application
HDRFILES = \
	constants.h \
	gbm.h \
	classes.h \
	operations.h \
	globals.h \
	reconstruct.h \
	kube-gustavson-fft.h
#					Object files
OBJFILES = \
	contour.obj \
	nform.obj \
	adib.obj \
	image.obj \
	xmldata.obj \
	viewport.obj \
	section.obj \
	series.obj \
	kube-gustavson-fft.obj \
	vrmlobject.obj \
	vrmlobjects.obj \
	vrmlscene.obj \
	boissonnat.obj \
	sectionsinfo.obj \
	tformslifo.obj \
	threads.obj \
	palette.obj \
	program_menu.obj \
	series_menu.obj \
	section_menu.obj \
	domain_menu.obj \
	trace_menu.obj \
	objects_menu.obj \
	help_menu.obj \
	init.obj \
	end.obj \
	utility.obj \
	tools.obj \
	thumbnails.obj \
	keyboard.obj \
	mouse.obj \
	opengl.obj \
	globals.obj \
	reconstruct.obj \
	histogram.obj
#					Resource file (created from resource.rc)
RESFILES = reconstruct.res
#					Must explicitly list all SDK .lib files used
LIBFILES = \
	ngbm.lib \
	user32.lib \
	version.lib \
	gdi32.lib \
	opengl32.lib \
	comdlg32.lib \
	AdvAPI32.lib \
	bufferoverflowU.lib \
	comctl32.lib \
	htmlhelp.lib \
	urlmon.lib \
	shlwapi.lib

#			Set the Path environment variable to include two directories:
#			(for nmake and rc) C:\Program Files\Microsoft Platform SDK\Bin
#			(for VC++ compiler) C:\Program Files (x86)\Microsoft Visual Studio 8\Common7\IDE

#			For Win64-AMD64 using the Platform SDK use:

#COMPILER = "C:\Program Files\Microsoft Platform SDK\Bin\win64\x86\AMD64\cl"
#LINKER = "C:\Program Files\Microsoft Platform SDK\Bin\win64\x86\AMD64\link"
#RC = rc
#SDK_INCLUDE1="C:\Program Files\Microsoft Platform SDK\Include"
#SDK_INCLUDE2="C:\Program Files\Microsoft Platform SDK\Include\crt"
#SDK_LIB1="C:\Program Files\Microsoft Platform SDK\Lib\amd64"
#SDK_LIB2="C:\Program Files (x86)\Intel\Compiler\Fortran\10.0.025\em64t\Lib"
#MSGTXT = BUILT AS 64-BIT APPLICATION!

#			For Win32-x86 uncomment the following 32-bit tools:

COMPILER = "C:\Program Files\Microsoft Visual Studio 8\VC\bin\cl"
LINKER = "C:\Program Files\Microsoft Visual Studio 8\VC\bin\link"
RC = rc
SDK_INCLUDE1="C:\Program Files\Microsoft Platform SDK\Include"
SDK_INCLUDE2="C:\Program Files\Microsoft Visual Studio 8\VC\include"
SDK_LIB1="C:\Program Files\Microsoft Platform SDK\Lib"
SDK_LIB2="C:\Program Files\Microsoft Visual Studio 8\VC\Lib"
MSGTXT = BUILT AS 32-BIT APPLICATION!

CFLAGS  = /c /Zi /I$(SDK_INCLUDE1) /I$(SDK_INCLUDE2)
# /c   compile only, do not link
# /I   location of include files
# /Zi  include debugging information
# /EHsc assume synchronous exception handling model

LFLAGS  = /DEBUG /LIBPATH:$(SDK_LIB1) /LIBPATH:$(SDK_LIB2)
# /LIBPATH location of SDK libraries
# /DEBUG include debugging information

RFLAGS  = /I$(SDK_INCLUDE1)
# may need <windows.h> for MS RC to recognize some Windows constants

.SILENT:
all: reconstruct.exe

#			Build GUI application

reconstruct.exe : $(OBJFILES) $(RESFILES)
   $(LINKER) /OUT:reconstruct.exe $(LFLAGS) $(OBJFILES) $(LIBFILES) $(RESFILES)
   echo reconstruct.exe $(MSGTXT)

#			Compile C source files
.c.obj :
	$(COMPILER) $(CFLAGS) $<

#			Compile C++ source files
.cpp.obj :
	$(COMPILER) $(CFLAGS) $<

#			Compile resource files
.rc.res :
   $(RC) $(RFLAGS) $<

#			Dependencies:
#			 (if a header file changes, just recompile everthing)
*.c *.cpp : $(HDRFILES)
*.rc : constants.h

clean :
   del *.obj *.res *.bak
   echo reconstruct cleaned
