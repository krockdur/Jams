namespace DesignPattern
{
    class Singleton
    {
        private Singleton() { }

        private static Singleton _instance;

        private int A = 0;
        private int B = 0;

        public static Singleton GetInstance()
        {
            if (_instance == null)
            {
                _instance = new Singleton();
            }
            return _instance;
        }

        public void setA()
        {
            A = 12;
        }

        public void printA()
        {
            if (A == 0)
            {
                Console.WriteLine("rien dans A");
            }
            else
            {
                Console.WriteLine(A.ToString());
            }
        }
}


    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            Singleton s1 = Singleton.GetInstance();
           
            Singleton s2 = Singleton.GetInstance();

            s2.printA();
            s1.printA();
            s1.setA();
            s2.printA();
        }
    }
}
