#pragma checksum "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "5bb13a3499534c2494933774fc4fc555a6bd1f2d"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Default_Index), @"mvc.1.0.view", @"/Views/Default/Index.cshtml")]
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
#line 1 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\_ViewImports.cshtml"
using ControllerToViewSendId;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\_ViewImports.cshtml"
using ControllerToViewSendId.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5bb13a3499534c2494933774fc4fc555a6bd1f2d", @"/Views/Default/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c840f890c3289347853f5299cb33e69a2a008922", @"/Views/_ViewImports.cshtml")]
    public class Views_Default_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<ControllerToViewSendId.Models.Tickets>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
  
    ViewBag.Title = "Index";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"<style type=""text/css"">
    .SelectedBackgroundColor {
        background-color: #5bc0de;
    }

    .disableColor {
        background-color: #dde;
        color: light-gray;
    }

    table tbody tr:hover {
        background-color: #ddd;
        cursor: pointer;
    }
</style>

<div class=""row"">
    <div class=""col-md-12"">



        <p>
");
            WriteLiteral(@"        </p>
        <table id=""ticketData"" class=""table"">
            <tr class=""HeaderClass"">
                <th style='display:none'>
                    TicketId
                </th>
                <th>
                    Create Date
                </th>
                <th>
                    A/c Number
                </th>
                <th>
                    Phone_Number
                </th>
                <th>
                    CName
                </th>
                <th>
                    Selected
                </th>
                <th>
                    Description
                </th>

            </tr>
            <tbody>
");
#nullable restore
#line 57 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                 if (Model != null)
                {
                    foreach (var item in Model)
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <tr ");
#nullable restore
#line 61 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                        Write(item.Selected == true ? String.Empty : "class=disableColor" );

#line default
#line hidden
#nullable disable
            WriteLiteral(">\r\n                            <td style=\'display:none\'>\r\n                                ");
#nullable restore
#line 63 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Ticket_ID));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 66 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Date_Entered));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 69 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Account_Number));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 72 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Phone_Number));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 75 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Customer_Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 78 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Selected));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 81 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                           Write(Html.DisplayFor(modelItem => item.Description));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </td>\r\n\r\n                        </tr>\r\n");
#nullable restore
#line 85 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                    }
                }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"            </tbody>
        </table>

    </div>
    <div class=""row"">
        <div class=""col-md-3"">
            <button class=""btn btn-Primary IsSelected"" disabled=""true"" onclick=""closeSelected()""> Close Selected Ticket</button>
        </div>
        <div class=""col-md-4 center"">
            Ticket Count - ");
#nullable restore
#line 96 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
                      Write(ViewBag.TotalTicket);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </div>\r\n\r\n        <div class=\"col-md-3\">\r\n            <button class=\"btn btn-info\" type=\"button\" id=\"addressSearch\"");
            BeginWriteAttribute("onclick", "\r\n                    onclick=\"", 3101, "\"", 3176, 3);
            WriteAttributeValue("", 3132, "location.href=\'", 3132, 15, true);
#nullable restore
#line 101 "C:\Users\keerti.s(2331)\source\repos\ControllerToViewSendId\ControllerToViewSendId\Views\Default\Index.cshtml"
WriteAttributeValue("", 3147, Url.Action("Index", "Home"), 3147, 28, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 3175, "\'", 3175, 1, true);
            EndWriteAttribute();
            WriteLiteral(">\r\n                Refresh\r\n            </button>\r\n\r\n        </div>\r\n    </div>\r\n\r\n</div>\r\n");
            WriteLiteral(@"<script src=""https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js""></script>
<script type=""text/javascript"">
    var ticketId = '0'
    var IDs = new Array();
    $(""#ticketData tbody tr"").not(':first').hover(
        function () {
           
            $(this).css(""background"", ""#ddd"");
        },
        function () {
           
            $(this).css(""background"", """");
        });

    $('#ticketData tbody tr').click(function () {
        var values = $(this).find('td:first').html();
        if ($(this).attr('class') == undefined || $(this).attr('class') == """") {
            /*value = $(this).find('td:first').html();*/
            $(this).addClass(""SelectedBackgroundColor"");
            $("".IsSelected"").prop('disabled', false);
           

            var selectedID = { id: values};
  
          
            IDs.push(selectedID.id);
          
            
        } else {
            $(this).removeClass(""SelectedBackgroundColor"");
            var selectedID =");
            WriteLiteral(@" { id: values };
            IDs.pop(selectedID.id);
           
        }
    });
    
    function closeSelected() {

        console.log(""IDs"" + IDs)


        $.ajax({
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            type: 'GET',
            url: '/Default/CloseTicket',
            data: { param2: IDs },
            traditional: true,
            success: function (data) {
                console.log(data)
                if (data == ""true"") {
                    location.href = ""/Default/Index"";
                }
                else {
                    alert('something wrong')
                }

            },
            error: function (error) {
                alert('something wrong')
            }
        });

    }
</script>  ");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<ControllerToViewSendId.Models.Tickets>> Html { get; private set; }
    }
}
#pragma warning restore 1591