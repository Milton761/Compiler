
typedef struct lista_parametros
{
	void * value;
	struct lista_parametros * next;

} lista_parametros;

typedef struct Statement
{
	int id;
	lista_parametros * parametros;

} Statement;

Statement * Statement_new(int id, lista_parametros * parametros)
{
	Statement * st = (Statement*) malloc(sizeof(Statement));
	st->id = id;
	st->parametros = parametros;
	return st;
}
