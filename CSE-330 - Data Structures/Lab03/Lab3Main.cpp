//File: Lab3Main.cpp
//Programmer: Taylor Pedretti
//Lab 03
#include "MaxSubSum.h"

int main()
{
	//Vector to be filled with 10 random numbers
	vector<int> v1;
	int vectorSize = 30;
	int no_ops = 0;
	int maxsum = 0;

	random_vector(vectorSize, 1, 1000, v1);

	maxsum = max_subseq_sum_cube(v1, no_ops);
	cout << "Max Subseq Cube: " << maxsum << " OPS: " << no_ops << endl;

	maxsum = max_subseq_sum_quad(v1, no_ops);
	cout << "Max Subseq Quad: " << maxsum << " OPS: " << no_ops << endl;

	maxsum = max_subseq_sum_lin(v1, no_ops);
	cout << "Max Subseq Lin: " << maxsum << " OPS: " << no_ops << endl;

	//system("PAUSE");
	return 0;
}