#define MAX_VARIABLES 16
#define MAX_BREEDS 16

#ifndef u_int8_t
typedef unsigned char u_int8_t;
typedef unsigned int u_int32_t;
#endif /* u_int8_t */

extern void info(const char *str);
extern void error(const char *str);
extern void printString(const char *str);
extern void printHex(int num);
extern void printFloat(float num);
extern void printSpaces(int num);

extern bool fCloseTo(float x, float y);

#define boolString(b) ((b)?"true":"false")
#ifndef min
#define min(x,y) ((x)<(y)?(x):(y))
#endif /* min */
#ifndef M_PI
#define M_PI (3.14159265358979)
#endif /* M_PI */
#define deg_to_rad(deg) (((deg)/360)*2*M_PI)
#define rad_to_deg(rad) (((rad)/2/M_PI)*360)

enum VariableType { VT_None=0, VT_Float, VT_Byte, VT_Word, VT_ComputedFloat };

class SColorList {
 public:
  const static u_int8_t black = 0;
  const static u_int8_t white = 9;
  const static int colors = 140;
  static u_int8_t random();
  static u_int8_t normalize(u_int8_t color) { return color % colors; }
  static u_int8_t scale(float value, float from, float to, u_int8_t color);
};

class SteloId {
 protected:
  int _max;

  virtual int defaultCount() const { return 0; }

 public:
  SteloId();
  void updateId(int n);
  int max() const { return _max; }
  virtual void print(int indent) const;
};

class BreedId : public SteloId {
 private:
  int defaultCount() const { return patchBreedNo; }

 public:
  const static int observerBreedNo = 1;
  const static int patchBreedNo = 2;
  const static int turtleBreedNo = 3;

  void reset() { _max = patchBreedNo; }
};

class EventId : public SteloId {
 private:
  int defaultCount() const { return singleEventNo; }

 public:
  const static int startupEventNo = 1;
  const static int setupEventNo = 2;
  const static int loopEventNo = 3;
  const static int singleEventNo = 4;
  const static int maxEventNo = 32;
  void reset() { _max = singleEventNo; }
};

class VarId : public SteloId {
 private:
  char *_varName[MAX_VARIABLES];

 public:
  VarId();
  virtual ~VarId();
  void reset();
  bool add(const char *str, int id);
  int add(const char *str);
  bool includes(const char *str) const;
  int varFor(const char *str);
  virtual VariableType classForVar(int id) const;
  void del(const char *str);
  int count() const;
  const char * varNameAt(int x) const { return _varName[x]; }
  int userDefinedId() const { return defaultCount() + 1; }
  void print(int indent) const;
};

class SObserverVarId : public VarId {
 private:
  int defaultCount() const { return maxVarNo; }

 public:
  SObserverVarId();
  const static int widthVarNo = 1;
  const static int heightVarNo = 2;
  const static int maxBreedVarNo = 3;
  const static int ticksVarNo = 4;
  const static int countAliveVarNo = 5;
  const static int sizeVarNo = 6;
  const static int maxVarNo = 7;
};

class SPatchVarId : public VarId {
 private:
  int defaultCount() const { return yVarNo; }

 public:
  SPatchVarId();
  const static int colorVarNo = 1; /* do not modify */
  const static int screenVarNo = 2;
  const static int xVarNo = 3;
  const static int yVarNo = 4;
  VariableType classForVar(int id) const override;
};

class STurtleVarId : public VarId {
 private:
  int defaultCount() const { return headingVarNo; }

 public:
  STurtleVarId();
  const static int colorVarNo = 1; /* do not modify */
  const static int flagVarNo = 2;
  const static int xVarNo = 3;
  const static int yVarNo = 4;
  const static int headingVarNo = 5;
  const static int aliveFlagNo = 0;
  const static int penDownFlagNo = 1;
  VariableType classForVar(int id) const override;
};

class SVariables {
 private:
  VariableType _varType[MAX_VARIABLES];
  void *_var[MAX_VARIABLES];
  const char *_varName[MAX_VARIABLES];
  int _size;
  int _max;
  const int allocateStep = 100;

  float *allocateFloatArray();
  u_int8_t *allocateByteArray();
  u_int32_t *allocateWordArray();
  float *reallocateFloatArray(float *org, int newSize);
  u_int8_t *reallocateByteArray(u_int8_t *org, int newSize);
  u_int32_t *reallocateWordArray(u_int32_t *org, int newSize);

