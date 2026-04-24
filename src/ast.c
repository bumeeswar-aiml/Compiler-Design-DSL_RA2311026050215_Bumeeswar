#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

int tempCount = 1;

Node* createNode(char op[], Node* left, Node* right)
{
    Node* newNode = (Node*)malloc(sizeof(Node));

    strcpy(newNode->type, op);
    newNode->left = left;
    newNode->right = right;

    return newNode;
}

Node* createNumNode(int val)
{
    Node* newNode = (Node*)malloc(sizeof(Node));

    strcpy(newNode->type, "NUM");
    newNode->value = val;

    return newNode;
}

Node* createIdNode(char name[])
{
    Node* newNode = (Node*)malloc(sizeof(Node));

    strcpy(newNode->type, "ID");
    strcpy(newNode->id, name);

    return newNode;
}

void generateCode(Node* root)
{
    if(root == NULL)
        return;

    generateCode(root->left);
    generateCode(root->right);

    if(strcmp(root->type,"+") == 0 ||
       strcmp(root->type,"-") == 0 ||
       strcmp(root->type,"*") == 0 ||
       strcmp(root->type,"/") == 0)
    {
        printf("t%d = operation %s\n", tempCount++, root->type);
    }

    if(strcmp(root->type,"NUM")==0)
    {
        printf("Number: %d\n", root->value);
    }

    if(strcmp(root->type,"ID")==0)
    {
        printf("Variable: %s\n", root->id);
    }
}
