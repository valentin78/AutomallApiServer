using System;
using APITest.LegacyServiceReference;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace APITest
{
    [TestClass]
    public class SoapServiceTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            var srv = new WebService();
            var result = srv.Hello(new AuthenticationToken()
            {
                UserName = "test",
                Password = "Qwerty12345"
            });

            Assert.AreEqual(result, "TestUser");
        }
    }
}
