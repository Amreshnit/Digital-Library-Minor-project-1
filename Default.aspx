<%@ Page Title="Book Inventory" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .tb_book {
            border-collapse: collapse;
        }

        .tb_book_AED, .tb_book_th {
            border: 1px solid #6699cc;
        }

        .tdbi_1 {
            width: 200px;
            padding: 3px 25px 3px 3px;
            background: #fafafa;
            text-align: right;
            border-top: 1px solid #dddddd;
            border-right: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
        }

        .tdbi_2 {
            width: 350px;
            padding: 3px;
            background: #fafafa;
            border-top: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
        }

        .txtbox {
            width: 300px;
            padding: 3px;
        }

        .btn {
            background: #6699cc;
            border: 1px solid #6699cc;
            padding: 5px 10px 5px 10px;
            color: #ffffff;
        }

            .btn:hover {
                background: #ea6153;
                border: 1px solid #ea6153;
                padding: 5px 10px 5px 10px;
                color: #ffffff;
            }
    </style>
    <script src="Scripts/bookvalidation.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-top: -15px; height: 500px; padding: 35px 25px 50px 25px;background-image: url('Images/mybg.jpg')" >
        <div style="padding: 5px 10px 5px 10px; width: 105%; margin-left: -30px;" align="center">
            <asp:RadioButtonList ID="rbl_book_AEUD" runat="server" RepeatDirection="Horizontal" Font-Bold="true" CssClass="text-primary">
                <asp:ListItem Text="ADD" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text="EDIT" Value="2"></asp:ListItem>
                <asp:ListItem Text="DELETE" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div style="padding: 10px;" align="center">
            <table class="tb_book">
                <tr>
                    <td id="table_Add" class="tb_book_AED" style="display: block;" runat="server">
                        <table>
                            <caption>
                                <h5 class="alert alert-info">Add Book to Inventory</h5>
                            </caption>
                            <tr>
                                <td class="tdbi_1">Book ID :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookid" CssClass="txtbox" placeholder="Book ID Format B#001" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Name :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookname" CssClass="txtbox" placeholder="Book Title" runat="server" CausesValidation="True"></asp:TextBox>
                                    <br/><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_bookname" ValidationGroup="valGroup" ErrorMessage="Not a valid name." Display="Dynamic" ValidationExpression="([a-zA-Z ]*$)"  />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Publisher Name :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookpubname" CssClass="txtbox" placeholder="Publisher Name" runat="server" CausesValidation="True"></asp:TextBox>
                                <br/><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_bookpubname" ValidationGroup="valGroup" ErrorMessage="Not a valid name." Display="Dynamic" ValidationExpression="([a-zA-Z ]*$)"  />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Publishered Year :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookpubyear" CssClass="txtbox" runat="server" placeholder="Publication Year" CausesValidation="True"></asp:TextBox>
                                    <br/><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_bookpubyear" ValidationGroup="valGroup" ErrorMessage="Not a valid year." Display="Dynamic" ValidationExpression="(^[0-9]{1,}(,[0-9]+){0,}$)"  />
                               </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Price :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookprice" placeholder="Book Price" CssClass="txtbox" runat="server" CausesValidation="True"></asp:TextBox>
                                <br/><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_bookprice" ValidationGroup="valGroup" ErrorMessage="Not a valid price." Display="Dynamic" ValidationExpression="(^[+]?\d*\.?\d*[1-9]+\d*$)|(^[+]?[1-9]+\d*\.\d*$)" />

                                </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Quantity :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_bookqty" CssClass="txtbox" placeholder="Number Copies" runat="server" CausesValidation="true"></asp:TextBox>
                                    <br/><asp:RegularExpressionValidator ID="regEx" runat="server" ControlToValidate="txt_bookqty" ValidationGroup="valGroup" ErrorMessage="Not a valid quantity." Display="Dynamic" ValidationExpression="(^[0-9]{1,}(,[0-9]+){0,}$)" />

                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="table_Edit" class="tb_book_AED" style="display: none;" runat="server">
                        <table>
                            <caption>
                                 <h5 class="alert alert-info">Edit Book</h5>
                            </caption>
                            <tr>
                                <td class="tdbi_1">Book ID :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookid" CssClass="txtbox" placeholder="Book ID to Search" Width="235px" runat="server"></asp:TextBox>
                                    <asp:Button ID="btn_check" runat="server" CssClass="btn" Text="Check"
                                        OnClick="btn_check_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Name :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookname" CssClass="txtbox" ReadOnly="true" BackColor="#dddddd"
                                        runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Publisher Name :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookpubname" CssClass="txtbox" ReadOnly="true" BackColor="#dddddd"
                                        runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Publisher Year :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookpubdate" CssClass="txtbox" ReadOnly="true" BackColor="#dddddd"
                                        runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Price :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookprice" CssClass="txtbox" ReadOnly="true" BackColor="#dddddd"
                                        runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tdbi_1">Book Quantity :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_edit_bookqty" CssClass="txtbox" ReadOnly="true" BackColor="#dddddd"
                                        runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </td>
                    <td id="table_Delete" class="tb_book_AED" style="display: none;" runat="server">
                        <table>
                            <caption>
                                <h5 class="alert alert-info">Delete Book</h5>
                            </caption>
                            <tr>
                                <td class="tdbi_1">Book ID :</td>
                                <td class="tdbi_2">
                                    <asp:TextBox ID="txt_delete_bookid" CssClass="txtbox" runat="server" placeholder="Book ID to Delete"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span style="color: red;">** The book will be permanently deleted from the system</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="lblresult" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lbl_book_result" runat="server"></asp:Label>
        <!-- Add Book ADD EDIT DELETE -->
        <div id="div_add" align="center" style="padding-top: 25px; display: block;" runat="server">
            <asp:Button ID="btn_Add" runat="server" CssClass="btn" Text="ADD"
                OnClick="btn_Add_Click" />
            
            <asp:Button ID="btn_Add_Cancel" runat="server" CssClass="btn" Text="CANCEL"
                OnClick="btn_Add_Cancel_Click" />
        </div>
        <!-- Edit Book ADD EDIT DELETE -->
        <div id="div_edit" align="center" style="padding-top: 25px; display: none;" runat="server">
            <asp:Button ID="btn_Update" runat="server" CssClass="btn" Text="UPDATE"
                OnClick="btn_Update_Click" />
            
            <asp:Button ID="btn_Update_Cancel" runat="server" CssClass="btn" Text="CANCEL"
                OnClick="btn_Update_Cancel_Click" />
        </div>
        <!-- Delete Book ADD EDIT DELETE -->
        <div id="div_delete" align="center" style="padding-top: 25px; display: none;" runat="server">
            <asp:Button ID="btn_Delete" runat="server" CssClass="btn" Text="DELETE"
                OnClick="btn_Delete_Click" />
            
            <asp:Button ID="btn_Delete_Cancel" runat="server" CssClass="btn" Text="CANCEL"
                OnClick="btn_Delete_Cancel_Click" />
        </div>

    </div>
</asp:Content>

