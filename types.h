typedef enum { typeCon, typeId, typeOpr, typeStr } nodeEnum;

/* constants */
typedef struct {
  nodeEnum type; /* type of node */
  int value; /* value of constant */
  char *str; /*value of string constant*/
} conNodeType;

/* identifiers */
typedef struct {
  nodeEnum type; /* type of node */
  int i; /* subscript to ident array */
} idNodeType;

/* operators */
typedef struct {
  nodeEnum type; /* type of node */
  int oper; /* operator */
  int nops; /* number of operands */
  union nodeTypeTag *op[1]; /* operands (expandable) */
} oprNodeType;

typedef union nodeTypeTag {
  nodeEnum type; /* type of node */
  conNodeType con; /* constants */
  idNodeType id; /* identifiers */
  oprNodeType opr; /* operators */
} nodeType;

typedef union {
  int value;
  char *str;
}Variable;

extern Variable sym[26];
