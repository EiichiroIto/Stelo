#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include <cmath>
#include "debug.h"
#include "steloCore.h"
#include "steloScripts.h"

SMicroWorld world;
SProgram *program = NULL;
SProcess *process = NULL;
char errorMessage[1024] = "";

extern SProgram *parseProgram(const char json[], SMicroWorld *world);

void info(const char *str)
{
  printf("info: %s\n", str);
}

void error(const char *str)
{
  printf("error=%s\n", str);
  strcpy(errorMessage, str);
}

void printString(const char *str)
{
  printf("%s", str);
}

void printHex(int num)
{
  printf("%2x", num);
}

void printFloat(float num)
{
  printf("%.2f", num);
}

void printSpaces(int num)
{
  printf("%*s", num, "");
}

void clearTicks()
{
  world.setFloat(BreedId::observerBreedNo, SObserverVarId::ticksVarNo, 0, 0);
}

void incrementTicks()
{
  world.incrementTicks();
}

extern "C" {
  char *getError();
  void clearError();
  void createPatch(int num);
  void createTurtles(int breed, int num);
  void setProgram(const u_int8_t *codes, int size);
  void addEntryPoint(int eno, int bno, int address);
  void startup();
  void loop();
  void single();
  void step();
  void stop();
  bool isRunning();
  u_int8_t *getScreen();
  void reset();
  void setupBreed(int bno);
  bool addVariable(int bno, const char *str, int vno);
  void forward(int bno, int tno, float step);
  int getType(int bno, int vno);
  float getFloat(int bno, int vno, int tno);
  float *getFloatAll(int bno, int vno);
  void setFloat(int bno, int vno, int tno, float value);
  void setFloatAll(int bno, int vno, const float *buf, int count);
  u_int8_t getByte(int bno, int vno, int tno);
  u_int8_t *getByteAll(int bno, int vno);
  void setByte(int bno, int vno, int tno, u_int8_t value);
  void setByteAll(int bno, int vno, const u_int8_t *buf, int count);
  u_int32_t getWord(int bno, int vno, int tno);
  u_int32_t *getWordAll(int bno, int vno);
  void setWord(int bno, int vno, int tno, u_int32_t value);
  void setWordAll(int bno, int vno, const u_int32_t *buf, int count);
  void clearPatches();
  void clearTurtles();
  int patchIndex(float x, float y);
  void setDefaultTurtleXY(int bno, float x, float y);
};

char *getError()
{
  return errorMessage;
}

void clearError()
{
  *errorMessage = '\0';
}

void clearProgram()
{
  if (program != NULL) {
    delete program;
    program = NULL;
  }
  if (process != NULL) {
    delete process;
    process = NULL;
  }
}

void createPatch(int num)
{
  debug("createPatch(%d)\n", num);
  world.createPatch(num);
}

void createTurtles(int breed, int num)
{
  debug("createTurtles(%d,%d)\n", breed, num);
  world.createTurtles(breed, num);
}

void setProgram(const u_int8_t *codes, int size)
{
  //printf("setProgram size=%d\n", size);
  clearProgram();
  program = new SProgram;
  program->setCodes(codes, size);
}

void addEntryPoint(int eno, int bno, int address)
{
  if (program == NULL) {
    debug("addEntryPoint program is NULL");
    return;
  }
  //printf("addEntryPoint eno=%d bno=%d address=%d\n", eno, bno, address);
  program->addEntryPoint(eno, bno, address - 1);
}

void startup()
{
  info("startup");
  if (program == NULL) {
    printf("startup program NULL\n");
    return;
  }
  program->print(0);
  if (process != NULL) {
    delete process;
  }
  process = new SProcess(world, *program);
  clearTicks();
  process->startup();
}

void loop()
{
  info("loop");
  if (program == NULL) {
    printf("loop program NULL\n");
    return;
  }
  program->print(0);
  if (process != NULL) {
    delete process;
  }
  process = new SProcess(world, *program);
  process->loop();
}

void single()
{
  info("single");
  if (program == NULL) {
    printf("single program NULL\n");
    return;
  }
  program->print(0);
  if (process != NULL) {
    delete process;
  }
  process = new SProcess(world, *program);
  process->single();
}

void step()
{
  if (process == NULL) {
    return;
  }
  if (process->step()) {
    incrementTicks();
  }
}

void stop()
{
  if (process == NULL) {
    return;
  }
  process->stop();
}

bool isRunning()
{
  if (process == NULL) {
    return false;
  }
  return process->isRunning();
}

u_int8_t *getScreen()
{
  return (u_int8_t*) world.getScreen();
}

void reset()
{
  debug("reset()\n");
  clearError();
  if (isRunning()) {
    stop();
  }
  clearProgram();
  world.reset();
}

void setupBreed(int bno)
{
  debug("setupBreed(%d)\n", bno);
  world.setupBreed(bno);
}

bool addVariable(int bno, const char *str, int vno)
{
  debug("addVariable(%d,%s,%d)\n", bno, str, vno);
  return world.addVariable(bno, str, vno);
}

void forward(int bno, int tno, float step)
{
  world.forward(bno, tno, step);
}

int getType(int bno, int vno)
{
  debug("getType(%d,%d)\n", bno, vno);
  return (int) world.getType(bno, vno);
}

float getFloat(int bno, int vno, int tno)
{
  debug("getFloat(%d,%d,%d)\n", bno, vno, tno);
  return world.getFloat(bno, vno, tno);
}

float *getFloatAll(int bno, int vno)
{
  debug("getFloatAll(%d,%d)\n", bno, vno);
  return (float *) world.getFloatAll(bno, vno);
}

void setFloat(int bno, int vno, int tno, float value)
{
  debug("setFloat(%d,%d,%d,%f)\n", bno, vno, tno, value);
  world.setFloat(bno, vno, tno, value);
}

void setFloatAll(int bno, int vno, const float *buf, int count)
{
  world.setFloatAll(bno, vno, buf, count);
}

u_int8_t getByte(int bno, int vno, int tno)
{
  return world.getByte(bno, vno, tno);
}

u_int8_t *getByteAll(int bno, int vno)
{
  return (u_int8_t *) world.getByteAll(bno, vno);
}

void setByte(int bno, int vno, int tno, u_int8_t value)
{
  world.setByte(bno, vno, tno, value);
}

void setByteAll(int bno, int vno, const u_int8_t *buf, int count)
{
  world.setByteAll(bno, vno, buf, count);
}

u_int32_t getWord(int bno, int vno, int tno)
{
  return world.getWord(bno, vno, tno);
}

u_int32_t *getWordAll(int bno, int vno)
{
  return (u_int32_t *) world.getWordAll(bno, vno);
}

void setWord(int bno, int vno, int tno, u_int32_t value)
{
  world.setWord(bno, vno, tno, value);
}

void setWordAll(int bno, int vno, const u_int32_t *buf, int count)
{
  world.setWordAll(bno, vno, buf, count);
}

void clearPatches()
{
  world.clearPatches();
}

void clearTurtles()
{
  world.clearTurtles();
}

int patchIndex(float x, float y)
{
  return world.indexAtPoint(x, y);
}

void setDefaultTurtleXY(int bno, float x, float y)
{
  world.setDefaultTurtleXY(bno, x, y);
}
