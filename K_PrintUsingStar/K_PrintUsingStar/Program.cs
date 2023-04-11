using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace K_PrintUsingStar
{
    class Program
    {
        static void Main(string[] args)
        {

            for (int row = 1; row <= 8; row++)
            {
                Console.Write("*");
                for (int coll = 4; coll >= row; --coll)
                {
                    Console.Write(" ");
                }
             

                for (int col = 1; col <= row-4; col++)
                {
                    Console.Write(" ");
                }
                Console.Write("*");

                Console.WriteLine();
            }
            Console.ReadKey();
        }
    }
}