 public:
  SVariables();
  int setMax(int max) { _max = max; }
  int size() const { return _size; }
  void clear();
  void setupVarId(const VarId *aVarId, int initialSize);
  void updateVarId(const VarId *aVarId);
  void allocateMore(int more);
  VariableType getType(int vno) const;
  float getFloat(int vno, int index) const;
  const float *getFloatAll(int vno) const;
  void setFloat(int vno, int index, float value);
  void setFloatAll(int vno, const float *buf, int count);
  void fillFloat(int vno, float value);
  u_int8_t getByte(int vno, int index) const;
  const u_int8_t *getByteAll(int vno) const;
  void setByte(int vno, int index, u_int8_t value);
  void setByteAll(int vno, const u_int8_t *buf, int count);
  void fillByte(int vno, u_int8_t value);
  u_int32_t getWord(int vno, int index) const;
  const u_int32_t *getWordAll(int vno) const;
  void setWord(int vno, int index, u_int32_t value);
  void setWordAll(int vno, const u_int32_t *buf, int count);
  void fillWord(int vno, u_int32_t value);
  const u_int8_t *getColors() const;
  void print(int indent) const;
  void printValue(int vno, int index) const;
  void printValues(int vno, int w) const;
  void printAllValues(int w) const;
  void printIndex(int index) const;
  int elementSize(int vno) const;
  int totalSize(int vno) const;
  void copy(int from, int to);
  float *getFloatArray(int vno);
  void multiplyBy(int vno, float mul);
};

class SDiffuser {
 private:
  float *_extended;
  float *_normal;
  int _size;
  int _cols;
  int _rows;
  int _neighborSize;
  int neighbor[8];

  void clear();
  void allocate(int size);
  void setupNsum(const float *extended, float *normal, int cols, int rows, int neighborSize);
  void setupDiffuse(float *buf, int cols, int rows, int neighborSize);
  void setupExtended(const float *extended);
  void clearExtended();
  int indexOfExtended(int x, int y) const;
  int indexOfNormal(int x, int y) const;
  void setupNeighbor();
  void setupBorder();
  void nsum();
  void diffuse(float percent);
  void restoreExtended(float *buf);

 public:
  SDiffuser();
  ~SDiffuser();

  void nsum4(const float *src, float *dst, int cols, int rows);
  void nsum8(const float *src, float *dst, int cols, int rows);
  void diffuse4(float *buf, int cols, int rows, float percent);
  void diffuse8(float *buf, int cols, int rows, float percent);
  void printExtended() const;
  void printNeighbor() const;
};

class SBreed {
 protected:
  VarId *_varId;
  SVariables *_variables;

 public:
  SBreed();
  virtual ~SBreed();
  virtual void print(int indent) const;
  virtual void printDetails() const = 0;
  virtual void clear() = 0;
  virtual void reset() = 0;
  int size() const { return _variables->size(); }
  virtual int countAlive() const = 0;
  VariableType getType(int vno) const;
  float getFloat(int vno, int index) const;
  const float *getFloatAll(int vno) const;
  void setFloat(int vno, int index, float value);
  void setFloatAll(int vno, const float *buf, int count);
  u_int8_t getByte(int vno, int index) const;
  const u_int8_t *getByteAll(int vno) const;
  void setByte(int vno, int index, u_int8_t value);
  void setByteAll(int vno, const u_int8_t *buf, int count);
  u_int32_t getWord(int vno, int index) const;
  const u_int32_t *getWordAll(int vno) const;
  void setWord(int vno, int index, u_int32_t value);
  void setWordAll(int vno, const u_int32_t *buf, int count);
  bool getFlag(int vno, int bit, int index) const;
  void setFlag(int vno, int bit, int index, bool value);
  virtual u_int8_t getColor(int index) const = 0;
  virtual void setColor(int index, u_int8_t color) = 0;
  bool addVariable(const char *str, int vno);
  void setMax(int max) { _variables->setMax(max); }
  void scaleColor(int vno, float from, float to, u_int8_t baseColor, int index);
  int maxVarNo() const { _varId->max(); }
};

class SPatches : public SBreed {
 private:
  int _cols;
  int _rows;
  const int defaultOrder = 6;
  SDiffuser _diffuser;

