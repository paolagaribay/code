#include <iostream>
#include <time.h>
#include <iomanip>
using namespace std;
int bottomup(int n, int min, int max)
{
	int r[n+9];
	for (int i = 0; i <= 9; i++)
	{
		r[i] = i;
	}
	for (int j = 10; j <= n; j++)
	{
		r[j] = r[j - min] + r[j - max];
	}
	return r[n];
}
int main()
{
	clock_t t;
	t = clock();
    int array []= {1, 6, 3, 5, 4, 4, 6};
    int min = array[0];
    int max = array[0];
    
	for (int i = 0; i < 7; i++)
    {
        if (array[i] < min)
            min = array[i];
        else if (array[i] > max)
            max = array[i];
    } 
	
	int n;
    cout << "Input n: ";
	cin >> n;

	cout << "F(n) = " << bottomup(n, min, max) << endl;
	
	cout << setprecision(6);
	cout <<  "Time: " << (float)t/CLOCKS_PER_SEC << endl;
}