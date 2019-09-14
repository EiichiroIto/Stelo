#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include <cmath>
#include "debug.h"
#include "steloCore.h"

const char *variableTypeString[] = {"None", "Float", "Byte", "Word", "CFloat"};

bool fCloseTo(float x, float y)
{
  return fabs(x-y) < 0.0001;
}

/*
 * SColorList
 */

u_int8_t SColorList::random()
{
  return rand() % colors;
}

u_int8_t SColorList::scale(float value, float from, float to, u_int8_t color)
{
  if (from < to && value < from) {
    return SColorList::black;
  } else if (from < to && value > to) {
    return SColorList::white;
  } else if (from > to && value > from) {
    return SColorList::black;
  } else if (from > to && value < to) {
    return SColorList::white;
  }
  float param = (value - from) / (to - from);
  return ((color - 5) * (1 - param)) + ((color + 4) * param);
}

/*
 * SteloId
 */

SteloId::SteloId()
{
  _max = 0;
}

void SteloId::updateId(int id)
{
  if (id > _max) {
    _max = id;
  }
}

void SteloId::print(int indent) const
{
  printSpaces(indent);
  printf("SteloId max=%d, default=%d\n", _max, defaultCount());
}

/*
 * BreedId
 */

/*
 * EventId
 */

/*
 * VarId
 */

VarId::VarId()
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    _varName[i] = NULL;
  }
}

VarId::~VarId()
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_varName[i] != NULL) {
      delete _varName[i];
    }
  }
}

void VarId::reset()
{
  for (int i = defaultCount(); i < MAX_VARIABLES; i ++) {
    if (_varName[i] != NULL) {
      delete _varName[i];
      _varName[i] = NULL;
    }
  }
}

bool VarId::add(const char *str, int id)
{
  if (includes(str)) {
    return false;
  }
  if (id >= MAX_VARIABLES) {
    return false;
  }
  updateId(id);
  _varName[id-1] = new char[strlen(str) + 1];
  strcpy(_varName[id-1], str);
  return true;
}

bool VarId::includes(const char *str) const
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    const char *p = _varName[i];
    if (p == NULL) {
      continue;
    } else if (!strcmp(p, str)) {
      return true;
    }
  }
  return false;
}

int VarId::varFor(const char *str)
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_varName[i] == NULL) {
      continue;
    }
    if (!strcmp(_varName[i], str)) {
      return i;
    }
  }
  error("VarId::varFor VarId not found");
  return 0;
}

VariableType VarId::classForVar(int id) const
{
  return VT_Float;
}

int VarId::count() const
{
  int count = 0;
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_varName[i] != NULL) {
      count ++;
    }
  }
  return count;
}

void VarId::print(int indent) const
{
  printSpaces(indent);
  printf("VarId defaultCount=%d\n", defaultCount());
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    const char *p = _varName[i];
    if (p != NULL) {
      printSpaces(indent+2);
      printf("%d: %s\n", i+1, p);
    }
  }
}

/*
 * SObserverVarId
 */

SObserverVarId::SObserverVarId() : VarId()
{
  add("width", widthVarNo);
  add("height", heightVarNo);
  add("turtlesCount", turtlesCountVarNo);
  add("ticks", ticksVarNo);
}

/*
 * SPatchVarId
 */

SPatchVarId::SPatchVarId() : VarId()
{
  add("color", colorVarNo);
  add("screen", screenVarNo);
  add("x", xVarNo);
  add("y", yVarNo);
}

VariableType SPatchVarId::classForVar(int vno) const
{
  if (vno == colorVarNo || vno == screenVarNo) {
    return VT_Byte;
  } else if (vno == xVarNo || vno == yVarNo) {
    return VT_ComputedFloat;
  }
  return VarId::classForVar(vno);
}


STurtleVarId::STurtleVarId() : VarId()
{
  add("color", colorVarNo);
  add("flag", flagVarNo);
  add("x", xVarNo);
  add("y", yVarNo);
  add("heading", headingVarNo);
}

VariableType STurtleVarId::classForVar(int vno) const
{
  if (vno == flagVarNo) {
    return VT_Byte;
  } else if (vno == colorVarNo) {
    return VT_Byte;
  }
  return VarId::classForVar(vno);
}

/*
 * SVariables
 */

SVariables::SVariables()
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    _varType[i] = VT_None;
    _var[i] = NULL;
    _varName[i] = NULL;
  }
  _size = 0;
  _max = 0;
}

void SVariables::clear()
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_var[i] != NULL) {
      switch (_varType[i]) {
      case VT_None:
        error("SVariables::clear invalid varType");
        break;
      case VT_ComputedFloat:
        break;
      case VT_Float:
        delete[] (float *) _var[i];
        break;
      case VT_Byte:
        delete[] (u_int8_t *) _var[i];
        break;
      case VT_Word:
        delete[] (u_int32_t *) _var[i];
        break;
      }
    }
    _varType[i] = VT_None;
    _varName[i] = NULL;
    _var[i] = NULL;
  }
  _size = 0;
}

void SVariables::setupVarId(const VarId *aVarId, int initialSize)
{
  clear();
  _size = initialSize;
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    const char *nm = aVarId->varNameAt(i);
    if (nm == NULL) {
      continue;
    }
    if (_varName[i] != NULL || _varType[i] != VT_None) {
      debug("%d\n", i);
      error("SVariables::setupVarId");
    }
    _varName[i] = nm;
    _varType[i] = aVarId->classForVar(i+1);
    switch (_varType[i]) {
    case VT_Float:
      _var[i] = (void *) allocateFloatArray();
      break;
    case VT_Byte:
      _var[i] = (void *) allocateByteArray();
      break;
    case VT_Word:
      _var[i] = (void *) allocateWordArray();
      break;
    case VT_ComputedFloat:
      _var[i] = NULL;
      break;
    default:
      error("SVariables::setupVarId Invalid varType");
      break;
    }
  }
}

void SVariables::updateVarId(const VarId *aVarId)
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    const char *nm = aVarId->varNameAt(i);
    if (nm == NULL) {
      continue;
    }
    if (_varName[i] && !strcmp(_varName[i], nm)) {
      continue;
    }
    if (_varType[i] != VT_None) {
      debug("(%d) name1=%s, name2=%s type=%d\n", i, nm, _varName[i], _varType[i]);
      error("SVariables::updateVarId invalid varType");
    }
    _varType[i] = aVarId->classForVar(i+1);
    _varName[i] = nm;
    switch (_varType[i]) {
    case VT_Float:
      _var[i] = (void *) allocateFloatArray();
      break;
    case VT_Byte:
      _var[i] = (void *) allocateByteArray();
      break;
    case VT_Word:
      _var[i] = (void *) allocateWordArray();
      break;
    case VT_ComputedFloat:
      _var[i] = NULL;
      break;
    default:
      error("SVariables::updateVarId Invalid varType");
      break;
    }
  }
}

float *SVariables::allocateFloatArray()
{
  float *p = new float[_size];
  for (int i = 0; i < _size; i ++) {
    p[i] = 0;
  }
  return p;
}