 public:
  SPatches();
  void create(int count);
  void clear();
  void reset();
  void print(int indent) const;
  void printDetails() const;
  void printScreen() const;
  int indexAtPoint(float x, float y) const;
  u_int8_t getColor(int index) const;
  void setColor(int index, u_int8_t color);
  void setColor(float x, float y, u_int8_t color);
  float getX(int index) const;
  float getY(int index) const;
  float normalizeX(float x) const;
  float normalizeY(float y) const;
  int countAlive() const { return size(); }
  void initScreen();
  void setScreen(float x, float y, int color);
  const u_int8_t *getScreen() const;
  int getCols() const { return _cols; }
  int getRows() const { return _rows; }
  void nsum4(int from, int to);
  void nsum8(int from, int to);
  void diffuse4(int vno, float percent);
  void diffuse8(int vno, float percent);
  void multiplyBy(int vno, float mul);
  void scaleColorAll(int vno, float from, float to, u_int8_t baseColor);
};

class STurtles : public SBreed {
 private:
  int _defaultColor;
  float _defaultX;
  float _defaultY;
  const int defaultSize = 100;

 public:
  STurtles();
  void clear();
  void reset();
  void print(int indent) const;
  void printDetails() const;
  void printIndex(int index) const;
  void create(int num);
  void setupTurtle(int index);
  void kill(int index);
  bool getAlive(int index) const;
  u_int8_t getColor(int index) const;
  float getX(int index) const;
  float getY(int index) const;
  float getHeading(int index) const;
  bool getPenDown(int index) const;
  void getDelta(int index, float *pdx, float *pdy) const;
  void setColor(int index, u_int8_t c);
  void setFlag(int index, u_int32_t v);
  void setX(int index, float x);
  void setY(int index, float y);
  void setHeading(int index, float deg);
  void setPenDown(int index, bool b);
  int countAlive() const;
  void hatch(int index);
  int turtleAt(int x, int y, int exceptId) const;
  void setDefaultXY(float x, float y);
};

class SMicroWorld {
 private:
  BreedId _breedId;
  int _maxTurtles;
  int _maxPatchOrder;
  SBreed *_breeds[MAX_BREEDS];
  unsigned int _raisedEvents;
  int _ticks;

  const int defaultMaxTurtles = 10000;
  const int defaultMaxPatchOrder = 200;

  int getCols() const;
  int getRows() const;
  int countAlive(int bno) const;
  int maxVarNo(int bno) const;
  float patchVarHeading(int vno, float x, float y, float heading) const;

 public:
  SMicroWorld();
  void reset();
  void print(int indent) const;
  void printDetails() const;
  void printScreen() const;
  void printTurtle(int bno, int index) const;
  void createPatch(int order);
  void createTurtles(int bno, int num);
  void forward(int bno, int index, float step);
  const u_int8_t *getScreen();
  int size(int bno) const;
  int getAlive(int bno, int index) const;
  void setupBreed(int bno);
  void addEvent(const char *str, int eno);
  void clearPatches();
  void clearTurtles();
  VariableType getType(int bno, int vno) const;
  float getFloat(int bno, int vno, int index) const;
  const float *getFloatAll(int bno, int vno) const;
  void setFloat(int bno, int vno, int index, float value);
  void setFloatAll(int bno, int vno, const float *buf, int count);
  u_int8_t getByte(int bno, int vno, int index) const;
  const u_int8_t *getByteAll(int bno, int vno) const;
  void setByte(int bno, int vno, int index, u_int8_t value);
  void setByteAll(int bno, int vno, const u_int8_t *buf, int count);
  u_int32_t getWord(int bno, int vno, int index) const;
  const u_int32_t *getWordAll(int bno, int vno) const;
  void setWord(int bno, int vno, int index, u_int32_t value);
  void setWordAll(int bno, int vno, const u_int32_t *buf, int count);
  void setHeading(int bno, int index, float deg);
  void setColor(int bno, int index, u_int8_t color);
  void getDelta(int bno, int index, float *pdx, float *pdy) const;
  void kill(int bno, int index);
  int indexAtPoint(float x, float y) const;
  bool isActiveBreed(int bno) const;
  bool addVariable(int bno, const char *str, int vno);
  void clearRaisedEvents();
  void raiseEvent(int eno);
  bool existsRaisedEvent() const;
  unsigned int raisedEvents() const { return _raisedEvents; }
  void nsum4(int from, int to);
  void nsum8(int from, int to);
  void diffuse4(int vno, float percent);
  void diffuse8(int vno, float percent);
  void hatch(int bno, int index);
  int turtleAt(int bno, int x, int y, int exceptId) const;
  void multiplyBy(int vno, float mul);
  void scaleColor(int vno, int bno, float from, float to, u_int8_t baseColor, int index);
  float aimHighPatchVar(int vno, float x, float y, float heading) const;
  void setDefaultTurtleXY(int bno, float x, float y);
  void incrementTicks();
};
