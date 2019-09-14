CXX ?= c++
CXXFLAGS ?= -g
CXXFLAGS += -fPIC
CXXFLAGS += -DNDEBUG
SRC = ../src

all: stelo stelo.so

clean:
	rm -f stelo *.o *.so core

%.o: $(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c $<

steloCore.o: $(SRC)/steloCore.cpp $(SRC)/steloCore.h
steloScripts.o: $(SRC)/steloScripts.cpp $(SRC)/steloScripts.h $(SRC)/steloCore.h
steloCmds.o: $(SRC)/steloCmds.cpp $(SRC)/steloScripts.h $(SRC)/steloCore.h
main.o: $(SRC)/main.cpp $(SRC)/steloCore.h
StringList.o: $(SRC)/StringList.cpp $(SRC)/StringList.h
capi.o: $(SRC)/capi.cpp $(SRC)/steloCore.h

stelo: main.o steloCore.o steloScripts.o steloCmds.o StringList.o
	$(CXX) $(CXXFLAGS) -o $@ main.o steloCore.o steloScripts.o steloCmds.o StringList.o

stelo.so: capi.o steloCore.o steloScripts.o steloCmds.o StringList.o
	$(CXX) -shared $(CXXFLAGS) -o $@ capi.o steloCore.o steloScripts.o steloCmds.o StringList.o