u_int8_t *SVariables::allocateByteArray()
{
  u_int8_t *p = new u_int8_t[_size];
  for (int i = 0; i < _size; i ++) {
    p[i] = 0;
  }
  return p;
}

u_int32_t *SVariables::allocateWordArray()
{
  u_int32_t *p = new u_int32_t[_size];
  for (int i = 0; i < _size; i ++) {
    p[i] = 0;
  }
  return p;
}

void SVariables::allocateMore(int more)
{
  int newSize = ((_size + more + allocateStep - 1) / allocateStep) * allocateStep;
  if (_max != 0 && newSize > _max) {
    return;
  }
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_var[i] == NULL) {
      continue;
    }
    switch (_varType[i]) {
    case VT_None:
      error("SVariables::allocateMore invalid varType");
      break;
    case VT_ComputedFloat:
      break;
    case VT_Float:
      _var[i] = (void *) reallocateFloatArray((float *) _var[i], newSize);
      break;
    case VT_Byte:
      _var[i] = (void *) reallocateByteArray((u_int8_t *) _var[i], newSize);
      break;
    case VT_Word:
      _var[i] = (void *) reallocateWordArray((u_int32_t *) _var[i], newSize);
      break;
    }
  }
  _size = newSize;
}

VariableType SVariables::getType(int vno) const
{
  return _varType[vno-1];
}

float *SVariables::reallocateFloatArray(float *org, int newSize)
{
  float *p = new float[newSize];
  for (int i = 0; i < _size; i ++) {
    p[i] = org[i];
  }
  for (int i = _size; i < newSize; i ++) {
    p[i] = 0;
  }
  delete[] org;
  return p;
}

u_int8_t *SVariables::reallocateByteArray(u_int8_t *org, int newSize)
{
  u_int8_t *p = new u_int8_t[newSize];
  for (int i = 0; i < _size; i ++) {
    p[i] = org[i];
  }
  for (int i = _size; i < newSize; i ++) {
    p[i] = 0;
  }
  delete[] org;
  return p;
}

u_int32_t *SVariables::reallocateWordArray(u_int32_t *org, int newSize)
{
  u_int32_t *p = new u_int32_t[newSize];
  for (int i = 0; i < _size; i ++) {
    p[i] = org[i];
  }
  for (int i = _size; i < newSize; i ++) {
    p[i] = 0;
  }
  delete[] org;
  return p;
}

float SVariables::getFloat(int vno, int index) const
{
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::getFloat invalid type");
  } else if (index < 0 || index >= _size) {
    printf("vno=%d, index=%d, _size=%d\n", vno, index, _size);
    error("SVariables::getFloat invalid index");
    return 0;
  }
  return ((float *)_var[vno-1])[index];
}

const float *SVariables::getFloatAll(int vno) const
{
  debug("SVariables::getFloatAll(%d)\n", vno);
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::getFloat invalid type");
    return NULL;
  }
  debug("SVariables::getFloatAll _var=%p\n", _var[vno-1]);
  return (float *)_var[vno-1];
}

void SVariables::setFloat(int vno, int index, float value)
{
  debug("SVariables::setFloat(%d,%d,%f)\n", vno, index, value);
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::setFloat invalid type");
  } else if (index < 0 || index >= _size) {
    error("SVariables::setFloat invalid index");
    return;
  }
  debug("SVariables::setFloat _var=%p\n", _var[vno-1]);
  ((float *)_var[vno-1])[index] = value;
}

void SVariables::setFloatAll(int vno, const float *src, int count)
{
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::setFloatAll invalid type");
    return;
  }
  float *dst = (float *)_var[vno-1];
  for (int i = 0; i < min(_size, count); i ++) {
    *dst++ = *src++;
  }
}

void SVariables::fillFloat(int vno, float value)
{
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::fillFloat invalid type");
  }
  for (int i = 0; i < _size; i ++) {
    ((float *)_var[vno-1])[i] = value;
  }
}

u_int8_t SVariables::getByte(int vno, int index) const
{
  if (_varType[vno-1] != VT_Byte) {
    error("SVariables::getByte invalid type");
  } else if (index < 0 || index >= _size) {
    error("SVariables::getByte invalid index");
    return 0;
  }
  return ((u_int8_t *)_var[vno-1])[index];
}

const u_int8_t *SVariables::getByteAll(int vno) const
{
  if (_varType[vno-1] != VT_Byte) {
    error("SVariables::getByteAll: invalid variable");
    return NULL;
  }
  return (const u_int8_t *) _var[vno-1];
}

void SVariables::setByte(int vno, int index, u_int8_t value)
{
  if (_varType[vno-1] != VT_Byte) {
    error("SVariables::setByte invalid type");
  } else if (index < 0 || index >= _size) {
    printf("vno=%d, index=%d, value=%d, _size=%d\n", vno, index, value, _size);
    error("SVariables::setByte invalid index");
    return;
  }
  ((u_int8_t *)_var[vno-1])[index] = value;
}

void SVariables::setByteAll(int vno, const u_int8_t *buf, int count)
{
  if (_varType[vno-1] != VT_Byte) {
    error("SVariables::setByteAll invalid type");
    return;
  }
  memcpy((u_int8_t *)_var[vno-1], buf, min(_size, count));
}

void SVariables::fillByte(int vno, u_int8_t value)
{
  if (_varType[vno-1] != VT_Byte) {
    error("SVariables::fillByte invalid type");
  }
  memset((u_int8_t *)_var[vno-1], value, _size);
}

u_int32_t SVariables::getWord(int vno, int index) const
{
  if (_varType[vno-1] != VT_Word) {
    debug("vno=%d, index=%d, type=%d\n", vno, index, _varType[vno-1]);
    error("SVariables::getWord invalid type");
  } else if (index < 0 || index >= _size) {
    error("SVariables::getWord invalid index");
    return 0;
  }
  return ((u_int32_t *)_var[vno-1])[index];
}

const u_int32_t *SVariables::getWordAll(int vno) const
{
  if (_varType[vno-1] != VT_Word) {
    error("SVariables::getWord invalid type");
    return NULL;
  }
  return (u_int32_t *)_var[vno-1];
}

void SVariables::setWord(int vno, int index, u_int32_t value)
{
  if (_varType[vno-1] != VT_Word) {
    error("SVariables::setWord invalid type");
  } else if (index < 0 || index >= _size) {
    error("SVariables::setWord invalid index");
    return;
  }
  ((u_int32_t *)_var[vno-1])[index] = value;
}

void SVariables::setWordAll(int vno, const u_int32_t *src, int count)
{
  if (_varType[vno-1] != VT_Word) {
    error("SVariables::setWordAll invalid type");
    return;
  }
  u_int32_t *dst = (u_int32_t *)_var[vno-1];
  for (int i = 0; i < min(_size, count); i ++) {
    *dst++ = *src++;
  }
}

void SVariables::fillWord(int vno, u_int32_t value)
{
  if (_varType[vno-1] != VT_Word) {
    error("SVariables::fillWord invalid type");
  }
  for (int i = 0; i < _size; i ++) {
    ((u_int32_t *)_var[vno-1])[i] = value;
  }
}

