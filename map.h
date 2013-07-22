
#include <stdio.h>
//Puntero de comparacion
typedef int (*cmpPointer)(void*,void*) ;

typedef struct map_node
{
	void * key;
	void * value;
	struct map_node *  next;

} map_node;

typedef struct Map
{
	map_node * primero;
	cmpPointer  comp;

} Map;

map_node * map_node_new(void * key, void * value, map_node * next)
{
	map_node * node = (map_node*)malloc(sizeof(map_node));
	node->key = key;
	node->value = value;
	node->next = next;

	return node;
}
Map * Map_new()
{
	Map * map = (Map*) malloc(sizeof(Map));
	map->primero = NULL;
	map->comp = NULL;
	return map;
}

void Map_add(Map* map, void * key , void * value)
{

	//printf("Adding %d %d\n",*(int*)key,*(int*)value);
	if(map->primero==NULL)
	{
		map->primero = map_node_new(key,value,NULL);
	}
	else
	{
		map_node *tmp = map->primero;

		map->primero = map_node_new(key,value,tmp);

	}
}


void * Map_find(cmpPointer comp,map_node * node, void * key, int * ok)
{
	if(node!=NULL)
	{

		//Si son iguales
		if(comp(node->key,key)!=0)
		{

			
			*ok = 1;
			return node->value;	
		}
		else
		{
			//Seguimos buscando
			
			Map_find(comp,node->next,key,ok);
		}
	}
	else
	{

		*ok = 0;
		return NULL;
	}
	
}

void * Map_get(Map* map, void * key, int * ok)
{
	//printf("%d %d\n",*(int*)key,*(int*)ok);
	if(map->comp==NULL)
	{
		printf("Error: please set a comparison function first! \n");
	}
	else
	{
		
		return Map_find(map->comp,map->primero,key,ok);


	}
}



