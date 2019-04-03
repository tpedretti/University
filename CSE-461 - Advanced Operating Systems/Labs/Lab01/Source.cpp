#include <iostream>
#include <cstdio>
#include <stdio.h>
#include <string>
#include <cstring>
//#include <unistd.h>

using namespace std;

void welcomePrompt();
void readCMD(char cmd[255], char para[255]);

int main()
{
	char path[255] = "/bin/";
	char cmd[255] = "";
	char para[255] = "";

	welcomePrompt();
	readCMD(cmd, para);

	for (int i = 0; i < 5; i++)
		cout << cmd[i];

	//while (true)
	//{
	//	if (fork() != 0)
	//	{
	//		//wait();
	//	}
	//	else
	//	{
	//		//execve(path, );
	//	}
	//}

	return 0;
}

void welcomePrompt()
{
	cout << "Welcome to Lab01 simple shell." << endl;
}

void readCMD(char cmd[255], char para[255])
{
	string readLine;
	cout << "Waiting for command: ";
	getline(cin, readLine);

	char * cstr = new char[readLine.length() + 1];
	strcpy(cstr, readLine.substr(0, readLine.find(' ')).c_str());

	*cmd = &cstr;
}