#ifndef AST_H
#define AST_H

typedef struct Node
{
    char type[20];
    int value;
    char id[20];

    struct Node* left;
    struct Node* right;

}Node;

Node* createNode(char op[], Node* left, Node* right);
Node* createNumNode(int val);
Node* createIdNode(char name[]);

void generateCode(Node* root);

#endif
