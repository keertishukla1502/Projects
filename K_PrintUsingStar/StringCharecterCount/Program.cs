using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringCharecterCount
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Enter Any String:");
            string str = Console.ReadLine();
            string checkedstr="";
            foreach (char ch in  str.ToCharArray())
            {
                if (!checkedstr.Contains(ch))
                {
                    int result = str.Length - str.Replace(ch.ToString(), "").Length;

                    Console.WriteLine(ch + "=" + result);
                    checkedstr = checkedstr + ch;
                }
                
            }
            //Console.WriteLine(str.Length);
            //Console.WriteLine(str.Replace("a", "").Length);
            Console.ReadKey();

        }
    }
}
