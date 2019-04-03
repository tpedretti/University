//File: MaxSubSum.h
//Programmer: Taylor Pedretti
//Lab 03

#include <iostream>
#include <vector>
#include <ctime>

using namespace std;

void rand_seed()
{
	int seed = static_cast<int>(time(0));
	srand(seed);
}

//Random interger between a and b
int rand_int(int a, int b)
{
	return a + rand() % (b - a + 1);
}

//33% Chance of negative number; repears allowed
//absolute value between from and upto
void random_vector(int k, int from, int upto, vector<int>& v)
{
	int rnum;
	int r33;
	for (int i = 1; i <= k; i++)
	{
		rnum = rand_int(from, upto);
		r33 = rand_int(1, 4);

		if (r33 == 3)
			v.push_back(-rnum);
		else
			v.push_back(rnum);
	}

	return;
}

//Adopted from Weiss, DSAAC++, p. 61
int max_subseq_sum_cube(const vector<int>& vec, int& ops)
{
	int maxSum = 0;
	ops = 0;
	for (int i = 0; i < vec.size(); i++)
	{
		for (int j = 0; j < vec.size(); j++)
		{
			int thisSum = 0;
			for (int k = 0; k <= j; k++)
			{
				thisSum += vec[k];
				ops += 1;
			}

			if (thisSum > maxSum)
				maxSum = thisSum;
		}
	}

	return maxSum;
}

//Adopted from Weiss, DSAAC++, p. 62
int max_subseq_sum_quad(const vector<int>& vec, int& ops)
{
	int maxSum = 0;
	ops = 0;

	for (int i = 0; i < vec.size(); i++)
	{
		int thisSum = 0;
		for (int j = 0; j < vec.size(); j++)
		{
			thisSum += vec[j];
			ops += 1;

			if (thisSum > maxSum)
				maxSum = thisSum;
		}
	}

	return maxSum;
}

//Adopted from Weiss, DSAAC++, p. 66
int max_subseq_sum_lin(const vector<int>& vec, int& ops)
{
	int maxSum = 0;
	int thisSum = 0;
	ops = 0;

	for (int i = 0; i < vec.size(); i++)
	{
		thisSum += vec[i];
		ops += 1;

		if (thisSum > maxSum)
			maxSum = thisSum;
		else if(thisSum < 0)
			thisSum = 0;
	}

	return maxSum;
}