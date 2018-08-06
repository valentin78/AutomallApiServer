﻿using System;
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
        public async Task GetGroup()
        {
            // 200
            var rest = RestBaseUrl
                .AppendPathSegment("Umbraco/Api/OkiToki/RingGroup")
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
            var result = await RestBaseUrl
                .AppendPathSegment("Umbraco/Api/Okitoki/Hello")
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