void SVariables::print(int indent) const
{
  printSpaces(indent);
  printf("SVariables count=%d\n", _size);
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    if (_varType[i] == VT_None) {
      continue;
    }
    printSpaces(indent+2);
    printf("%d: %s,%s,%p\n", i+1, variableTypeString[_varType[i]], _varName[i], _var[i]);
  }
}

void SVariables::printValue(int vno, int index) const
{
  void *base = _var[vno-1];

  if (base == NULL) {
    error("SVariables::printValue invalid vno");
  }
  switch (_varType[vno-1]) {
  case VT_Float:
    printFloat(((float *) base)[index]);
    break;
  case VT_Byte:
    printHex(((u_int8_t *) base)[index]);
    break;
  case VT_Word:
    printHex(((u_int32_t *) base)[index]);
    break;
  default:
    printString("<?>");
    break;
  }
}

void SVariables::printValues(int vno, int w) const
{
  printString(_varName[vno-1]);
  printString("(");
  printString(variableTypeString[_varType[vno-1]]);
  printString(")\n");
  if (_varType[vno-1] == VT_None) {
    return;
  }
  for (int i = 0; i < _size; i ++) {
    printString(" ");
    printValue(vno, i);
    if (i % w == w - 1) {
      printString("\n");
    }
  }
  printString("\n");
}

void SVariables::printAllValues(int w) const
{
  for (int i = 0; i < MAX_VARIABLES; i ++) {
    printValues(i+1, w);
  }
}

void SVariables::printIndex(int index) const
{
  for (int vno = 1; vno <= MAX_VARIABLES; vno ++) {
    const char *name = _varName[vno-1];
    if (name == NULL) {
      continue;
    }
    printString(name);
    printString("=");
    printValue(vno, index);
    printString("\n");
  }
}

int SVariables::elementSize(int vno) const
{
  int size = 0;

  switch (_varType[vno-1]) {
  case VT_Float:
    size = sizeof (float);
    break;
  case VT_Byte:
    size = sizeof (u_int8_t);
    break;
  case VT_Word:
    size = sizeof (u_int32_t);
    break;
  default:
    break;
  }
  return size;
}

int SVariables::totalSize(int vno) const
{
  return _size * elementSize(vno);
}

void SVariables::copy(int from, int to)
{
  if (_varType[from-1] != _varType[to-1]) {
    error("SVariables::copy different type");
  }
  const void *src = _var[from-1];
  void *dst = _var[to-1];
  if (src == NULL) {
    error("SVariables::copy var[from] is NULL");
  }
  if (dst == NULL) {
    error("SVariables::copy var[to] is NULL");
  }
  memcpy(dst, src, totalSize(from));
}

float *SVariables::getFloatArray(int vno)
{
  if (_varType[vno-1] != VT_Float) {
    debug("vno=%d, type=%d\n", vno, _varType[vno-1]);
    error("SVariables::getFloatArray invalid type");
  }
  float *ptr = (float *) _var[vno-1];
  if (ptr == NULL) {
    error("SVariables::getFloatArray NULL");
  }
  return ptr;
}

void SVariables::multiplyBy(int vno, float mul)
{
  if (_varType[vno-1] != VT_Float) {
    error("SVariables::multiplyBy invalid type");
  }
  float *ptr = (float *) _var[vno-1];
  if (ptr == NULL) {
    error("SVariables::multiplyBy NULL");
  }
  for (int i = 0; i < _size; i ++) {
    *ptr++ *= mul;
  }
}

/*
 * SDiffuser
 */

SDiffuser::SDiffuser()
{
  _extended = NULL;
  _normal = NULL;
  _size = 0;
  _cols = 0;
  _rows = 0;
}

SDiffuser::~SDiffuser()
{
  clear();
}

void SDiffuser::clear()
{
  if (_extended != NULL) {
    delete[] _extended;
    _extended = NULL;
  }
  _size = 0;
  _cols = 0;
  _rows = 0;
}

void SDiffuser::allocate(int size)
{
  if (size > _size) {
    clear();
    _size = size;
    _extended = new float[_size];
    debug("SDiffuser::allocate allocated %d\n", _size);
  }
}

void SDiffuser::setupNsum(const float *src, float *dst, int cols, int rows, int neighborSize)
{
  allocate((cols + 2) * (rows + 2));
  _cols = cols;
  _rows = rows;
  setupNeighbor();
  _normal = dst;
  setupExtended(src);
  setupBorder();
  _neighborSize = neighborSize;
  debug("SDiffuser::setupNsum cols=%d rows=%d\n", _cols, _rows);
}

void SDiffuser::setupDiffuse(float *buf, int cols, int rows, int neighborSize)
{
  allocate((cols + 2) * (rows + 2));
  _cols = cols;
  _rows = rows;
  setupNeighbor();
  _normal = buf;
  clearExtended();
  _neighborSize = neighborSize;
  debug("SDiffuser::setupDiffuse cols=%d rows=%d\n", _cols, _rows);
}

void SDiffuser::setupExtended(const float *src)
{
  int count = 0;
  for (int x = 0; x < _cols + 2; x ++) {
    _extended[count ++] = 0;
  }
  for (int y = 0; y < _rows; y ++) {
    _extended[count ++] = 0;
    for (int x = 0; x < _cols; x ++) {
      _extended[count ++] = *src++;
    }
    _extended[count ++] = 0;
  }
  for (int x = 0; x < _cols + 2; x ++) {
    _extended[count ++] = 0;
  }
  if (count != _size) {
    debug("count=%d, size=%d, cols=%d rows=%d\n", count, _size, _cols, _rows);
    error("SDiffuser::setupSrc: internal error");
  }
}

void SDiffuser::clearExtended()
{
  for (int i = 0; i < (_cols + 2) * (_rows + 2); i ++) {
    _extended[i] = 0;
  }
}

int SDiffuser::indexOfExtended(int x, int y) const
{
  return (x + 1) + ((y + 1) * (_cols + 2));
}

int SDiffuser::indexOfNormal(int x, int y) const
{
  return x + (y * _cols);
}

void SDiffuser::setupNeighbor()
{
  neighbor[0] = 1;
  neighbor[1] = -1;
  neighbor[2] = _cols + 2;
  neighbor[3] = - (_cols + 2);
  neighbor[4] = _cols + 1;
  neighbor[5] = _cols + 3;
  neighbor[6] = - (_cols + 1);
  neighbor[7] = - (_cols + 3);
}

