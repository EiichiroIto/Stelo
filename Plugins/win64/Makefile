CXX = x86_64-w64-mingw32-gcc
CXXFLAGS ?= -g
#CXXFLAGS += -DWindowsDLL
CXXFLAGS += -fPIC -static-libgcc
#CXXFLAGS += -I$(HOME)/working/m5stack/ArduinoJson/ -w
SRC = ../src

all: stelo64.dll

clean:
	rm -f stelo.exe stelo64.dll *.o *.dll core

%.o: $(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c $<

#parser.o: $(SRC)/parser.cpp $(SRC)/steloCore.h $(SRC)/steloScripts.h
steloCore.o: $(SRC)/steloCore.cpp $(SRC)/steloCore.h
steloScripts.o: $(SRC)/steloScripts.cpp $(SRC)/steloScripts.h $(SRC)/steloCore.h
steloCmds.o: $(SRC)/steloCmds.cpp $(SRC)/steloScripts.h $(SRC)/steloCore.h
main.o: $(SRC)/main.cpp $(SRC)/steloCore.h
StringList.o: $(SRC)/StringList.cpp $(SRC)/StringList.h
capi.o: $(SRC)/capi.cpp $(SRC)/steloCore.h

stelo.exe: main.o steloCore.o steloScripts.o steloCmds.o StringList.o
	$(CXX) $(CXXFLAGS) -o $@ main.o steloCore.o steloScripts.o steloCmds.o StringList.o

stelo64.dll: capi.o steloCore.o steloScripts.o steloCmds.o StringList.o
	$(CXX) -shared $(CXXFLAGS) -o $@ capi.o steloCore.o steloScripts.o steloCmds.o StringList.o -static -lstdc++ -lgcc -lwinpthread -Wl,-k,--output-def,Dlltest.def,--out-implib,libtest.a
