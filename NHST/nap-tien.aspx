<%@ Page Language="C#" MasterPageFile="~/UserMasterNew.Master" AutoEventWireup="true" CodeBehind="nap-tien.aspx.cs" Inherits="NHST.nap_tien" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="main">
        <div class="row">
            <div class="content-wrapper-before blue-grey lighten-5"></div>
            <div class="col s12">
                <div class="container">
                    <div class="all">
                        <div class="card-panel mt-3 no-shadow">
                            <div class="row">
                                <div class="col s12">
                                    <div class="page-title mt-2 center-align">
                                        <h4>NẠP TIỀN VNĐ</h4>
                                    </div>
                                </div>
                                <div class="col s12">
                                    <div class="order-list-info">
                                        <div class="total-info mb-2">
                                            <div class="row section">
                                                <div class="col s12">
                                                    <p class="center-align">
                                                        Tổng tiền đã nạp: <span
                                                            class="teal-text text-darken-4 font-weight-700">
                                                            <asp:Literal runat="server" ID="lblTotalIncome"></asp:Literal>
                                                            VNĐ</span> <span class="black-text divi">|</span> Số dư hiện
                                                    tại: <span
                                                        class="teal-text text-darken-4 font-weight-700">
                                                        <asp:Literal runat="server" ID="lblAccount"></asp:Literal></span>
                                                        VNĐ
                                                    </p>

                                                    <div class="donate-guide">
                                                        <h3 class="font-weight-700 mb-2 mt-2">QUY ĐỊNH HÌNH THỨC THANH
                                                        TOÁN</h3>
                                                        <p class="pl-1">
                                                            Để kết thúc quá trình đặt hàng, quý khách
                                                        <strong>thanh toán</strong> một khoản tiền <strong>đặt
                                                            cọc trước cho Mintic Logistics </strong>để chúng tôi thực hiện
                                                        giao dịch mua hàng theo yêu cầu trên đơn hàng.
                                                        </p>
                                                        <p class="pl-2">
                                                            - Số tiền <strong>đặt cọc</strong> trước bao gồm:
                                                        </p>
                                                        <p class="pl-3">
                                                            + <strong>Tiền hàng</strong>: giá sản phẩm trên
                                                        website đặt hàng Trung Quốc, số tiền này <strong>Mintic Logistics thu hộ </strong>cho nhà cung cấp.
                                                        </p>
                                                        <p class="pl-3">
                                                            + <strong>Phí dịch vụ</strong>: là phí khách hàng
                                                        trả cho <strong>Mintic Logistics </strong>để tiến hành thu mua theo đơn hàng đã đặt.
                                                        </p>
                                                        <h3 class="font-weight-700">CÓ 2 HÌNH THỨC THANH TOÁN:</h3>
                                                        <h4 class="pl-1">1. Thanh toán trực tiếp.</h4>
                                                        <p class="pl-3">
                                                            + <strong>Văn phòng tại Hà Nội: 58 Tố Hữu, Trung Văn, Nam Từ Liêm, Hà Nội</strong>
                                                        </p>
                                                        <h4 class="pl-1">2. Chuyển khoản trực tiếp.</h4>

                                                        <div class="list-bank" style="padding-left: 3%">
                                                            <table>                                                                
                                                                    <tr>
                                                                        <td>Thông tin ngân hàng 1:</td>
                                                                        <td>Thông tin ngân hàng 2:</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Tên ngân hàng: ACB</td>
                                                                        <td>Tên ngân hàng: MB</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Số tài khoản: 6628686</td>
                                                                        <td>Số tài khoản: 338886789</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Chủ tài khoản: Nguyễn Quang Quân</td>
                                                                        <td>Chủ tài khoản: Kiều Xuân Thuỷ</td>
                                                                    </tr>                                                               
                                                            </table>
                                                        </div>

                                                        <p class="pl-3">+ <strong>Nội dung chuyển khoản theo cú pháp: NAP_<username>_SĐT (VD: NAP_admin_0928883345)</strong></p>
                                                        <span><strong>Lưu ý: Sau khi Quý khách thực hiện thao tác Nạp tiền như trên, Trong thời gian hành chính (Từ 8h-17h30 các ngày thứ 2 đến thứ 7 hàng tuần) MINTIC LOGISTICS tiến hành xác thực thông tin nạp tiền. Số tiền sẽ được nạp vào tài khoản trong vòng 30p kể từ thời điểm tài khoản của chúng tôi nhận được tiền.</strong></span>

                                                        <h3 class="font-weight-700 mb-2 mt-2">THÔNG TIN NGÂN HÀNG:</h3>
                                                        <div class="row">
                                                            <asp:Literal runat="server" ID="ltrBank"></asp:Literal>
                                                        </div>
                                                    </div>

                                                    <div class="card-panel donate-information mt-3">
                                                        <h5>Xác nhận chuyển khoản</h5>
                                                        <hr />
                                                        <div class="order-row">
                                                            <div class="left-fixed">
                                                                <span>Đã chuyển vào tài khoản:</span>
                                                            </div>
                                                            <div class="right-content">
                                                                <div class="row">
                                                                    <div class=" col s12">
                                                                        <asp:DropDownList ID="ddlBank" runat="server" DataTextField="BankInfo" CssClass="icons"
                                                                            DataValueField="ID">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="order-row">
                                                            <div class="left-fixed">
                                                                <span>Số tiền:</span>
                                                            </div>
                                                            <div class="right-content">
                                                                <div class="row">
                                                                    <div class=" col s12">
                                                                        <telerik:RadNumericTextBox runat="server" Skin="MetroTouch"
                                                                            ID="pAmount" NumberFormat-DecimalDigits="0" Value="0"
                                                                            NumberFormat-GroupSizes="3" Width="100%">
                                                                        </telerik:RadNumericTextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="order-row">
                                                            <div class="left-fixed">
                                                                <span>Nội dung:</span>
                                                            </div>
                                                            <div class="right-content">
                                                                <div class="row">
                                                                    <div class=" col s12">
                                                                        <asp:TextBox ID="txtNote" runat="server" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <asp:Button ID="btnSend" runat="server" Text="Gửi xác nhận" CssClass="btn right mt-3" OnClick="btnSend_Click" />
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="card-panel">
                                                        <h5 class=" mb-2 mt-2">Lịch sử nạp gần đây</h5>
                                                        <hr />
                                                        <div class="responsive-tb mt-3">
                                                            <table class="table    highlight bordered  centered striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="tb-date">Ngày nạp</th>
                                                                        <th class="tb-date">Số tiền</th>
                                                                        <th class="tb-date">Nội dung</th>
                                                                        <th class="tb-date">Trạng thái</th>
                                                                        <th class="tb-date"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:Literal runat="server" ID="ltr"></asp:Literal>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="pagi-table float-right mt-2">
                                                            <%this.DisplayHtmlStringPaging1();%>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <asp:Button ID="btnclear" runat="server" UseSubmitBehavior="false" OnClick="btnclear_Click" Style="display: none;" />
    <asp:HiddenField ID="hdfTradeID" runat="server" />
    <script type="text/javascript">
        function deleteTrade(ID) {
            var r = confirm("Bạn muốn hủy yêu cầu?");
            if (r == true) {
                $("#<%= hdfTradeID.ClientID %>").val(ID);
                $("#<%= btnclear.ClientID %>").click();
            } else {
            }
        }
    </script>
</asp:Content>
