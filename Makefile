PROC=loadmap
O1=MAPReader
O2=stdafx

# required for GetAsyncKeyState() on Windows only
ifdef __NT__
STDLIBS += User32.lib
endif

include ../plugin.mak

# Explicit compile rules for source files
$(F)loadmap$(O): LoadMap.cpp MAPReader.h stdafx.h
	$(strip $(QCXX)$(CXX) $(CXXFLAGS) $(NORTTI) $(CONLY) $(OBJSW)$@ $<)

$(F)MAPReader$(O): MAPReader.cpp MAPReader.h
	$(strip $(QCXX)$(CXX) $(CXXFLAGS) $(NORTTI) $(CONLY) $(OBJSW)$@ $<)

$(F)stdafx$(O): stdafx.cpp stdafx.h
	$(strip $(QCXX)$(CXX) $(CXXFLAGS) $(NORTTI) $(CONLY) $(OBJSW)$@ $<)

$(PROC): NO_OBSOLETE_FUNCS =
$(F)loadmap$(O): NO_OBSOLETE_FUNCS =
