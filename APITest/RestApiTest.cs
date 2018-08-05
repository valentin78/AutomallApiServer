using System;
using System.Net;
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

            dynamic badResult = await restBaseUrl
                .AppendPathSegment("Umbraco/Api/Demo/Hello")
                .AllowHttpStatus("5xx")
                .PostJsonAsync(new
                {
                    Token = new
                    {
                        UserName = "test",
                        Password = "wrong_password"
                    },

                    Say = "no matters"
                }).ReceiveJson();

            Assert.AreEqual(badResult.ExceptionMessage, "Security error.");


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
                .ReceiveJson<string>();

            Assert.AreEqual(result, "User TestUser say: hello gays!");
        }
    }
}
