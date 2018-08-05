using System;
using System.Threading.Tasks;
using APITest.Properties;
using Flurl;
using Flurl.Http;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace APITest
{
    [TestClass]
    public class RestApiTest
    {
        [TestMethod]
        public async Task TestMethod1()
        {
            var webServiceUri = new Uri(Settings.Default.APITest_LegacyServiceReference_WebService);
            var restBaseUrl = $"{webServiceUri.Scheme}://{webServiceUri.Authority}";

            var result = await restBaseUrl
                .AppendPathSegment("Umbraco/Api/Demo/Hello")
                .PostJsonAsync(new
                {
                    Token = new
                    {
                        UserName = "test",
                        Password = "Qwerty12345"
                    },
                    Say = "hello gays!"
                })
                .ReceiveString();

            Assert.AreEqual(result, "User TestUser say: hello gays!");
        }
    }
}