void SDiffuser::setupBorder()
{
  int src = indexOfExtended(0, 0);
  int dst = indexOfExtended(0, _rows);
  for (int i = 0; i < _cols; i ++) {
    _extended[dst ++] = _extended[src ++];
  }
  src = indexOfExtended(0, _rows - 1);
  dst = indexOfExtended(0, -1);
  for (int i = 0; i < _cols; i ++) {
    _extended[dst ++] = _extended[src ++];
  }
  src = indexOfExtended(_cols - 1, 0);
  dst = indexOfExtended(-1, 0);
  for (int i = 0; i < _rows; i ++) {
    _extended[dst] = _extended[src];
    dst += _cols + 2;
    src += _cols + 2;
  }
  src = indexOfExtended(0, 0);
  dst = indexOfExtended(_cols, 0);
  for (int i = 0; i < _rows; i ++) {
    _extended[dst] = _extended[src];
    dst += _cols + 2;
    src += _cols + 2;
  }
  src = indexOfExtended(0, 0);
  dst = indexOfExtended(_cols, _rows);
  _extended[dst] = _extended[src];
  src = indexOfExtended(_cols-1, _rows-1);
  dst = indexOfExtended(-1, -1);
  _extended[dst] = _extended[src];
  src = indexOfExtended(_cols-1, 0);
  dst = indexOfExtended(-1, _rows);
  _extended[dst] = _extended[src];
  src = indexOfExtended(0, _rows-1);
  dst = indexOfExtended(_cols, -1);
  _extended[dst] = _extended[src];
}

void SDiffuser::nsum()
{
  for (int y = 0; y < _rows; y ++) {
    int srcOffset = indexOfExtended(0, y);
    int dstOffset = indexOfNormal(0, y);
    for (int x = 0; x < _cols; x ++) {
      int sum = 0;
      for (int i = 0; i < _neighborSize; i ++) {
        sum += _extended[srcOffset + neighbor[i]];
      }
      srcOffset ++;
      _normal[dstOffset ++] = sum;
    }
  }
}

void SDiffuser::nsum4(const float *src, float *dst, int cols, int rows)
{
  setupNsum(src, dst, cols, rows, 4);
  nsum();
}

void SDiffuser::nsum8(const float *src, float *dst, int cols, int rows)
{
  setupNsum(src, dst, cols, rows, 8);
  nsum();
}

void SDiffuser::diffuse(float percent)
{
  for (int y = 0; y < _rows; y ++) {
    int srcOffset = indexOfNormal(0, y);
    int dstOffset = indexOfExtended(0, y);
    for (int x = 0; x < _cols; x ++) {
      float data = _normal[srcOffset];
      float use = data / 100.0 * percent;
      float distributes = use / _neighborSize;
      _extended[dstOffset] += data - use;
      for (int i = 0; i < _neighborSize; i ++) {
        _extended[dstOffset + neighbor[i]] += distributes;
      }
      srcOffset ++;
      dstOffset ++;
    }
  }
}

void SDiffuser::restoreExtended(float *buf)
{
  int src, dst;

  for (int y = 0; y < _rows; y ++) {
    src = indexOfExtended(0, y);
    dst = indexOfNormal(0, y);
    for (int x = 0; x < _cols; x ++) {
      buf[dst ++] = _extended[src ++];
    }
  }
  src = indexOfExtended(0, -1);
  dst = indexOfNormal(0, _rows - 1);
  for (int x = 0; x < _cols; x ++) {
    buf[dst ++] += _extended[src ++];
  }
  src = indexOfExtended(0, _rows);
  dst = indexOfNormal(0, 0);
  for (int x = 0; x < _cols; x ++) {
    buf[dst ++] += _extended[src ++];
  }
  src = indexOfExtended(-1, 0);
  dst = indexOfNormal(_cols - 1, 0);
  for (int y = 0; y < _rows; y ++) {
    buf[dst] += _extended[src];
    src += _cols + 2;
    dst += _cols;
  }
  src = indexOfExtended(_cols, 0);
  dst = indexOfNormal(0, 0);
  for (int y = 0; y < _rows; y ++) {
    buf[dst] += _extended[src];
    src += _cols + 2;
    dst += _cols;
  }
  src = indexOfExtended(_cols, _rows);
  dst = indexOfNormal(0, 0);
  buf[dst] += _extended[src];
  src = indexOfExtended(-1, -1);
  dst = indexOfNormal(_cols - 1, _rows - 1);
  buf[dst] += _extended[src];
  src = indexOfExtended(-1, _rows);
  dst = indexOfNormal(_cols - 1, 0);
  buf[dst] += _extended[src];
  src = indexOfExtended(_cols, -1);
  dst = indexOfNormal(0, _rows - 1);
  buf[dst] += _extended[src];
}

void SDiffuser::diffuse4(float *buf, int cols, int rows, float percent)
{
  setupDiffuse(buf, cols, rows, 4);
  diffuse(percent);
  restoreExtended(buf);
}

void SDiffuser::diffuse8(float *buf, int cols, int rows, float percent)
{
  setupDiffuse(buf, cols, rows, 8);
  diffuse(percent);
  restoreExtended(buf);
}

void SDiffuser::printExtended() const
{
  if (_extended == NULL) {
    return;
  }
  for (int i = 0; i < _size; i ++) {
    printString(" ");
    printf(" %2.2f", _extended[i]);
    if (i % (_cols+2) == (_cols+2) - 1) {
      printString("\n");
    }
  }
  printString("\n");
}

void SDiffuser::printNeighbor() const
{
  printf("neighbor:");
  for (int i = 0; i < _neighborSize; i ++) {
    printf(" %d", neighbor[i]);
  }
  printf("\n");
}

/*
 * SBreed
 */

SBreed::SBreed()
{
  _varId = NULL;
  _variables = NULL; 
}

SBreed::~SBreed()
{
  if (_varId != NULL) {
    delete _varId;
  }
  if (_variables != NULL) {
    delete _variables;
  }
}

void SBreed::print(int indent) const
{
  //  if (_varId != NULL) {
  //    _varId->print();
  //  }
  if (_variables != NULL) {
    _variables->print(indent+2);
  }
}

VariableType SBreed::getType(int vno) const
{
  return _variables->getType(vno);
}

float SBreed::getFloat(int vno, int index) const
{
  return _variables->getFloat(vno, index);
}

const float *SBreed::getFloatAll(int vno) const
{
  return _variables->getFloatAll(vno);
}

void SBreed::setFloat(int vno, int index, float value)
{
  _variables->setFloat(vno, index, value);
}

void SBreed::setFloatAll(int vno, const float *buf, int count)
{
  _variables->setFloatAll(vno, buf, count);
}

u_int8_t SBreed::getByte(int vno, int index) const
{
  return _variables->getByte(vno, index);
}

const u_int8_t *SBreed::getByteAll(int vno) const
{
  return _variables->getByteAll(vno);
}

void SBreed::setByte(int vno, int index, u_int8_t value)
{
  _variables->setByte(vno, index, value);
}

void SBreed::setByteAll(int vno, const u_int8_t *buf, int count)
{
  _variables->setByteAll(vno, buf, count);
}

u_int32_t SBreed::getWord(int vno, int index) const
{
  return _variables->getWord(vno, index);
}

const u_int32_t *SBreed::getWordAll(int vno) const
{
  return _variables->getWordAll(vno);
}

void SBreed::setWord(int vno, int index, u_int32_t value)
{
  _variables->setWord(vno, index, value);
}

