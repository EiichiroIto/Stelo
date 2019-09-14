#include <stdio.h>
#include <string.h>
#include "StringList.h"

extern void error(const char *str);
extern void info(const char *str);

/*
 * StringList
 */

StringList::StringList()
{
  buffer = NULL;
  bufsize = 0;
  next = 0;
  linebuf = NULL;
  linesize = 0;
  count = 0;
  valuebuf = NULL;
}

void StringList::Setup(int total, int lines)
{
  if (buffer == NULL) {
    buffer = new char[total];
    bufsize = total;
  }
  if (linebuf == NULL) {
    linesize = lines;
    linebuf = new int[lines];
    valuebuf = new int[lines];
  }
  next = 0;
  count = 0;
}

StringList::~StringList()
{
  if (valuebuf) {
    delete[] valuebuf;
  }
  if (linebuf) {
    delete[] linebuf;
  }
  if (buffer) {
    delete[] buffer;
  }
}

void StringList::Add(const char *str, int value)
{
  int len = strlen(str);
  if (next + len + 1 > bufsize) {
    error("StringList::Add buffer overflow");
  }
  if (count + 1 >= linesize) {
    error("StringList::Add lines overflow");
  }
  valuebuf[count] = value;
  linebuf[count++] = next;
  strcpy(&buffer[next], str);
  next += len + 1;
}

void StringList::Clear()
{
  next = 0;
  count = 0;
}

const char *StringList::operator[](int index) const
{
  if (index < 0 || index >= count) {
    error("StringList[] invalid index");
  }
  return &buffer[linebuf[index]];
}

void StringList::Rewind()
{
  iterateIndex = 0;
}

bool StringList::Iterate(char *&str, int &value)
{
  if (iterateIndex >= count) {
    return false;
  }
  value = valuebuf[iterateIndex];
  str = &buffer[linebuf[iterateIndex++]];
  return true;
}

int StringList::ValueOf(int index) const
{
  if (index < 0 || index >= count) {
    error("StringList::ValueOf invalid index");
  }
  return valuebuf[index];
}
