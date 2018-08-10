using System;
using APITest.Eurogarage;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace APITest
{
    [TestClass]
    public class SoapServiceTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            var srv = new Eurogarage.Eurogarage();
            var result = srv.Nomenclature(new AuthenticationToken
            {
                UserName = "1CTest",
                Password = "Qwerty12345"
            }, "gdb199");

            Assert.AreNotEqual(result.Length, 0);
        }
    }
}