void SBreed::setWordAll(int vno, const u_int32_t *buf, int count)
{
  _variables->setWordAll(vno, buf, count);
}

bool SBreed::getFlag(int vno, int bit, int index) const
{
  return _variables->getByte(vno, index) & (1 << bit);
}

void SBreed::setFlag(int vno, int bit, int index, bool value)
{
  u_int32_t v = _variables->getByte(vno, index);
  if (value) {
    v |= 1 << bit;
  } else {
    v &= ~(1 << bit);
  }
  _variables->setByte(vno, index, v);
}

bool SBreed::addVariable(const char *str, int vno)
{
  if (!_varId->add(str, vno)) {
    return false;
  }
  _variables->updateVarId(_varId);
  return vno;
}

void SBreed::scaleColor(int vno, float from, float to, u_int8_t baseColor, int index)
{
  float value = getFloat(vno, index);
  u_int8_t color = SColorList::scale(value, from, to, baseColor);
  setColor(index + 1, color);
}

/*
 * SPatches
 */

SPatches::SPatches()
{
  _varId = new SPatchVarId();
  _variables = new SVariables();
  create(defaultOrder);
}

void SPatches::create(int order)
{
  _rows = _cols = order;
  _variables->setupVarId(_varId, _rows * _cols);
  clear();
}

void SPatches::clear()
{
  SPatchVarId *s = (SPatchVarId *)_varId;
  _variables->fillByte(s->colorVarNo, SColorList::black);
  for (int vno = s->userDefinedId(); vno <= s->count(); vno ++ ) {
    _variables->fillFloat(vno, 0);
  }
}

void SPatches::reset()
{
  info("SPatches::reset");
  _varId->reset();
  create(defaultOrder);
}

void SPatches::print(int indent) const
{
  printSpaces(indent);
  printf("Patches rows=%d, cols=%d, defaultOrder=%d\n", _rows, _cols, defaultOrder);
  SBreed::print(indent);
}

void SPatches::printDetails() const
{
  _variables->printAllValues(_cols);
}

void SPatches::printScreen() const
{
  _variables->printValues(((SPatchVarId *)_varId)->screenVarNo, _cols);
}

int SPatches::indexAtPoint(float x, float y) const
{
  x = normalizeX(x);
  y = normalizeY(y);
  int index = (((int) floor(y) + (_cols / 2)) * _cols) + (int) floor(x) + (_rows / 2);
  while (index < 0) {
    index += size();
  }
  index %= size();
  return index + 1;
}

u_int8_t SPatches::getColor(int pno) const
{
  return _variables->getByte(((SPatchVarId *)_varId)->colorVarNo, pno - 1);
}

void SPatches::setColor(int pno, u_int8_t color) {
  _variables->setByte(((SPatchVarId *)_varId)->colorVarNo, pno - 1, SColorList::normalize(color));
}

void SPatches::setColor(float x, float y, u_int8_t color)
{
  int pno = indexAtPoint(x, y);
  setColor(pno, color);
}

float SPatches::getX(int pno) const
{
  return (float) (((pno - 1) % _cols) - (_cols / 2));
}

float SPatches::getY(int pno) const
{
  return (float) (((pno - 1) / _rows) - (_rows / 2));
}

float SPatches::normalizeX(float x) const
{
  x = fmodf(x, _cols);
  if (x >= (_cols / 2) ) {
    x -= _cols;
  }
  return x;
}

float SPatches::normalizeY(float y) const
{
  y = fmodf(y, _rows);
  if (y >= (_rows / 2) ) {
    y -= _rows;
  }
  return y;
}

void SPatches::initScreen()
{
  SPatchVarId *s = (SPatchVarId *)_varId;
  _variables->copy(s->colorVarNo, s->screenVarNo);
}

void SPatches::setScreen(float x, float y, int color)
{
  int pno = indexAtPoint(x, y);
  _variables->setByte(((SPatchVarId *)_varId)->screenVarNo, pno - 1, color);
}

const u_int8_t *SPatches::getScreen() const
{
  return _variables->getByteAll(((SPatchVarId *)_varId)->screenVarNo);
}

void SPatches::nsum4(int from, int to)
{
  float *src = _variables->getFloatArray(from);
  float *dst = _variables->getFloatArray(to);
  _diffuser.nsum4(src, dst, _cols, _rows);
}

void SPatches::nsum8(int from, int to)
{
  float *src = _variables->getFloatArray(from);
  float *dst = _variables->getFloatArray(to);
  _diffuser.nsum8(src, dst, _cols, _rows);
}

void SPatches::diffuse4(int vno, float percent)
{
  float *buf = _variables->getFloatArray(vno);
  _diffuser.diffuse4(buf, _cols, _rows, percent);
}

void SPatches::diffuse8(int vno, float percent)
{
  float *buf = _variables->getFloatArray(vno);
  _diffuser.diffuse8(buf, _cols, _rows, percent);
}

void SPatches::multiplyBy(int vno, float mul)
{
  _variables->multiplyBy(vno, mul);
}

void SPatches::scaleColorAll(int vno, float from, float to, u_int8_t baseColor)
{
  float *buf = _variables->getFloatArray(vno);
  for (int i = 0; i < size(); i ++) {
    u_int8_t color = SColorList::scale(buf[i], from, to, baseColor);
    setColor(i + 1, color);
  }
}

/*
 * STurtles
 */

STurtles::STurtles()
{
  _varId = new STurtleVarId();
  _variables = new SVariables();
  _variables->setupVarId(_varId, defaultSize);
  clear();
  _defaultColor = SColorList::random();
}

void STurtles::clear()
{
  STurtleVarId *s = (STurtleVarId *)_varId;
  _variables->fillByte(s->flagVarNo, 0);
  _defaultX = _defaultY = 0;
}

void STurtles::reset()
{
  info("STurtles::reset");
  _varId->reset();
  clear();
}

void STurtles::print(int indent) const
{
  printSpaces(indent);
  printf("Turtles defaultSize=%d alive=%d\n", defaultSize, countAlive());
  SBreed::print(indent);
}

void STurtles::printDetails() const
{
  _variables->printAllValues(10);
}

void STurtles::printIndex(int tno) const
{
  _variables->printIndex(tno - 1);
}

void STurtles::create(int num)
{
  debug("STurtles::create num=%d\n", num);
  debug("size=%d\n", size());
  int rest = num;
  if (rest <= 0) {
    return;
  }
  for (int i = 1; i <= size(); i ++) {
    if (!getAlive(i)) {
      setupTurtle(i);
      if (-- rest == 0) {
        return;
      }
    }
  }
  int pos = size() + 1;
  debug("rest=%d, pos=%d\n", rest, pos);
  _variables->allocateMore(rest);
  for (int i = pos; i <= size(); i ++) {
    kill(i);
  }
  debug("size=%d\n", size());
  while (rest --) {
    if (pos < size()) {
      setupTurtle(pos++);
    } else {
      return;
    }
  }
}

