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
    public class RestApiTest
    {
        private static string RestBaseUrl
        {
            get
            {
                var webServiceUri = new Uri(Settings.Default.APITest_LegacyServiceReference_WebService);
                var restBaseUrl = $"{webServiceUri.Scheme}://{webServiceUri.Authority}";
                return restBaseUrl;
            }
        }

        [TestMethod]
        public async Task OAuth()
        {
            // token
            dynamic auth = await RestBaseUrl
                .AppendPathSegment("oauth/token")
                .WithHeader("Content-Type", "application/x-www-form-urlencoded")
                .PostAsync(new StringContent("grant_type=password&username=test&password=Qwerty12345"))
                .ReceiveJson();

            var token = (string)auth.access_token;

            // 200
            var result = await RestBaseUrl
                .AppendPathSegment("Umbraco/Api/AuthDemo/Hello")
                .SetQueryParams(new { say = "hello gays!" })
                .WithOAuthBearerToken(token)
                .GetJsonAsync<string>();

            Assert.AreEqual(result, "User TestUser say: hello gays!");

            // 401 (no token)
            var badResponce = await RestBaseUrl
                .AppendPathSegment("Umbraco/Api/AuthDemo/Hello")
                .AllowHttpStatus("401")
                .SetQueryParams(new { say = "hello gays!" })
                .GetAsync();
            Assert.AreEqual(badResponce.StatusCode, HttpStatusCode.Unauthorized);

            // 401 (role based)
            badResponce = await RestBaseUrl
                .AppendPathSegment("Umbraco/Api/AuthDemo/Crap")
                .WithOAuthBearerToken(token)
                .AllowHttpStatus("401")
                .GetAsync();
            Assert.AreEqual(badResponce.StatusCode, HttpStatusCode.Unauthorized);
        }

        [TestMethod]
        public async Task BasicAuth()
        {
            // 5xx
            var badResponce = await RestBaseUrl
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
                });

            Assert.AreEqual(badResponce.StatusCode, HttpStatusCode.InternalServerError);

            // 200
            var result = await RestBaseUrl
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
