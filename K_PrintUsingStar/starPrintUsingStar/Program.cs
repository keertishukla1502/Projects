using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace starPrintUsingStar
{
    class Program
    {
        static void Main(string[] args)
        {

            for (int i = 5; i >= 1; i--)
            {
               
                for (int j = 5; j > i; j--)
                {
                    Console.Write(" ");
                }
                Console.Write("*");
                for (int k = 1; k <= i; k++)
                {
                    Console.Write(" ");
                }
                Console.Write("*");
                for (int coll = 5+i; coll >= 6; coll--)
                {
                    Console.Write(" ");
                }
                Console.Write("*");
                Console.WriteLine();
            }
           for(int m = 0; m <= 7; m++) { Console.Write("* "); }
           Console.WriteLine();
            for (int i = 4; i >= 1; i--)
            {
                
                for (int j = 1; j < i; j++)
                {
                    Console.Write(" ");
                }
                Console.Write("*");
                for (int k = 5; k >= i; k--)
                {
                    Console.Write(" ");
                }
                Console.Write("*");


                for (int j = 5; j > i-1; j--)
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