void STurtles::setupTurtle(int tno)
{
  setColor(tno, _defaultColor);
  setFlag(tno, 1 << ((STurtleVarId *)_varId)->aliveFlagNo);
  setX(tno, _defaultX);
  setY(tno, _defaultY);
  setHeading(tno, rand() % 360);
}

void STurtles::kill(int tno)
{
  SBreed::setFlag(((STurtleVarId *)_varId)->flagVarNo, ((STurtleVarId *)_varId)->aliveFlagNo, tno - 1, false);
}

u_int8_t STurtles::getColor(int tno) const
{
  return _variables->getByte(((STurtleVarId *)_varId)->colorVarNo, tno - 1);
}

bool STurtles::getAlive(int tno) const
{
  return SBreed::getFlag(((STurtleVarId *)_varId)->flagVarNo, ((STurtleVarId *)_varId)->aliveFlagNo, tno - 1);
}

float STurtles::getX(int tno) const
{
  return _variables->getFloat(((STurtleVarId *)_varId)->xVarNo, tno - 1);
}

float STurtles::getY(int tno) const
{
  return _variables->getFloat(((STurtleVarId *)_varId)->yVarNo, tno - 1);
}

float STurtles::getHeading(int tno) const
{
  return _variables->getFloat(((STurtleVarId *)_varId)->headingVarNo, tno - 1);
}

bool STurtles::getPenDown(int tno) const
{
  return getFlag(((STurtleVarId *)_varId)->flagVarNo, ((STurtleVarId *)_varId)->penDownFlagNo, tno - 1);
}

void STurtles::getDelta(int tno, float *pdx, float *pdy) const
{
  float deg = getHeading(tno);
  float rad = deg_to_rad(deg);
  *pdx = cos(rad);
  *pdy = sin(rad);
}

void STurtles::setColor(int tno, u_int8_t c)
{
  _variables->setByte(((STurtleVarId *)_varId)->colorVarNo, tno - 1, SColorList::normalize(c));
}

void STurtles::setFlag(int tno, u_int32_t v)
{
  _variables->setByte(((STurtleVarId *)_varId)->flagVarNo, tno - 1, v);
}

void STurtles::setX(int tno, float x)
{
  _variables->setFloat(((STurtleVarId *)_varId)->xVarNo, tno - 1, x);
}

void STurtles::setY(int tno, float y)
{
  _variables->setFloat(((STurtleVarId *)_varId)->yVarNo, tno - 1, y);
}

void STurtles::setHeading(int tno, float deg)
{
  deg = fmod(deg, 360);
  _variables->setFloat(((STurtleVarId *)_varId)->headingVarNo, tno - 1, deg);
}

void STurtles::setPenDown(int tno, bool b)
{
  SBreed::setFlag(((STurtleVarId *)_varId)->flagVarNo, ((STurtleVarId *)_varId)->penDownFlagNo, tno - 1, b);
}

int STurtles::countAlive() const
{
  int ret = 0;
  for (int i = 1; i <= size(); i ++) {
    if (getAlive(i)) {
      ret ++;
    }
  }
  return ret;
}

void STurtles::hatch(int tno)
{
  for (int i = 1; i <= size(); i ++) {
    if (!getAlive(i)) {
      setupTurtle(i);
      setColor(i, getColor(tno));
      setX(i, getX(tno));
      setY(i, getY(tno));
      setHeading(i, getHeading(tno));
      setPenDown(i, getPenDown(tno));
      return;
    }
  }
  int pos = size() + 1;
  _variables->allocateMore(1);
  for (int i = pos; i <= size(); i ++) {
    kill(i);
  }
  if (pos <= size()) {
    setupTurtle(pos);
    setColor(pos, getColor(tno));
    setX(pos, getX(tno));
    setY(pos, getY(tno));
    setHeading(pos, getHeading(tno));
    setPenDown(pos, getPenDown(tno));
  }
}

int STurtles::turtleAt(int x, int y, int exceptId) const
{
  for (int i = 1; i <= size(); i ++) {
    if (!getAlive(i)) {
      continue;
    }
    if (i == exceptId) {
      continue;
    }
    if ((int) getX(i) == x && (int) getY(i) == y) {
      return i;
    }
  }
  return 0;
}

void STurtles::setDefaultXY(float x, float y)
{
  _defaultX = x;
  _defaultY = y;
}

/*
 * SMicroWorld
 */

SMicroWorld::SMicroWorld()
{
  _maxTurtles = defaultMaxTurtles;
  _maxPatchOrder = defaultMaxPatchOrder;
  _raisedEvents = 0;
  for (int i = 0; i < MAX_BREEDS; i ++) {
    _breeds[i] = NULL;
  }
  SPatches *ps = new SPatches;
  ps->setMax(_maxPatchOrder*_maxPatchOrder);
  _breeds[BreedId::patchBreedNo - 1] = ps;
  reset();
}

void SMicroWorld::reset()
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo - 1];
  ps->reset();
  for (int i = BreedId::turtleBreedNo - 1; i < MAX_BREEDS; i ++) {
    STurtles *ts = (STurtles *)_breeds[i];
    if (ts) {
      delete ts;
      _breeds[i] = NULL;
    }
  }
  _breedId.reset();
  _ticks = 0;
}

void SMicroWorld::print(int indent) const
{
  printSpaces(indent);
  printf("MicroWorld maxTurtles=%d, maxPatchOrder=%d\n", _maxTurtles, _maxPatchOrder);
  _breedId.print(indent+2);
  for (int bno = 1; bno <= MAX_BREEDS; bno ++) {
    if (_breeds[bno-1] == NULL) {
      continue;
    }
    printSpaces(indent+2);
    printf("bno=%d\n", bno);
    _breeds[bno-1]->print(indent+4);
  }
}

void SMicroWorld::printDetails() const
{
  for (int i = 0; i < MAX_BREEDS; i ++) {
    if (_breeds[i] == NULL) {
      continue;
    }
    _breeds[i]->printDetails();
  }
}

void SMicroWorld::printScreen() const
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  ps->printScreen();
}

void SMicroWorld::printTurtle(int bno, int tno) const
{
  ((STurtles *)_breeds[bno-1])->printIndex(tno);
}

void SMicroWorld::createPatch(int order)
{
  for (int bno = BreedId::turtleBreedNo; bno <= MAX_BREEDS; bno ++) {
    STurtles *ts = (STurtles *) _breeds[bno-1];
    if (ts == NULL) {
      continue;
    }
    ts->clear();
  }
  ((SPatches *)_breeds[BreedId::patchBreedNo - 1])->create(min(order, _maxPatchOrder));
}

void SMicroWorld::createTurtles(int bno, int num)
{
  debug("SMicroWorld::createTurtles bno=%d num=%d\n", bno, num);
  if (bno <= BreedId::patchBreedNo) {
    error("SMicroWorld::createTurtles breedId must be more than 2");
    return;
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::createTurtles invalid breedId");
    return;
  }
  ts->create(num);
}

