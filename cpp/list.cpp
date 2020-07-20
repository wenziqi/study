#include <iostream>
#include <string>
using namespace std;

struct Node{
    int n;
    Node* next;
};



struct List
{
    int size;
    Node* head;
    Node* tail;
};

List* create_list()
{
    List* list = new List();
    list->size = 0;
    list->head = NULL;
    list->tail = NULL;
    return list;
}

void add_to_list(List* list,Node* node)
{
    list->size += 1;
    if(list->head==NULL)
    { 
        list->head=node;
        list->tail=node;
        node->next=NULL;
    }
    else
    {
        Node* tmp = list->tail;
        tmp->next = node;
        list->tail = node;
        node->next=NULL;
    }
}

void travel_list(List* list)
{
    Node* p = list->head;
    while(p){
        cout<<p->n<<' ';
        p=p->next;
    }
    cout<<endl;
}

void free_list(List* list)
{
    Node* p = list->head;
    while(p)
    {
        delete p;
        p=p->next;
    }
    p=NULL;
    
}


int main()
{
 
  List* mylist = create_list();
  
  for(int i=0;i<10;++i){
      Node* node = new Node();
      node->n=i;
      node->next=NULL;
      add_to_list(mylist,node);
  }
  
  travel_list(mylist);
  cout<<mylist->size<<endl;
  
  free_list(mylist);
  
  
  return 0;
}