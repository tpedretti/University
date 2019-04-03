#include <iostream>
#include <vector>

using namespace std;

//Exercise 4
int findMax(int numList[], int arrySize);

int main()
{
	int numList[] {5,-3,7,4,12,-6,44,-24,33,-12};
	int arrySize = sizeof(numList)/sizeof(numList[0]);
	
	cout << "Max Number: "<< findMax(numList, arrySize) << endl;

	system("pause");
	return 0;
}

int findMax(int numList[], int arrySize)
{
	int maxSum = 0;
	int *tempMaxes = new int[arrySize];
	
	for (int i = 0; i < arrySize; i++)
		tempMaxes[i] = numList[i];

	for (int i = 1; i < arrySize; i++)
	{
		for (int j = 0; j < i; j++)
		{
			if (numList[i] > numList[j] && tempMaxes[i] < numList[i] + numList[j])
				tempMaxes[i] = tempMaxes[j] + tempMaxes[i];
		}
	}

	for (int i = 0; i < arrySize; i++)
	{
		if (maxSum < tempMaxes[i])
			maxSum = tempMaxes[i];
	}

	delete []tempMaxes;
	return maxSum;
}

//Exercise 1
//int main()
//{
//	for (int row = 0; row < 8; row++)
//	{
//		for (int col = 0; col < 8; col++)
//		{
//			if (col == row)
//				cout << (row + 1) << " ";
//			else
//				cout << "_ ";
//		}
//	}
//
//	return 0;
//}


//Exercise 2
//int getSize();
//void displayMatrix(int);
//
//int main()
//{
//	int matrixSize = 0;
//
//	matrixSize = getSize();
//	displayMatrix(matrixSize);
//
//	system("pause");
//	return 0;
//}
//
//int getSize()
//{
//	int size;
//
//	do {
//		cout << "Enter size of matrix(positive intgers):";
//		cin >> size;
//
//		if (size < 1)
//			cout << "Invalid entry! Please try again!" << endl;
//
//	} while (size < 0);
//
//	return size;
//}
//
//void displayMatrix(int matrixSize)
//{
//	for (int row = 0; row < matrixSize; row++)
//	{
//		for (int col = 0; col < matrixSize; col++)
//		{
//			if (col == row)
//				cout << (row + 1) << " ";
//			else
//				cout << "_ ";
//		}
//
//		cout << endl;
//	}
//}


//Exercise 3
//int main()
//{
//	SquareNumber mysq;
//	for (int i = 1; i <= 5; i++)
//	{
//		mysq.nextsq();
//		cout << mysq.getsq() << " ";
//	}
//	cout << endl;
//
//	SquareNumber sq2(mysq);
//	for (int i = 1; i <= 5; i++)
//	{
//		cout << sq2.getsq() << " ";
//		sq2.prevsq();
//	}
//	cout << endl;
//
//	mysq = sq2;
//	for (int i = 1; i <= 10; i++)
//		mysq.nextsq();
//	cout << mysq.getsq() << endl << endl;
//
//	system("pause");
//	return 0;
//}