void SMicroWorld::forward(int bno, int tno, float step)
{
  if (bno <= BreedId::patchBreedNo) {
    error("SMicroWorld::forward invalid bno");
    return;
  }
  if (tno <= 0 || tno > size(bno)) {
    error("SMicroWorld::forward invalid index");
    return;
  }
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  STurtles *ts = (STurtles *) _breeds[bno-1];
  bool penDown = ts->getPenDown(tno);
  u_int8_t c = ts->getColor(tno);
  float x = ts->getX(tno);
  float y = ts->getY(tno);
  float dx, dy;
  ts->getDelta(tno, &dx, &dy);
  for (int i = 0; i < (int) step; i ++) {
    if (penDown) {
      ps->setColor(x, y, c);
    }
    x += dx;
    y += dy;
    x = ps->normalizeX(x);
    y = ps->normalizeY(y);
  }
  if (penDown) {
    ps->setColor(x, y, c);
  }
  float rest = step - (int) step;
  if (!fCloseTo(rest, 0)) {
    x += rest * dx;
    y += rest * dy;
    x = ps->normalizeX(x);
    y = ps->normalizeY(y);
  }
  ts->setX(tno, x);
  ts->setY(tno, y);
}

const u_int8_t *SMicroWorld::getScreen()
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  if (ps == NULL) {
    error("SMicroWorld::getScreen patch is NULL");
  }
  ps->initScreen();
  for (int bno = BreedId::turtleBreedNo; bno <= MAX_BREEDS; bno ++) {
    STurtles *ts = (STurtles *) _breeds[bno-1];
    if (ts == NULL) {
      continue;
    }
    for (int i = 1; i <= ts->size(); i ++) {
      if (ts->getAlive(i)) {
        float x = ts->getX(i);
        float y = ts->getY(i);
        u_int8_t c = ts->getColor(i);
        ps->setScreen(x, y, c);
      }
    }
  }
  return (const u_int8_t*) ps->getScreen();
}

int SMicroWorld::getCols() const
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  return ps->getCols();
}

int SMicroWorld::getRows() const
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  return ps->getRows();
}

int SMicroWorld::size(int bno) const
{
  if (bno == BreedId::observerBreedNo) {
    return 1;
  } else if (bno == BreedId::patchBreedNo) {
    SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
    return ps->size();
  }
  STurtles *ts = (STurtles *) _breeds[bno-1];
  return ts->size();
}

int SMicroWorld::getAlive(int bno, int tno) const
{
  if (bno == BreedId::observerBreedNo) {
    return true;
  } else if (bno == BreedId::patchBreedNo) {
    return true;
  }
  STurtles *ts = (STurtles *) _breeds[bno-1];
  if (ts == NULL) {
    return false;
  }
  return ts->getAlive(tno);
}

void SMicroWorld::setupBreed(int bno)
{
  if (bno == BreedId::observerBreedNo) {
    return;
  } else if (bno == BreedId::patchBreedNo) {
    return;
  }
  if (_breeds[bno-1] != NULL) {
    debug("bno=%d\n", bno);
    error("SMicroWorld::newBreed invalid bno");
    return;
  }
  _breedId.updateId(bno);
  STurtles *ts = new STurtles;
  ts->setMax(_maxTurtles);
  _breeds[bno-1] = ts;
}

void SMicroWorld::clearPatches()
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  if (ps == NULL) {
    error("SMicroWorld::clearPatches invalid pointer");
  }
  ps->clear();
}

void SMicroWorld::clearTurtles()
{
  for (int bno = BreedId::turtleBreedNo; bno <= MAX_BREEDS; bno ++) {
    STurtles *ts = (STurtles *) _breeds[bno-1];
    if (ts == NULL) {
      continue;
    }
    ts->clear();
  }
}

VariableType SMicroWorld::getType(int bno, int vno) const
{
  if (bno == BreedId::observerBreedNo) {
    return VT_ComputedFloat;
  }
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getType invalid bno");
    return VT_None;
  }
  return bs->getType(vno);
}

float SMicroWorld::getFloat(int bno, int vno, int index) const
{
  if (bno == BreedId::observerBreedNo) {
    switch (vno) {
    case SObserverVarId::widthVarNo:
      return getCols();
    case SObserverVarId::heightVarNo:
      return getRows();
    case SObserverVarId::turtlesCountVarNo:
      error("SMicroWorld::getFloat SObserverVarId::turtlesCountVarNo");
      return 0;
    case SObserverVarId::ticksVarNo:
      return _ticks;
    default:
      error("SMicroWorld::getFloat invalid variable");
      break;
    }
  } else if (bno == BreedId::patchBreedNo) {
    SPatches *ps = (SPatches *) _breeds[bno-1];
    if (ps == NULL) {
      error("SMicroWorld::getFloat invalid bno");
    }
    switch (vno) {
    case SPatchVarId::colorVarNo:
      return (float) ps->getColor(index);
    case SPatchVarId::xVarNo:
      return ps->getX(index);
    case SPatchVarId::yVarNo:
      return ps->getY(index);
    default:
      return ps->getFloat(vno, index - 1);
    }
  } else {
    STurtles *ts = (STurtles *) _breeds[bno-1];
    if (ts == NULL) {
      error("SMicroWorld::getFloat invalid bno");
    }
    return ts->getFloat(vno, index - 1);
  }
}

const float *SMicroWorld::getFloatAll(int bno, int vno) const
{
  debug("SMicroWorld::getFloatAll(%d,%d)\n", bno, vno);
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getFloatAll invalid bno");
    return NULL;
  }
  return bs->getFloatAll(vno);
}

void SMicroWorld::setFloat(int bno, int vno, int index, float value)
{
  debug("SMicroWorld::setFloat(%d,%d,%d,%f)\n", bno, vno, index, value);
  if (bno == BreedId::observerBreedNo) {
    switch (vno) {
    case SObserverVarId::widthVarNo:
    case SObserverVarId::heightVarNo:
    case SObserverVarId::turtlesCountVarNo:
      break;
    case SObserverVarId::ticksVarNo:
      _ticks = (int) value;
      break;
    default:
      error("SMicroWorld::setFloat invalid variable");
      break;
    }
    return;
  } else if (bno == BreedId::patchBreedNo) {
    SPatches *ps = (SPatches *) _breeds[bno-1];
    if (ps == NULL) {
      error("SMicroWorld::getFloat invalid bno");
    }
    ps->setFloat(vno, index - 1, value);
  } else {
    STurtles *ts = (STurtles *) _breeds[bno-1];
    if (ts == NULL) {
      error("SMicroWorld::getFloat invalid bno");
    }
    ts->setFloat(vno, index - 1, value);
  }
}

void SMicroWorld::setFloatAll(int bno, int vno, const float *buf, int count)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setFloat invalid bno");
    return;
  }
  bs->setFloatAll(vno, buf, count);
}

u_int8_t SMicroWorld::getByte(int bno, int vno, int index) const
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getByte invalid bno");
    return 0;
  }
  return bs->getByte(vno, index - 1);
}

const u_int8_t *SMicroWorld::getByteAll(int bno, int vno) const
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getByteAll invalid bno");
    return NULL;
  }
  return bs->getByteAll(vno);
}

