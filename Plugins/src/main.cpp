#ifndef REAL_M5STACK
#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include <cmath>
#include "steloCore.h"
#include "steloScripts.h"

SMicroWorld world;

extern void testSample1();
extern void testSample2();
extern void testSample3();
extern void testSample4();
extern void testSample5();

int main()
{
  return 0;
}

void info(const char *str)
{
  printf("info: %s\n", str);
}

void error(const char *str)
{
  printf("error=%s\n", str);
  exit(0);
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

#if 0
void testSample4()
{
  const char life[] = "{\"title\":\"life3\",\"breeds\":[{\"breed\":1,\"variables\":[],\"codes\":[{\"event\":1,\"list\":[\"*12\"]},{\"event\":3,\"list\":[\"6\",\"5\",\"*49\"]}]},{\"breed\":2,\"variables\":[\"count\",\"life\"],\"codes\":[{\"event\":3,\"list\":[\"6\",\"*32\",\"1\",\"*25\",\"30\",\"*37\",\"5\",\"*32\",\"2\",\"*25\",\"5\",\"*32\",\"3\",\"*25\",\"*51\",\"25\",\"*37\",\"6\",\"1\",\"*61\",\"15\",\"*58\",\"30\",\"*36\",\"6\",\"0\",\"*61\",\"0\",\"*58\"]},{\"event\":3,\"list\":[\"6\",\"*32\",\"0\",\"*25\",\"25\",\"*37\",\"5\",\"*32\",\"3\",\"*25\",\"20\",\"*37\",\"6\",\"1\",\"*61\",\"15\",\"*58\",\"25\",\"*36\",\"6\",\"0\",\"*61\",\"0\",\"*58\"]},{\"event\":2,\"list\":[\"5\",\"0\",\"*61\",\"1\",\"10\",\"*54\",\"5\",\"*40\",\"18\",\"*37\",\"6\",\"1\",\"*61\",\"15\",\"*58\",\"23\",\"*36\",\"6\",\"0\",\"*61\",\"0\",\"*58\"]}]},{\"breed\":3,\"variables\":[\"deltaX\",\"deltaY\"],\"codes\":[]}]}";
  const char fire[] = "{\"title\":\"fire2\",\"breeds\":[{\"breed\":1,\"variables\":[],\"codes\":[]},{\"breed\":2,\"variables\":[],\"codes\":[{\"event\":2,\"list\":[\"0\",\"*58\",\"1\",\"100\",\"*54\",\"65\",\"*40\",\"12\",\"*37\",\"55\",\"*58\",\"*33\",\"0\",\"1\",\"1\",\"1\",\"*30\",\"2\",\"*20\",\"*44\",\"*25\",\"26\",\"*37\",\"105\",\"*58\",\"*33\",\"1\",\"1\",\"1\",\"*30\",\"2\",\"*20\",\"1\",\"*44\",\"*25\",\"40\",\"*37\",\"105\",\"*58\",\"*34\",\"0\",\"1\",\"2\",\"1\",\"*30\",\"2\",\"*20\",\"*44\",\"*25\",\"54\",\"*37\",\"105\",\"*58\",\"*34\",\"1\",\"2\",\"1\",\"*30\",\"2\",\"*20\",\"1\",\"*44\",\"*25\",\"68\",\"*37\",\"105\",\"*58\",\"*33\",\"1\",\"1\",\"1\",\"1\",\"*30\",\"2\",\"*20\",\"*44\",\"*25\",\"*34\",\"1\",\"1\",\"2\",\"1\",\"*30\",\"2\",\"*20\",\"*44\",\"*25\",\"*5\",\"93\",\"*37\",\"15\",\"*58\"]},{\"event\":3,\"list\":[\"1\",\"*32\",\"55\",\"*25\",\"71\",\"*37\",\"-1\",\"*33\",\"*53\",\"0\",\"*34\",\"*53\",\"*52\",\"1\",\"2\",\"*30\",\"15\",\"*25\",\"23\",\"*37\",\"15\",\"*58\",\"1\",\"*33\",\"*53\",\"0\",\"*34\",\"*53\",\"*52\",\"1\",\"2\",\"*30\",\"15\",\"*25\",\"39\",\"*37\",\"15\",\"*58\",\"0\",\"*33\",\"*53\",\"1\",\"*34\",\"*53\",\"*52\",\"1\",\"2\",\"*30\",\"15\",\"*25\",\"55\",\"*37\",\"15\",\"*58\",\"0\",\"*33\",\"*53\",\"-1\",\"*34\",\"*53\",\"*52\",\"1\",\"2\",\"*30\",\"15\",\"*25\",\"71\",\"*37\",\"15\",\"*58\"]}]},{\"breed\":3,\"variables\":[\"deltaX\",\"deltaY\"],\"codes\":[]}]}";

  printf("phase1\n");
  world.createPatch(10);
  world.setupBreed(3);

  printf("phase4\n");
  SProgram *program = parseProgram(life, &world);
  world.createTurtles(3, 10);
  program->print(0);
  world.print(0);
  printf("phase5\n");
  SProcess process(world, *program);
  process.print(0);
  process.startup();
  printf("phase6\n");
  process.print(0);
  process.step();
  process.print(0);
  process.step();
  process.print(0);
  world.getScreen();
  world.printScreen();
  process.loop();
  //process.print(0);
  while ( 1 ) {
    process.step();
    world.getScreen();
    world.printScreen();
    printf("alive=%d\n", world.countAlive(3));
  }
}

void testSample3()
{
  float test1[3*3] = {0,0,0,2,1,0,0,0,0};
  float test2[3*3] = {0,0,0,0,0,0,0,0,0};
  SDiffuser diffuser;
  diffuser.nsum4(test1, test2, 3, 3);
  diffuser.printNeighbor();
  diffuser.printExtended();
  for (int i = 0; i < 9; i ++) {
    printf(" % .2f", test2[i]);
    if (i % 3 == 2) {
      printf("\n");
    }
  }
  printf("\n");
  diffuser.nsum8(test1, test2, 3, 3);
  diffuser.printNeighbor();
  diffuser.printExtended();
  for (int i = 0; i < 9; i ++) {
    printf(" % .2f", test2[i]);
    if (i % 3 == 2) {
      printf("\n");
    }
  }
  printf("\n");
}


void testSample1()
{
  SCode code;
  world.setupBreed(3);

  code.clear();
  code.addByte(50);
  code.addByte(SS_createPatch);
  code.addByte(5.0);
  code.addByte(3.0);
  code.addByte(SS_createTurtles);
  code.print(0);
  SThread thread(world);
  thread.forBreed(0, 0);
  thread.code(code);
  //thread.execute();

  //world.createPatch(100);
  //world.createTurtles(3, 1);
  world.print(0);
  world.printTurtle(3, 0);

  code.clear();
  code.addByte(0);
  code.addByte(140);
  code.addByte(SS_randomFromTo);
  code.addByte(SS_setColorTo);
  code.print(0);
  for (int i = 0; i < world.size(3); i ++) {
    if (world.getAlive(3, i)) {
      SThread thread(world);
      thread.forBreed(3, i);
      thread.code(code);
      //thread.execute();
    }
  }
#if 0
  code.clear()
  code.addByte(2.0);
  //SetSymbol(code[1], SS_Forward);
  code.addByte((float) STurtleVarId::headingVarId);
  SetSymbol(code[2], SS_GetVar);
  SetSymbol(code[3], SS_Plus);
  SetSymbol(code[4], SS_SetHeading);

  for (int i = 0; i < 3; i ++) {
    SThread thread(world);
    thread.forTurtle(3, 0);
    thread.execute(code, 5);
    world.printTurtle(3, 0);
  }
#endif
}


void testForward1()
{
  printf("A\n");
  world.print(0);
  world.createPatch(100);
  printf("B\n");
  world.print(0);
  world.createTurtles(3, 100);
  //world.createTurtles(3, 1);
  printf("C\n");
  world.print(0);
  world.printTurtle(3, 0);
  printf("D\n");
  for (int i = 0; i < world.size(3); i ++) {
    if (world.getAlive(3, i)) {
      printf("forward(%d)\n", i);
      world.forward(3, i, 1);
    }
  }
  printf("E\n");
  world.printTurtle(3, 0);
}

void testPatches()
{
  SPatches patches;
  patches.print(0);
  patches.printDetails();
  patches.setColor(0,0,10);
  patches.setColor(-1.2,2.3,9);
  patches.printDetails();
}

void testTurtles()
{
  STurtles turtles;
  turtles.print(0);
  turtles.printDetails();
  turtles.create(2);
  turtles.printDetails();
  turtles.create(2);
  turtles.kill(1);
  turtles.printDetails();
}

#endif
#endif /* REAL_M5STACK */
