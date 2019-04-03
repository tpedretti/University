//File: VectorMain.cpp
#include <iostream>
#include "Vector.h"

using namespace std;

void print_vector(Vector<int> v)
{
	for (int i = 1; i < v.size(); i++)
		cout << v[i] << " ";

	cout << endl;
}

int main()
{
	Vector<int> v1;

	for (int i = 1; i <= 10; i++)
		v1.push_back(i);

	cout << "v1: ";
	print_vector(v1);

	Vector<int> v2(v1);

	cout << "v2(v1): ";
	print_vector(v2);

	Vector<int> v3 = v2;

	cout << "v3=v2: ";
	print_vector(v3);

	Vector<int> v4(static_cast<Vector<int>&&>(v3));

	cout << "v4(&&3): ";
	print_vector(v4);

	cout << "v3: ";
	print_vector(v3);

	Vector<int> v5(static_cast<Vector<int>&&>(v2));

	cout << "v5=&&v2: ";
	print_vector(v5);

	cout << "v2: ";
	print_vector(v2);

	return 0;
}