#include <iostream>
#include <vector>
#include <time.h>
#include <iomanip>
using namespace std;

int rec(int n, int min, int max)
{
	static std::vector<int> table;
    if (n <= 9)
	{
        return n;
	}
    else if (n >= table.size()) 
	{
		table.resize(n+1);
	}
	if (table[n] == 0) 
	{
        table[n] = rec(n - min, min, max) + rec(n - max, min, max);
	}
	return table[n];
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
	
	cout << "F(n) = " << rec(n, min, max) << endl;
	t = clock() - t;
	cout << setprecision(6);
	cout <<  "Time: " << (float)t/CLOCKS_PER_SEC << endl;
	
}