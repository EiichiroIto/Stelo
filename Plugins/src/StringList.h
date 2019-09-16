class StringList {
private:
  char *buffer;
  int bufsize;
  int next;
  int *linebuf;
  int *valuebuf;
  int linesize;
  int count;
  int iterateIndex;

public:
  StringList();
  ~StringList();

  void Setup(int total, int lines);
  void Add(const char *str, int value);
  void Clear();
  int Length() const { return count; }
  const char *operator[](int index) const;
  void Rewind();
  bool Iterate(char *&str, int &value);
  int ValueOf(int index) const;
};
