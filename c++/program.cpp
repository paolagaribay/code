#include <iostream>

using namespace std;

int fib(int n, int min, int max)
{
    if (n <= 9)
        return n;
    else
        return fib(n - min, min, max) + fib(n - max, min, max);
}
int main()
{
    int array [7]= {1, 6, 3, 5, 4, 4, 6};
    int min = array[0];
    int max = array[0];
    
    for (int i = 0; i < 7; i++)
    {
        if (array[i] < min)
            min = array[i];
        else if (array[i] > max)
            max = array[i];
    } 
    
    //cout << min << endl;
    //cout << max << endl;
    
    int input;

    cout << "Input n: ";
    cin >> input;
    int i = 0;
    while (i < input)
    {
        cout << fib(i, min, max) << endl;
        i++;
    }
}