void SMicroWorld::setByte(int bno, int vno, int index, u_int8_t value)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setByte invalid bno");
    return;
  }
  bs->setByte(vno, index - 1, value);
}

void SMicroWorld::setByteAll(int bno, int vno, const u_int8_t *buf, int count)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setByteAll invalid bno");
    return;
  }
  bs->setByteAll(vno, buf, count);
}

u_int32_t SMicroWorld::getWord(int bno, int vno, int index) const
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getWord invalid bno");
    return false;
  }
  return bs->getWord(vno, index - 1);
}

const u_int32_t *SMicroWorld::getWordAll(int bno, int vno) const
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::getWordAll invalid bno");
    return NULL;
  }
  return bs->getWordAll(vno);
}

void SMicroWorld::setWord(int bno, int vno, int index, u_int32_t value)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setWord invalid bno");
    return;
  }
  bs->setWord(vno, index - 1, value);
}

void SMicroWorld::setWordAll(int bno, int vno, const u_int32_t *buf, int count)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setWordAll invalid bno");
    return;
  }
  bs->setWordAll(vno, buf, count);
}

void SMicroWorld::setHeading(int bno, int tno, float deg)
{
  if (bno <= BreedId::patchBreedNo) {
    error("SMicroWorld::setHeading must be a turtle");
    return;
  }
  STurtles *ts = (STurtles *) _breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::setHeading invalid bno");
  }
  ts->setHeading(tno, deg);
}

void SMicroWorld::setColor(int bno, int index, u_int8_t color)
{
  SBreed *bs = _breeds[bno-1];
  if (bs == NULL) {
    error("SMicroWorld::setColor invalid bno");
  }
  bs->setColor(index, color);
}

void SMicroWorld::getDelta(int bno, int index, float *pdx, float *pdy) const
{
  if (bno <= BreedId::patchBreedNo) {
    error("SMicroWorld::getDelta must be a turtle");
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::getDelta invalid bno");
  }
  ts->getDelta(index, pdx, pdy);
}

void SMicroWorld::kill(int bno, int tno)
{
  if (bno <= BreedId::patchBreedNo) {
    error("SMicroWorld::kill must be a turtle");
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::kill invalid bno");
  }
  ts->kill(tno);
}

int SMicroWorld::indexAtPoint(float x, float y) const
{
  SPatches *ps = (SPatches *) _breeds[BreedId::patchBreedNo-1];
  if (ps == NULL) {
    error("SMicroWorld::indexAtPoint invalid pointer");
  }
  return ps->indexAtPoint(x, y);
}

int SMicroWorld::countAlive(int bno) const
{
  int count = 0;
  if (bno == BreedId::observerBreedNo) {
    count = 1;
  } else if (bno == BreedId::patchBreedNo) {
    SPatches *ps = (SPatches *)_breeds[bno-1];
    count = ps->countAlive();
  } else if (bno >= BreedId::turtleBreedNo) {
    STurtles *ts = (STurtles *)_breeds[bno-1];
    if (ts != NULL) {
      count = ts->countAlive();
    }
  }
  return count;
}

bool SMicroWorld::isActiveBreed(int bno) const
{
  if (bno == BreedId::observerBreedNo) {
    return true;
  }
  return _breeds[bno-1] != NULL;
}

int SMicroWorld::maxVarNo(int bno) const
{
  return _breeds[bno-1]->maxVarNo();
}

bool SMicroWorld::addVariable(int bno, const char *str, int vno)
{
  if (bno == BreedId::observerBreedNo) {
    return false;
  }
  return _breeds[bno-1]->addVariable(str, vno);
}

void SMicroWorld::clearRaisedEvents()
{
  _raisedEvents = 0;
}

void SMicroWorld::raiseEvent(int eno)
{
  debug("SMicroWorld::raiseEvent eno=%d\n", eno);
  _raisedEvents |= 1 << (eno - 1);
}

bool SMicroWorld::existsRaisedEvent() const
{
  return _raisedEvents != 0;
}

void SMicroWorld::nsum4(int from, int to)
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
  ps->nsum4(from, to);
}

void SMicroWorld::nsum8(int from, int to)
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
  ps->nsum8(from, to);
}

void SMicroWorld::diffuse4(int vno, float percent)
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
  ps->diffuse4(vno, percent);
}

void SMicroWorld::diffuse8(int vno, float percent)
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
  ps->diffuse8(vno, percent);
}

void SMicroWorld::hatch(int bno, int tno)
{
  if (bno < BreedId::turtleBreedNo) {
    error("SMicroWorld::hatch must be a turtle");
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::hatch invalid bno");
  }
  ts->hatch(tno);
}

int SMicroWorld::turtleAt(int bno, int x, int y, int exceptId) const
{
  if (bno < BreedId::turtleBreedNo) {
    error("SMicroWorld::turtleAt must be a turtle");
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::turtleAt invalid bno");
  }
  return ts->turtleAt(x, y, exceptId);
}

void SMicroWorld::multiplyBy(int vno, float mul)
{
  SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
  ps->multiplyBy(vno, mul);
}

void SMicroWorld::scaleColor(int vno, int bno, float from, float to, u_int8_t color, int index)
{
  if (bno == BreedId::observerBreedNo) {
    SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
    ps->scaleColorAll(vno, from, to, color);
  } else if (bno == BreedId::patchBreedNo) {
    SPatches *ps = (SPatches *)_breeds[BreedId::patchBreedNo-1];
    ps->scaleColor(vno, from, to, color, index - 1);
  } else {
    STurtles *ts = (STurtles *)_breeds[bno - 1];
    if (ts == NULL) {
      debug("bno=%d\n", bno);
      error("SMicroWorld::scaleColor NULL");
    }
    ts->scaleColor(vno, from, to, color, index - 1);
  }
}

float SMicroWorld::patchVarHeading(int vno, float x, float y, float heading) const
{
  float rad = deg_to_rad(heading);
  x += 1.5 * cos(rad);
  y += 1.5 * sin(rad);
  int pno = indexAtPoint(x, y);
  return getFloat(BreedId::patchBreedNo, vno, pno - 1);
}

float SMicroWorld::aimHighPatchVar(int vno, float x, float y, float heading) const
{
  float forward = patchVarHeading(vno, x, y, heading);
  float left = patchVarHeading(vno, x, y, heading + 45);
  float right = patchVarHeading(vno, x, y, heading - 45);
  if (forward >= left && forward >= right) {
    return 0;
  } else if (left >= right) {
    return 45;
  } else {
    return -45;
  }
}

void SMicroWorld::setDefaultTurtleXY(int bno, float x, float y)
{
  if (bno < BreedId::turtleBreedNo) {
    error("SMicroWorld::setDefaultTurtleXY must be a turtle");
    return;
  }
  STurtles *ts = (STurtles *)_breeds[bno-1];
  if (ts == NULL) {
    error("SMicroWorld::setDefaultTurtleXY invalid bno");
    return;
  }
  ts->setDefaultXY(x, y);
}

void SMicroWorld::incrementTicks()
{
  _ticks ++;
}

