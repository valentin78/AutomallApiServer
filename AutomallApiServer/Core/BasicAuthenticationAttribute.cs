﻿using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Principal;
using System.ServiceModel.Configuration;
using System.Threading;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using AutomallApiServer.Models;
//using ActionFilterAttribute = System.Web.Http.Filters.ActionFilterAttribute;

namespace AutomallApiServer.Core
{
    public class BasicAuthenticationAttribute : ActionFilterAttribute
    {
        public string BasicRealm { get; set; }
        protected string Username { get; set; }
        protected string Password { get; set; }
        protected SystemRoles[] Roles { get; set; }

        public BasicAuthenticationAttribute(string username, string password)
        {
            Username = username;
            Password = password;
        }

        public BasicAuthenticationAttribute(SystemRoles [] roles = null)
        {
            Roles = roles;
        }

        public override void OnActionExecuting(HttpActionContext filterContext)
        {
            var req = filterContext.Request;
            req.Headers.TryGetValues("Authorization", out var values);
            var auth = values?.FirstOrDefault();
            if (!string.IsNullOrEmpty(auth))
            {
                var cred = System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(auth.Substring(6))).Split(':');
                var token = new AuthenticationToken { UserName = cred[0], Password = cred[1] };

                if (Roles?.Length > 0)
                {
                    try
                    {
                        var user = SecurityHelper.Authorize(token, Roles);
                        return;
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
                    if (Username == null && token.UserName != null && token.Password != null)
                    {
                        Thread.CurrentPrincipal = new GenericPrincipal(new HttpListenerBasicIdentity(token.UserName, token.Password), null);
                        return;
                    }
                    if (token.UserName == Username && token.Password == Password)
                    {
                        Thread.CurrentPrincipal = new GenericPrincipal(new HttpListenerBasicIdentity(Username, Password), null);
                        return;
                    }
                    filterContext.Response = new HttpResponseMessage(HttpStatusCode.Forbidden);
                }
            }
            /// thanks to eismanpat for this line: http://www.ryadel.com/en/http-basic-authentication-asp-net-mvc-using-custom-actionfilter/#comment-2507605761
            filterContext.Response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
            filterContext.Response.Headers.Add("WWW-Authenticate", $"Basic realm=\"{BasicRealm ?? "webmall.md"}\"");
        }
    }
}