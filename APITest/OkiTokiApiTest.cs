using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using APITest.Properties;
using Flurl;
using Flurl.Http;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace APITest
{
    [TestClass]
    public class OkiTokiApiTest
    {
        private static string ApiBaseUrl
        {
            get
            {
                var webServiceUri = new Uri(Settings.Default.APITest_LegacyServiceReference_WebService);
                var restBaseUrl = $"{webServiceUri.Scheme}://{webServiceUri.Authority}";
                return restBaseUrl.AppendPathSegment("Umbraco/Api");
            }
        }

        [TestMethod]
        public async Task GetGroup()
        {
            // 200
            var rest = ApiBaseUrl
                .AppendPathSegment("OkiToki/RingGroup")
                .SetQueryParam("UserName", "test")
                .SetQueryParam("Password", "Qwerty12345")
                .SetQueryParam("Say", "hello gays!");

            var result = await rest.GetJsonAsync<string>();

            Assert.AreEqual(result, "User TestUser say: hello gays!");
        }

        [TestMethod]
        public async Task BasicAuth()
        {
            // 200
            var result = await ApiBaseUrl
                .AppendPathSegment("Okitoki/Hello")
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
