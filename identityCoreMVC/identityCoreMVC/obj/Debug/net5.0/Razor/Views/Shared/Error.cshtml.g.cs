#pragma checksum "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\Shared\Error.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "861f39ea7e2ab222c13e7b00faf57410101f0da4"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared_Error), @"mvc.1.0.view", @"/Views/Shared/Error.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\_ViewImports.cshtml"
using identityCoreMVC;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\_ViewImports.cshtml"
using identityCoreMVC.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"861f39ea7e2ab222c13e7b00faf57410101f0da4", @"/Views/Shared/Error.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"eb1dce4ea63fbdb6106710f1125eebcae4564d72", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared_Error : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<ErrorViewModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\Shared\Error.cshtml"
  
    ViewData["Title"] = "Error";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<h3>
    An occured while processing your request. The support
    team is notified and we are working on the fix
</h3>
<h5>Please contact us on pragim@pragimtech.com</h5>
<hr />
<h3>Exception Details:</h3>
<div class=""alert alert-danger"">
    <h5>Exception Path</h5>
    <hr />
    <p>");
#nullable restore
#line 16 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\Shared\Error.cshtml"
  Write(ViewBag.ExceptionPath);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div class=\"alert alert-danger\">\r\n    <h5>Exception Message</h5>\r\n    <hr />\r\n    <p>");
#nullable restore
#line 22 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\Shared\Error.cshtml"
  Write(ViewBag.ExceptionMessage);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n\r\n<div class=\"alert alert-danger\">\r\n    <h5>Exception Stack Trace</h5>\r\n    <hr />\r\n    <p>");
#nullable restore
#line 28 "C:\Users\keerti.s(2331)\source\repos\identityCoreMVC\identityCoreMVC\Views\Shared\Error.cshtml"
  Write(ViewBag.StackTrace);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<ErrorViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
