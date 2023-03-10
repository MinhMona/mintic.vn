using MB.Extensions;
using Microsoft.AspNet.SignalR;
using NHST.Bussiness;
using NHST.Controllers;
using NHST.Hubs;
using NHST.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NHST
{
    public partial class chi_tiet_don_hang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userLoginSystem"] != null)
                {
                    // UpdatePrice();
                    loaddata();
                }
                else
                {
                    Response.Redirect("/trang-chu");
                }
            }
        }

        public void loaddata()
        {
            string username_current = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username_current);
            if (obj_user != null)
            {
                int uid = obj_user.ID;
                hdfID.Value = obj_user.ID.ToString();
                var id = RouteData.Values["id"].ToString().ToInt(0);                

                //double UL_CKFeeBuyPro = 0;
                //double UL_CKFeeWeight = 0;

                //if (UserLevelController.GetByID(obj_user.LevelID.ToString().ToInt()).FeeBuyPro.ToString().ToFloat(0) > 0)
                //    UL_CKFeeBuyPro = Convert.ToDouble(UserLevelController.GetByID(obj_user.LevelID.ToString().ToInt()).FeeBuyPro.ToString());

                //if (UserLevelController.GetByID(obj_user.LevelID.ToString().ToInt()).FeeWeight.ToString().ToFloat(0) > 0)
                //    UL_CKFeeWeight = Convert.ToDouble(UserLevelController.GetByID(obj_user.LevelID.ToString().ToInt()).FeeWeight.ToString());

                if (id > 0)
                {
                    var o = MainOrderController.GetAllByUIDAndID(uid, id);
                    if (o != null)
                    {
                        hdfOrderID.Value = o.ID.ToString();

                        ltrMainOrderID.Text += "Chi tiết đơn hàng #" + o.ID + "";
                        ltrChat.Text = "Hỗ trợ đơn hàng #" + o.ID + "";
                        var config = ConfigurationController.GetByTop1();
                        double currency = 0;
                        double currency1 = 0;
                        if (config != null)
                        {
                            double currencyconfig = 0;
                            if (!string.IsNullOrEmpty(config.Currency))
                                currencyconfig = Convert.ToDouble(config.Currency);
                        }
                        currency = Convert.ToDouble(o.CurrentCNYVN);
                        currency1 = currency;
                        ViewState["OID"] = id;

                        #region Lịch sử thanh toán
                        var PayorderHistory = PayOrderHistoryController.GetAllByMainOrderID(o.ID);
                        if (PayorderHistory.Count > 0)
                        {
                            rptPayment.DataSource = PayorderHistory;
                            rptPayment.DataBind();
                        }
                        else
                        {
                            ltrHistoryPay.Text = "<tr class=\"noti\"><td class=\"red-text\" colspan=\"4\">Chưa có lịch sử thanh toán nào.</td></tr>";
                        }
                        #endregion

                        double UL_CKFeeBuyPro = 0;
                        double UL_CKFeeWeight = 0;

                        if (!string.IsNullOrEmpty(o.FeeBuyProCK))
                        {
                            UL_CKFeeBuyPro = Convert.ToDouble(o.FeeBuyProCK);
                        }
                        if (!string.IsNullOrEmpty(o.FeeWeightCK))
                        {
                            UL_CKFeeWeight = Convert.ToDouble(o.FeeWeightCK);
                        }

                        double servicefee = 0;
                        double pricepro = Math.Round(Convert.ToDouble(o.PriceVND), 0);                      
                        var adminfeebuypro = FeeBuyProController.GetAll();
                        if (adminfeebuypro.Count > 0)
                        {
                            foreach (var item in adminfeebuypro)
                            {
                                if (pricepro >= item.AmountFrom && pricepro < item.AmountTo)
                                {
                                    double feePercent = 0;
                                    if (item.FeePercent.ToString().ToFloat(0) > 0)
                                        feePercent = Convert.ToDouble(item.FeePercent);
                                    servicefee = feePercent / 100;
                                }
                            }
                        }
                        double feebpnotdc = pricepro * servicefee;
                        double subfeebp = feebpnotdc * UL_CKFeeBuyPro / 100;                                   

                        if (o.OrderType == 3)
                        {
                            if (o.IsCheckNotiPrice == true)
                            {
                                if (o.Status == 0)
                                    ltrCancel.Text += "   <a href=\"javascript:;\" class=\"btn btn-cancel orange accent-4\" onclick=\"cancelOrder()\">Hủy đơn hàng</a>";
                            }
                            else
                            {
                                if (o.Status == 0 && Convert.ToDouble(o.Deposit) < Convert.ToDouble(o.AmountDeposit) && Convert.ToDouble(o.TotalPriceVND) > 0)
                                {
                                    ltrbtndeposit.Text += "     <a href=\"javascript:;\" class=\"btn btn-deposit\" onclick=\"depositOrder()\">Đặt cọc</a>";
                                    ltrCancel.Text += "   <a href=\"javascript:;\" class=\"btn btn-cancel orange accent-4\" onclick=\"cancelOrder()\">Hủy đơn hàng</a>";
                                }
                            }
                        }
                        else
                        {
                            if (o.Status == 0 && Convert.ToDouble(o.Deposit) < Convert.ToDouble(o.AmountDeposit) && Convert.ToDouble(o.TotalPriceVND) > 0)
                            {
                                ltrbtndeposit.Text += "   <a href=\"javascript:;\" class=\"btn btn-deposit\" onclick=\"depositOrder()\">Đặt cọc</a>";
                                ltrCancel.Text += "   <a href=\"javascript:;\" class=\"btn btn-cancel orange accent-4\" onclick=\"cancelOrder()\">Hủy đơn hàng</a>";
                            }
                        }

                        #region lấy tất cả kiện
                        var smallpackages = SmallPackageController.GetByMainOrderID(o.ID);
                        if (smallpackages.Count > 0)
                        {
                            foreach (var s in smallpackages)
                            {
                                double quidoi = 0;
                                double pDai = Convert.ToDouble(s.Length);
                                double pRong = Convert.ToDouble(s.Width);
                                double pCao = Convert.ToDouble(s.Height);

                                if (pDai > 0 && pRong > 0 && pCao > 0)
                                    quidoi = Math.Round((pDai * pRong * pCao) / 6000, 2);

                                double cantinhtien = quidoi;
                                if (Convert.ToDouble(s.Weight) > quidoi)
                                    cantinhtien = Math.Round(Convert.ToDouble(s.Weight), 2);

                                ltrSmallPackages.Text += "<tr class=\"slide-up\">";
                                ltrSmallPackages.Text += "<td>" + s.OrderTransactionCode + "</td>";
                                ltrSmallPackages.Text += "<td>" + Math.Round(Convert.ToDouble(s.Weight), 2) + "</td>";
                                ltrSmallPackages.Text += "<td>" + pDai + " x " + pRong + " x " + pCao + "</td>";
                                ltrSmallPackages.Text += "<td>" + quidoi + "</td>";
                                ltrSmallPackages.Text += "<td>" + cantinhtien + "</td>";
                                ltrSmallPackages.Text += "<td>" + s.Description + "</td>";
                                ltrSmallPackages.Text += "<td>" + PJUtils.IntToStringStatusSmallPackageWithBGNew(Convert.ToInt32(s.Status)) + "</td>";
                                ltrSmallPackages.Text += "</tr>";
                            }
                        }
                        #endregion
                        #region Lấy thông tin người đặt
                        var ui = AccountInfoController.GetByUserID(uid);
                        if (ui != null)
                        {
                            ltrBuyerInfo.Text += "<tr>";
                            ltrBuyerInfo.Text += "<td>Tên</td>";
                            ltrBuyerInfo.Text += "<td>" + ui.FirstName + " " + ui.LastName + "</td>";
                            ltrBuyerInfo.Text += "</tr>";
                            ltrBuyerInfo.Text += "<tr>";
                            ltrBuyerInfo.Text += "<td>Địa chỉ</td>";
                            ltrBuyerInfo.Text += "<td>" + ui.Address + "</td>";
                            ltrBuyerInfo.Text += "</tr>";
                            ltrBuyerInfo.Text += "<tr>";
                            ltrBuyerInfo.Text += "<td>Email</td>";
                            ltrBuyerInfo.Text += "<td> " + ui.Email + " </td>";
                            ltrBuyerInfo.Text += "</tr>";
                            ltrBuyerInfo.Text += "<tr>";
                            ltrBuyerInfo.Text += "<td>Số ĐT</td>";
                            ltrBuyerInfo.Text += "<td>" + ui.Phone + "</td>";
                            ltrBuyerInfo.Text += "</tr>";
                            ltrBuyerInfo.Text += "<tr>";
                            ltrBuyerInfo.Text += "<td>Ghi chú</td>";
                            ltrBuyerInfo.Text += "<td>" + o.Note + "</td>";
                            ltrBuyerInfo.Text += "</tr>";
                        }
                        #endregion
                        #region Lấy sản phẩm
                        List<tbl_Order> lo = new List<tbl_Order>();
                        lo = OrderController.GetByMainOrderID(o.ID);
                        if (lo.Count > 0)
                        {
                            int stt = 1;
                            foreach (var item in lo)
                            {
                                double currentcyt = 0;
                                if (item.CurrentCNYVN.ToFloat(0) > 0)
                                    currentcyt = Convert.ToDouble(item.CurrentCNYVN);

                                double price = 0;
                                double pricepromotion = 0;
                                if (item.price_promotion.ToFloat(0) > 0)
                                    pricepromotion = Convert.ToDouble(item.price_promotion);

                                double priceorigin = 0;
                                if (item.price_origin.ToFloat(0) > 0)
                                    priceorigin = Convert.ToDouble(item.price_origin);

                                if (pricepromotion > 0)
                                {
                                    if (priceorigin > pricepromotion)
                                    {
                                        price = pricepromotion;
                                    }
                                    else
                                    {
                                        price = priceorigin;
                                    }
                                }
                                else
                                {
                                    price = priceorigin;
                                }
                                double vndprice = price * currentcyt;

                                ltrProducts.Text += "<div class=\"item-wrap\">";
                                ltrProducts.Text += "<div class=\"item-name\">";
                                ltrProducts.Text += "<div class=\"number\"><span class=\"count\">" + stt + "</span></div>";
                                ltrProducts.Text += "<div class=\"name\"><span class=\"item-img\"><img src=\"" + item.image_origin + "\"alt=\"image\"></span>";
                                ltrProducts.Text += "<div class=\"caption\"><a href=\"" + item.link_origin + "\" class=\"title black-text\">" + item.title_origin + "</a>";
                                ltrProducts.Text += "<div class=\"item-price mt-1\"><span class=\"pr-2 black-text font-weight-600\">" + item.property + "</span>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "<div class=\"note\"><span class=\"black-text font-weight-500\">Ghi chú: </span>";
                                ltrProducts.Text += "<div class=\"input-field inline\"><input type=\"text\" value=\"" + item.brand + "\" class=\"validate\"></div>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "<div class=\"item-info\">";
                                ltrProducts.Text += "<div class=\"item-num column\"><span class=\"black-text\"><strong>Số lượng</strong></span><p>" + item.quantity + "</p><p></p></div>";
                                ltrProducts.Text += "<div class=\"item-price column\"><span class=\"black-text\"><strong>Đơn giá</strong></span>";
                                ltrProducts.Text += "<p class=\"grey-text font-weight-500\">¥" + string.Format("{0:0.##}", price) + "</p>";
                                ltrProducts.Text += "<p class=\"grey-text font-weight-500\">" + string.Format("{0:N0}", vndprice) + " VNĐ</p>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "<div class=\"item-status column\"><span class=\"black-text\"><strong>Trạng thái</strong></span>";
                                if (!string.IsNullOrEmpty(item.ProductStatus.ToString()))
                                {
                                    if (item.ProductStatus == 1)
                                        ltrProducts.Text += "<p class=\"green-text\">Còn hàng</p>";
                                    else
                                        ltrProducts.Text += "<p class=\"red-text\">Hết hàng</p>";
                                }
                                else
                                {
                                    ltrProducts.Text += "<p class=\"green-text\">Còn hàng</p>";
                                }

                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "</div>";
                                ltrProducts.Text += "</div>";

                                stt++;
                            }
                        }                       

                        ltrService.Text += "<li><span class=\"lbl\">Tỷ giá niêm yết</span><span class=\"value\">" +  o.CurrentCNYVN + " VNĐ</span></li>";
                        ltrService.Text += "<li><span class=\"lbl\">Tiền hàng</span><span class=\"value\">" + string.Format("{0:N0}", Convert.ToDouble(o.PriceVND)) + " VNĐ ~ (<i class=\"fa fa-yen\"></i>" + string.Format("{0:#.##}", Convert.ToDouble(o.PriceVND) / o.CurrentCNYVN.ToFloat()) + ")</span></li>";
                        if (!string.IsNullOrEmpty(o.FeeBuyPro))
                        {
                            double bp = Convert.ToDouble(o.FeeBuyPro);
                            if (bp > 0)
                            {
                                if (UL_CKFeeBuyPro > 0)
                                    ltrService.Text += "<li><span class=\"lbl\">Phí mua hàng (Đã CK " + UL_CKFeeBuyPro + "% : " + string.Format("{0:N0}", subfeebp) + " VNĐ)</span><span class=\"value\">" + string.Format("{0:N0}", bp) + " VNĐ</span></li>";
                                else
                                    ltrService.Text += "<li><span class=\"lbl\">Phí mua hàng</span><span class=\"value\">" + string.Format("{0:N0}", bp) + " VNĐ</span></li>";
                            }
                            else
                                ltrService.Text += "<li><span class=\"lbl\">Phí mua hàng</span><span class=\"value\">Đang cập nhật</span></li>";
                        }
                        else
                            ltrService.Text += "<li><span class=\"lbl\">Phí mua hàng</span><span class=\"value\">Đang cập nhật</span></li>";

                        if (!string.IsNullOrEmpty(o.FeeShipCN))
                        {
                            double fscn = Math.Floor(Convert.ToDouble(o.FeeShipCN));
                            double phhinoidiate = fscn / currency1;
                            ltrService.Text += "<li><span class=\"lbl\">Phí ship nội địa TQ</span><span class=\"value\">" + string.Format("{0:N0}", Convert.ToDouble(o.FeeShipCN)) + " VNĐ (¥ " + phhinoidiate + ")</span></li>";
                        }
                        else
                            ltrService.Text += "<li><span class=\"lbl\">Phí ship nội địa TQ</span><span class=\"value\">Đang cập nhật</span></li>";

                        ltrService.Text += "<li><span class=\"lbl\">Phí kiểm đếm</span><span class=\"value\">" + string.Format("{0:N0}", o.IsCheckProductPrice.ToFloat(0)) + " VNĐ</span></li>";

                        ltrService.Text += "<li><span class=\"lbl\">Phí đóng gỗ</span><span class=\"value\">" + string.Format("{0:N0}", Convert.ToDouble(o.IsPackedPrice)) + " VNĐ</span></li>";

                        ltrService.Text += "<li><span class=\"lbl\">Phí bảo hiểm</span><span class=\"value\">" + string.Format("{0:N0}", Convert.ToDouble(o.InsuranceMoney)) + " VNĐ</span></li>";

                        ltrService.Text += "<li><span class=\"lbl\">Phụ phí</span><span class=\"value\">" + string.Format("{0:N0}", Convert.ToDouble(o.TotalFeeSupport)) + " VNĐ</span></li>";
                                                

                        if (UL_CKFeeWeight > 0)
                        {
                            ltrService.Text += "<li><span class=\"lbl\">Phí cân nặng (Đã CK " + UL_CKFeeWeight + "% : " + string.Format("{0:N0}", o.FeeWeightDiscount.ToFloat(0) > 0 ? Convert.ToDouble(o.FeeWeightDiscount) : 0) + " VNĐ)</span><span class=\"value\">" + o.TQVNWeight + " kg - " + string.Format("{0:N0}", o.FeeWeight.ToFloat(0)) + " VNĐ</span></li>";
                        }
                        else
                        {
                            ltrService.Text += "<li><span class=\"lbl\">Phí cân nặng</span><span class=\"value\">" + o.TQVNWeight + " kg - " + string.Format("{0:N0}", o.FeeWeight.ToFloat(0)) + " VNĐ</span></li>";
                        }

                        double feeinwarehouse = 0;
                        if (o.FeeInWareHouse != null)
                        {
                            feeinwarehouse = Convert.ToDouble(o.FeeInWareHouse);
                        }

                        if (feeinwarehouse > 0)
                        {
                            ltrService.Text += "<li><span class=\"lbl\">Phí lưu kho</span><span class=\"value\">" + string.Format("{0:N0}", feeinwarehouse) + " VNĐ</span></li>";
                        }
                        #endregion
                        #region Tổng tiền
                        ltrTotal.Text += "<li class=\"\"><span class=\"lbl\">Tổng tiền đơn hàng</span><span class=\"value \">" + string.Format("{0:N0}", Convert.ToDouble(o.TotalPriceVND) + feeinwarehouse) + " VNĐ</span></li>";
                        if (!string.IsNullOrEmpty(o.AmountDeposit))
                            ltrTotal.Text += "<li class=\"\"><span class=\"lbl\">Số tiền phải cọc</span><span class=\"value \">" + string.Format("{0:N0}", Convert.ToDouble(o.AmountDeposit)) + " VNĐ</span></li>";

                        double deposit = 0;
                        if (!string.IsNullOrEmpty(o.Deposit))
                        {
                            deposit = Convert.ToDouble(o.Deposit);
                            ltrTotal.Text += "<li class=\"\"><span class=\"lbl\">Đã thanh toán</span><span class=\"value \">" + string.Format("{0:N0}", deposit) + " VNĐ</span></li>";
                        }
                        else
                            ltrTotal.Text += "<li class=\"\"><span class=\"lbl\">Đã thanh toán</span><span class=\"value \">Chưa đặt cọc</span></li>";

                        ltrTotal.Text += "<li class=\"\"><span class=\"lbl\">Còn lại</span><span class=\"value red-text font-weight-700\">" + string.Format("{0:N0}", Convert.ToDouble(o.TotalPriceVND) + feeinwarehouse - deposit) + " VNĐ</span></li>";
                        #endregion
                        #region Tổng quan
                        ltrOverView.Text += "<div class=\"col s12 m6\">";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Trạng thái đơn hàng: </span></div>";
                        if (o.OrderType == 3)
                        {
                            if (o.IsCheckNotiPrice == true)
                            {
                                if (o.Status == 1)
                                {
                                    ltrOverView.Text += "<div class=\"right-content\"><span class=\"badge black darken-2 left m-0\">Hủy đơn hàng</span></div>";
                                }
                                else
                                {
                                    ltrOverView.Text += "<div class=\"right-content\"><span class=\"badge orange darken-2 left m-0\">Chờ báo giá</span></div>";
                                }
                            }
                            else
                            {
                                ltrOverView.Text += "<div class=\"right-content\">" + PJUtils.IntToRequestClientNew(Convert.ToInt32(o.Status)) + "</div>";
                            }
                        }
                        else
                        {
                            ltrOverView.Text += "<div class=\"right-content\">" + PJUtils.IntToRequestClientNew(Convert.ToInt32(o.Status)) + "</div>";
                        }

                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Tổng tiền đơn hàng: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + string.Format("{0:N0}", Convert.ToDouble(o.TotalPriceVND) + feeinwarehouse) + " VNĐ</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Số tiền phải cọc: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + string.Format("{0:N0}", Convert.ToDouble(o.AmountDeposit)) + " VNĐ</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Đã thanh toán: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + string.Format("{0:N0}", Convert.ToDouble(o.Deposit)) + " VNĐ</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Còn lại: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"red-text font-weight-700\">" + string.Format("{0:N0}", Convert.ToDouble(o.TotalPriceVND) + feeinwarehouse - deposit) + " VNĐ</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "<div class=\"col s12 m6\">";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Kho TQ: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + WarehouseFromController.GetByID(Convert.ToInt32(o.FromPlace)).WareHouseName + "</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Kho nhận: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + WarehouseController.GetByID(Convert.ToInt32(o.ReceivePlace)).WareHouseName + "</span></div>";
                        ltrOverView.Text += "</div>";
                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Phương thức VC: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\">" + ShippingTypeToWareHouseController.GetByID(Convert.ToInt32(o.ShippingType)).ShippingTypeName + "</span></div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Kiểm đếm: </span></div>";
                        if (o.IsCheckProduct == true)
                            ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\"><i class=\"material-icons green-text left\">check_circle</i></span></div>";
                        else
                            ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\"><i class=\"material-icons red-text left\">clear</i></span></div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Đóng gỗ: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\">";
                        if (o.IsPacked == true)
                            ltrOverView.Text += "<span class=\"bold\"><i class=\"material-icons green-text left\">check_circle</i></span></div>";
                        else
                            ltrOverView.Text += "<span class=\"bold\"><i class=\"material-icons red-text left\">clear</i></span></div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Bảo hiểm: </span></div>";
                        ltrOverView.Text += "<div class=\"right-content\">";
                        if (o.IsInsurrance == true)
                            ltrOverView.Text += "<span class=\"bold\"><i class=\"material-icons green-text left\">check_circle</i></span></div>";
                        else
                            ltrOverView.Text += "<span class=\"bold\"><i class=\"material-icons red-text left\">clear</i></span></div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "<div class=\"order-row\">";
                        ltrOverView.Text += "<div class=\"left-fixed\"><span class=\"lb\">Giao hàng tận nhà: </span></div>";
                        if (o.IsFastDelivery == true)
                            ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\"><i class=\"material-icons green-text left\">check_circle</i></span></div>";
                        else
                            ltrOverView.Text += "<div class=\"right-content\"><span class=\"bold\"><i class=\"material-icons red-text left\">clear</i></span></div>";
                        ltrOverView.Text += "</div>";

                        ltrOverView.Text += "</div>";
                        #endregion
                        #region Lấy bình luận
                        ltrComment.Text += "<div class=\"comment mar-bot2\">";
                        ltrComment.Text += "     <div class=\"comment_content\" seller=\"" + o.ShopID + "\" order=\"" + o.ID + "\" >";
                        var shopcomments = OrderCommentController.GetByOrderIDAndType(o.ID, 1);
                        StringBuilder chathtml = new StringBuilder();
                        if (shopcomments.Count > 0)
                        {
                            foreach (var item in shopcomments)
                            {
                                string fullname = "";
                                int role = 0;
                                var user = AccountController.GetByID(Convert.ToInt32(item.CreatedBy));
                                var userinfo = AccountInfoController.GetByUserID(user.ID);
                                if (user != null)
                                {
                                    role = Convert.ToInt32(user.RoleID);

                                    if (userinfo != null)
                                    {
                                        fullname = userinfo.FirstName + " " + userinfo.LastName;
                                    }
                                }
                                if (role == 1)
                                {
                                    chathtml.Append("<div class=\"chat chat-right\">");
                                }
                                else
                                {
                                    chathtml.Append("<div class=\"chat\">");
                                }
                                chathtml.Append("<div class=\"chat-avatar\">");
                                chathtml.Append("    <p class=\"name\">" + fullname + "</p>");
                                chathtml.Append("</div>");
                                chathtml.Append("<div class=\"chat-body\">");
                                chathtml.Append("        <div class=\"chat-text\">");
                                chathtml.Append("                <div class=\"date-time center-align\">" + string.Format("{0:dd/MM/yyyy HH:mm}", item.CreatedDate) + "</div>");
                                chathtml.Append("                <div class=\"text-content\">");
                                chathtml.Append("                    <div class=\"content\">");
                                if (!string.IsNullOrEmpty(item.Link))
                                {
                                    chathtml.Append("<div class=\"content-img\">");
                                    chathtml.Append("<div class=\"img-block\">");
                                    if (item.Link.Contains(".doc"))
                                    {
                                        chathtml.Append("<a href=\"" + item.Link + "\" target=\"_blank\"><img src=\"/App_Themes/UserNew45/assets/images/icon/file.png\" title=\"" + item.Comment + "\"  class=\"\" height=\"50\"/></a>");

                                    }
                                    else if (item.Link.Contains(".xls"))
                                    {
                                        chathtml.Append("<a href=\"" + item.Link + "\" target=\"_blank\"><img src=\"/App_Themes/UserNew45/assets/images/icon/file.png\" title=\"" + item.Comment + "\"  class=\"\" height=\"50\"/></a>");
                                    }
                                    else
                                    {
                                        chathtml.Append("<a href=\"" + item.Link + "\" target=\"_blank\"><img src=\"" + item.Link + "\" title=\"" + item.Comment + "\"  class=\"\" height=\"50\"/></a>");
                                    }
                                    //chathtml.Append("<img src=\"" + item.Link + "\" title=\"" + item.Comment + "\"  class=\"\" height=\"50\"/>");
                                    chathtml.Append("</div>");
                                    chathtml.Append("</div>");
                                }
                                else
                                {
                                    chathtml.Append("                    <p>" + item.Comment + "</p>");
                                }
                                chathtml.Append("                    </div>");
                                chathtml.Append("                </div>");
                                chathtml.Append("        </div>");
                                chathtml.Append("</div>");
                                chathtml.Append("</div>");


                            }
                        }
                        else
                        {
                            //chathtml.Append("<span class=\"no-comment-staff\">Hiện chưa có đánh giá nào.</span>");
                        }
                        ltrComment.Text = chathtml.ToString();
                        #endregion
                    }
                    else
                    {
                        Response.Redirect("/trang-chu");
                    }
                }
            }
        }

        public class warehouses
        {
            public string name { get; set; }
            public string lat { get; set; }
            public string lng { get; set; }
            public List<package> package { get; set; }
        }

        public class package
        {
            public string code { get; set; }
            public string status { get; set; }
            public string classColor { get; set; }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            DateTime currentDate = DateTime.Now;
            string username = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username);
            if (obj_user != null)
            {
                int uid = obj_user.ID;
                var id = RouteData.Values["id"].ToString().ToInt(0);
                if (id > 0)
                {
                    var o = MainOrderController.GetAllByUIDAndID(uid, id);
                    if (o != null)
                    {
                        if (o.Status == 0)
                        {
                            double wallet = 0;
                            if (obj_user.Wallet.ToString().ToFloat(0) > 0)
                                wallet = Convert.ToDouble(obj_user.Wallet);
                            wallet = wallet + Convert.ToDouble(o.Deposit);

                            AccountController.updateWallet(obj_user.ID, wallet, currentDate, obj_user.Username);
                            MainOrderController.UpdateDeposit(o.ID, obj_user.ID, "0");
                           
                            HistoryOrderChangeController.Insert(o.ID, uid, username, username +
                            " đã đổi trạng thái của đơn hàng ID là: " + o.ID + ", từ: Chờ đặt cọc, sang: Hủy đơn hàng.", 1, currentDate);

                            string kq = MainOrderController.UpdateStatus(id, uid, 1);
                            if (kq == "ok")
                                Page.Response.Redirect(Page.Request.Url.ToString(), true);
                        }
                    }
                }
            }
        }        

        protected void btnPayAll_Click(object sender, EventArgs e)
        {
            string username = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username);
            if (obj_user != null)
            {
                int uid = obj_user.ID;
                var id = ViewState["OID"].ToString().ToInt(0);
                DateTime currentDate = DateTime.Now;
                if (id > 0)
                {
                    var o = MainOrderController.GetAllByUIDAndID(uid, id);
                    if (o != null)
                    {
                        double deposit = 0;
                        if (o.Deposit.ToFloat(0) > 0)
                            deposit = Math.Round(Convert.ToDouble(o.Deposit), 0);

                        double wallet = 0;
                        if (obj_user.Wallet.ToString().ToFloat(0) > 0)
                            wallet = Math.Round(Convert.ToDouble(obj_user.Wallet), 0);

                        double feewarehouse = 0;
                        if (o.FeeInWareHouse.ToString().ToFloat(0) > 0)
                            feewarehouse = Math.Round(Convert.ToDouble(o.FeeInWareHouse), 0);

                        double totalPriceVND = 0;
                        if (o.TotalPriceVND.ToFloat(0) > 0)
                            totalPriceVND = Math.Round(Convert.ToDouble(o.TotalPriceVND), 0);
                        double moneyleft = Math.Round((totalPriceVND + feewarehouse) - deposit, 0);

                        if (wallet >= moneyleft)
                        {
                            double walletLeft = Math.Round(wallet - moneyleft, 0);
                            double payalll = Math.Round(deposit + moneyleft, 0);

                            #region Cập nhật ví và đơn hàng
                            //                MainOrderController.UpdateStatus(o.ID, uid, 9);
                            //                MainOrderController.UpdatePayDate(o.ID, currentDate);
                            //                int statusOOld = Convert.ToInt32(o.Status);
                            //                int statusONew = 9;
                            //                //if (statusONew != statusOOld)
                            //                //{
                            //                //    StatusChangeHistoryController.Insert(o.ID, statusOOld, statusONew, currentDate, obj_user.Username);
                            //                //}
                            //                AccountController.updateWallet(uid, walletLeft, currentDate, username);
                            //                HistoryOrderChangeController.Insert(o.ID, uid, username, username +
                            //" đã đổi trạng thái của đơn hàng ID là: " + o.ID + ", từ: Chờ thanh toán, sang: Khách đã thanh toán.", 1, currentDate);
                            //                HistoryPayWalletController.Insert(uid, username, o.ID, moneyleft, username + " đã thanh toán đơn hàng: " + o.ID + ".", walletLeft, 1, 3, currentDate, username);
                            //                MainOrderController.UpdateDeposit(id, uid, payalll.ToString());
                            //                PayOrderHistoryController.Insert(id, uid, 9, moneyleft, 2, currentDate, username);
                            #endregion

                            int st = TransactionController.PayAll(o.ID, wallet, o.Status.ToString().ToInt(0), uid, currentDate, username, deposit, 1, moneyleft, 1, 3, 2);
                            if (st == 1)
                            {
                                var setNoti = SendNotiEmailController.GetByID(11);
                                if (setNoti != null)
                                {
                                    if (setNoti.IsSentNotiAdmin == true)
                                    {
                                        var admins = AccountController.GetAllByRoleID(0);
                                        if (admins.Count > 0)
                                        {
                                            foreach (var admin in admins)
                                            {
                                                NotificationsController.Inser(admin.ID, admin.Username, o.ID, "Đơn hàng " + o.ID + " đã được thanh toán.",
                                                1, currentDate, obj_user.Username, false);
                                                //string strPathAndQuery = Request.Url.PathAndQuery;
                                                //string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                //string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                //PJUtils.PushNotiDesktop(admin.ID, "Đơn hàng " + o.ID + " đã được thanh toán.", datalink);
                                            }
                                        }

                                        var managers = AccountController.GetAllByRoleID(2);
                                        if (managers.Count > 0)
                                        {
                                            foreach (var manager in managers)
                                            {
                                                NotificationsController.Inser(manager.ID, manager.Username, o.ID, "Đơn hàng " + o.ID + " đã được thanh toán.",
                                                1, currentDate, obj_user.Username, false);
                                                //string strPathAndQuery = Request.Url.PathAndQuery;
                                                //string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                //string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                //PJUtils.PushNotiDesktop(manager.ID, "Đơn hàng " + o.ID + " đã được thanh toán.", datalink);
                                            }
                                        }

                                        //var cskhs = AccountController.GetAllByRoleID(9);
                                        //if (cskhs.Count > 0)
                                        //{
                                        //    foreach (var cskh in cskhs)
                                        //    {
                                        //        NotificationsController.Inser(cskh.ID, cskh.Username, o.ID, "Đơn hàng " + o.ID + " đã được thanh toán.",
                                        //        1, currentDate, obj_user.Username, false);
                                        //        //string strPathAndQuery = Request.Url.PathAndQuery;
                                        //        //string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                        //        //string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                        //        //PJUtils.PushNotiDesktop(cskh.ID, "Đơn hàng " + o.ID + " đã được thanh toán.", datalink);
                                        //    }
                                        //}
                                    }

                                    //if (setNoti.IsSentEmailAdmin == true)
                                    //{
                                    //    var admins = AccountController.GetAllByRoleID(0);
                                    //    if (admins.Count > 0)
                                    //    {
                                    //        foreach (var admin in admins)
                                    //        {
                                    //            try
                                    //            {
                                    //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", admin.Email,
                                    //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã được thanh toán.", "");
                                    //            }
                                    //            catch { }
                                    //        }
                                    //    }

                                    //    var managers = AccountController.GetAllByRoleID(2);
                                    //    if (managers.Count > 0)
                                    //    {
                                    //        foreach (var manager in managers)
                                    //        {
                                    //            try
                                    //            {
                                    //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", manager.Email,
                                    //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã được thanh toán.", "");
                                    //            }
                                    //            catch { }
                                    //        }
                                    //    }
                                    //}
                                }

                                PJUtils.ShowMessageBoxSwAlert("Thanh toán thành công.", "s", true, Page);
                            }
                            else
                            {
                                PJUtils.ShowMessageBoxSwAlert("Có lỗi trong quá trình xử lý, vui lòng thử lại sau.", "e", true, Page);
                            }
                        }
                        else
                        {
                            PJUtils.ShowMessageBoxSwAlert("Số tiền trong tài khoản của bạn không đủ để thanh toán đơn hàng.", "e", true, Page);
                        }
                    }
                }
            }
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            string username_current = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username_current);
            DateTime currentDate = DateTime.Now;
            if (obj_user != null)
            {
                if (obj_user.Wallet > 0)
                {
                    int OID = ViewState["OID"].ToString().ToInt();
                    if (OID > 0)
                    {
                        var o = MainOrderController.GetAllByID(OID);
                        if (o != null)
                        {
                            double orderdeposited = 0;
                            double amountdeposit = 0;
                            double userwallet = 0;

                            if (o.Deposit.ToFloat(0) > 0)
                                orderdeposited = Math.Round(Convert.ToDouble(o.Deposit), 0);
                            if (o.AmountDeposit.ToFloat(0) > 0)
                                amountdeposit = Math.Round(Convert.ToDouble(o.AmountDeposit), 0);
                            if (obj_user.Wallet.ToString().ToFloat(0) > 0)
                                userwallet = Math.Round(Convert.ToDouble(obj_user.Wallet), 0);
                            double custDeposit = amountdeposit - orderdeposited;
                            if (userwallet > 0)
                            {
                                if (userwallet >= custDeposit)
                                {
                                    var setNoti = SendNotiEmailController.GetByID(6);

                                    double wallet = userwallet - custDeposit;
                                    wallet = Math.Round(wallet, 0);

                                    #region cập nhật ví khách hàng và đơn hàng
                                    //AccountController.updateWallet(obj_user.ID, wallet, currentDate, obj_user.Username);
                                    ////Cập nhật lại MainOrder                                
                                    //MainOrderController.UpdateStatus(o.ID, obj_user.ID, 2);
                                    //int statusOOld = Convert.ToInt32(o.Status);
                                    //int statusONew = 2;
                                    ////if (statusONew != statusOOld)
                                    ////{
                                    ////    StatusChangeHistoryController.Insert(o.ID, statusOOld, statusONew, currentDate, obj_user.Username);
                                    ////}
                                    //MainOrderController.UpdateDeposit(o.ID, obj_user.ID, amountdeposit.ToString());
                                    //MainOrderController.UpdateDepositDate(o.ID, currentDate);
                                    //HistoryOrderChangeController.Insert(o.ID, obj_user.ID, obj_user.Username, obj_user.Username +
                                    //   " đã đổi trạng thái của đơn hàng ID là: " + o.ID + ", từ: Chờ đặt cọc, sang: Đã đặt cọc.", 1, currentDate);
                                    //HistoryPayWalletController.Insert(obj_user.ID, obj_user.Username, o.ID, custDeposit,
                                    //    obj_user.Username + " đã đặt cọc đơn hàng: " + o.ID + ".", wallet, 1, 1, currentDate,
                                    //    obj_user.Username);
                                    //PayOrderHistoryController.Insert(o.ID, obj_user.ID, 2, custDeposit, 2, currentDate, obj_user.Username);
                                    #endregion

                                    int st = TransactionController.DepositAll(obj_user.ID, wallet, currentDate, obj_user.Username, o.ID, 2, o.Status.Value, amountdeposit.ToString(), custDeposit, obj_user.Username + " đã đặt cọc đơn hàng: " + o.ID, 1, 1, 2);
                                    if (st == 1)
                                    {                                       
                                        if (setNoti != null)
                                        {
                                            if (setNoti.IsSentNotiAdmin == true)
                                            {

                                                var admins = AccountController.GetAllByRoleID(0);
                                                if (admins.Count > 0)
                                                {
                                                    foreach (var admin in admins)
                                                    {
                                                        NotificationsController.Inser(admin.ID, admin.Username, o.ID, "Đơn hàng " + o.ID + " đã được đặt cọc.", 1, currentDate, obj_user.Username, false);
                                                        string strPathAndQuery = Request.Url.PathAndQuery;
                                                        string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                        string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                        PJUtils.PushNotiDesktop(admin.ID, "Đơn hàng " + o.ID + " đã được đặt cọc.", datalink);
                                                    }
                                                }

                                                var managers = AccountController.GetAllByRoleID(2);
                                                if (managers.Count > 0)
                                                {
                                                    foreach (var manager in managers)
                                                    {
                                                        NotificationsController.Inser(manager.ID, manager.Username, o.ID, "Đơn hàng " + o.ID + " đã được đặt cọc.",
                                                        1, currentDate, obj_user.Username, false);
                                                        string strPathAndQuery = Request.Url.PathAndQuery;
                                                        string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                        string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                        PJUtils.PushNotiDesktop(manager.ID, "Đơn hàng " + o.ID + " đã được được đặt cọc.", datalink);
                                                    }
                                                }

                                                //var cskhs = AccountController.GetAllByRoleID(9);
                                                //if (cskhs.Count > 0)
                                                //{
                                                //    foreach (var cskh in cskhs)
                                                //    {


                                                //        NotificationsController.Inser(cskh.ID, cskh.Username, o.ID, "Đơn hàng " + o.ID + " đã được đặt cọc.",
                                                //        1, currentDate, obj_user.Username, false);
                                                //        //string strPathAndQuery = Request.Url.PathAndQuery;
                                                //        //string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                //        //string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                //        //PJUtils.PushNotiDesktop(cskh.ID, "Đơn hàng " + o.ID + " đã được được đặt cọc.", datalink);
                                                //    }
                                                //}
                                            }

                                            //if (setNoti.IsSentEmailAdmin == true)
                                            //{
                                            //    var admins = AccountController.GetAllByRoleID(0);
                                            //    if (admins.Count > 0)
                                            //    {
                                            //        foreach (var admin in admins)
                                            //        {
                                            //            try
                                            //            {
                                            //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", admin.Email,
                                            //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã được đặt cọc.", "");
                                            //            }
                                            //            catch { }
                                            //        }
                                            //    }

                                            //    var managers = AccountController.GetAllByRoleID(2);
                                            //    if (managers.Count > 0)
                                            //    {
                                            //        foreach (var manager in managers)
                                            //        {
                                            //            try
                                            //            {
                                            //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", manager.Email,
                                            //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã được đặt cọc.", "");
                                            //            }
                                            //            catch { }
                                            //        }
                                            //    }

                                            //}
                                        }
                                        PJUtils.ShowMessageBoxSwAlert("Đặt cọc đơn hàng thành công.", "s", true, Page);
                                    }
                                    else
                                    {
                                        PJUtils.ShowMessageBoxSwAlert("Có lỗi trong quá trình xử lý.", "e", true, Page);
                                    }
                                }
                                else
                                {
                                    PJUtils.ShowMessageBoxSwAlertBackToLink("Số dư trong tài khoản của quý khách không đủ để đặt cọc đơn hàng này. Quý khách vui lòng nạp thêm tiền để tiến hành đặt cọc.", "e", true, "/chuyen-muc/huong-dan/nap-tien", Page);
                                }
                                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
                            }
                            else
                            {
                                PJUtils.ShowMessageBoxSwAlertBackToLink("Số dư trong tài khoản của quý khách không đủ để đặt cọc đơn hàng này. Quý khách vui lòng nạp thêm tiền để tiến hành đặt cọc.", "e", true, "/chuyen-muc/huong-dan/nap-tien", Page);
                            }
                        }
                    }
                }
                else
                {
                    PJUtils.ShowMessageBoxSwAlertBackToLink("Số dư trong tài khoản của quý khách không đủ để đặt cọc đơn hàng này. Quý khách vui lòng nạp thêm tiền để tiến hành đặt cọc.", "e", true, "/chuyen-muc/huong-dan/nap-tien", Page);
                }
            }
        }
        [WebMethod]
        public static string PostComment(string commentext, string shopid, string urlIMG, string real)
        {
            var listLink = urlIMG.Split('|').ToList();
            if (listLink.Count > 0)
            {
                listLink.RemoveAt(listLink.Count - 1);
            }
            var listComment = real.Split('|').ToList();
            if (listComment.Count > 0)
            {
                listComment.RemoveAt(listComment.Count - 1);
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string username = HttpContext.Current.Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username);
            DateTime currentDate = DateTime.Now;
            if (obj_user != null)
            {
                int uid = obj_user.ID;
                //var id = RouteData.Values["id"].ToString().ToInt(0);
                int id = shopid.ToInt(0);
                if (id > 0)
                {
                    var o = MainOrderController.GetAllByUIDAndID(uid, id);
                    if (o != null)
                    {
                        string message = "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem";
                        int salerID = Convert.ToInt32(o.SalerID);
                        int dathangID = Convert.ToInt32(o.DathangID);
                        int khotqID = Convert.ToInt32(o.KhoTQID);
                        int khovnID = Convert.ToInt32(o.KhoVNID);
                        var setNoti = SendNotiEmailController.GetByID(12);

                        if (setNoti != null)
                        {
                            if (setNoti.IsSentNotiAdmin == true)
                            {
                                if (salerID > 0)
                                {
                                    var saler = AccountController.GetByID(salerID);
                                    if (saler != null)
                                    {
                                        NotificationsController.Inser(salerID,
                                            saler.Username, id,
                                            message, 1,
                                            currentDate, obj_user.Username, false);
                                    }
                                }
                                if (dathangID > 0)
                                {
                                    var dathang = AccountController.GetByID(dathangID);
                                    if (dathang != null)
                                    {
                                        NotificationsController.Inser(dathangID,
                                            dathang.Username, id,
                                            message, 1,
                                            currentDate, obj_user.Username, false);
                                    }
                                }
                                if (khotqID > 0)
                                {
                                    var khotq = AccountController.GetByID(khotqID);
                                    if (khotq != null)
                                    {
                                        NotificationsController.Inser(khotqID,
                                            khotq.Username, id,
                                            message, 1,
                                            currentDate, obj_user.Username, false);
                                    }
                                }
                                if (khovnID > 0)
                                {
                                    var khovn = AccountController.GetByID(khovnID);
                                    if (khovn != null)
                                    {
                                        NotificationsController.Inser(khovnID,
                                            khovn.Username, id,
                                            message, 1,
                                            currentDate, obj_user.Username, false);
                                    }
                                }

                                var admins = AccountController.GetAllByRoleID(0);
                                if (admins.Count > 0)
                                {
                                    foreach (var admin in admins)
                                    {
                                        NotificationsController.Inser(admin.ID,
                                                                           admin.Username, id,
                                                                           message, 1,
                                                                           currentDate, obj_user.Username, false);
                                    }
                                }

                                var managers = AccountController.GetAllByRoleID(2);
                                if (managers.Count > 0)
                                {
                                    foreach (var manager in managers)
                                    {
                                        NotificationsController.Inser(manager.ID,
                                                                           manager.Username, id,
                                                                           message, 1,
                                                                           currentDate, obj_user.Username, false);
                                    }
                                }

                                var cskhs = AccountController.GetAllByRoleID(9);
                                if (cskhs.Count > 0)
                                {
                                    foreach (var cskh in cskhs)
                                    {
                                        NotificationsController.Inser(cskh.ID,
                                                                           cskh.Username, id,
                                                                           message, 1,
                                                                           currentDate, obj_user.Username, false);
                                    }
                                }
                            }
                        }
                        for (int i = 0; i < listLink.Count; i++)
                        {
                            string kqq = OrderCommentController.InsertNew(id, listLink[i], listComment[i], true, 1, DateTime.UtcNow.AddHours(7), uid);
                        }
                        if (!string.IsNullOrEmpty(commentext))
                        {
                            string kq = OrderCommentController.Insert(id, commentext, true, 1, currentDate, uid);
                            ChatHub ch = new ChatHub();
                            ch.SendMessenger(uid, id, commentext, listLink, listComment);
                            CustomerComment dataout = new CustomerComment();
                            dataout.UID = uid;
                            dataout.OrderID = id;
                            StringBuilder showIMG = new StringBuilder();
                            for (int i = 0; i < listLink.Count; i++)
                            {
                                showIMG.Append("<div class=\"chat chat-right\">");
                                showIMG.Append("    <div class=\"chat-avatar\">");
                                showIMG.Append("    <p class=\"name\">" + AccountInfoController.GetByUserID(uid).FirstName + " " + AccountInfoController.GetByUserID(uid).LastName + "</p>");
                                showIMG.Append("    </div>");
                                showIMG.Append("    <div class=\"chat-body\">");
                                showIMG.Append("        <div class=\"chat-text\">");
                                showIMG.Append("            <div class=\"date-time center-align\">" + string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.UtcNow.AddHours(7)) + "</div>");
                                showIMG.Append("            <div class=\"text-content\">");
                                showIMG.Append("                <div class=\"content\">");
                                showIMG.Append("                    <div class=\"content-img\">");
                                showIMG.Append("	                    <div class=\"img-block\">");
                                if (listLink[i].Contains(".doc"))
                                {
                                    showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"/App_Themes/UserNew45/assets/images/icon/file.png\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");

                                }
                                else if (listLink[i].Contains(".xls"))
                                {
                                    showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"/App_Themes/UserNew45/assets/images/icon/file.png\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");
                                }
                                else
                                {
                                    showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"" + listLink[i] + "\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");
                                }
                                showIMG.Append("	                    </div>");
                                showIMG.Append("                    </div>");
                                showIMG.Append("                </div>");
                                showIMG.Append("            </div>");
                                showIMG.Append("        </div>");
                                showIMG.Append("    </div>");
                                showIMG.Append("</div>");
                            }
                            showIMG.Append("<div class=\"chat chat-right\">");
                            showIMG.Append("    <div class=\"chat-avatar\">");
                            showIMG.Append("    <p class=\"name\">" + AccountInfoController.GetByUserID(uid).FirstName + " " + AccountInfoController.GetByUserID(uid).LastName + "</p>");
                            showIMG.Append("    </div>");
                            showIMG.Append("    <div class=\"chat-body\">");
                            showIMG.Append("        <div class=\"chat-text\">");
                            showIMG.Append("            <div class=\"date-time center-align\">" + string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.UtcNow.AddHours(7)) + "</div>");
                            showIMG.Append("            <div class=\"text-content\">");
                            showIMG.Append("                <div class=\"content\">");
                            showIMG.Append("                    <p>" + commentext + "</p>");
                            showIMG.Append("                </div>");
                            showIMG.Append("            </div>");
                            showIMG.Append("        </div>");
                            showIMG.Append("    </div>");
                            showIMG.Append("</div>");
                            dataout.Comment = showIMG.ToString();
                            return serializer.Serialize(dataout);
                        }
                        else
                        {
                            if (listComment.Count > 0)
                            {
                                ChatHub ch = new ChatHub();
                                ch.SendMessenger(uid, id, commentext, listLink, listComment);
                                CustomerComment dataout = new CustomerComment();
                                StringBuilder showIMG = new StringBuilder();
                                for (int i = 0; i < listLink.Count; i++)
                                {

                                    showIMG.Append("<div class=\"chat chat-right\">");
                                    showIMG.Append("<div class=\"chat-avatar\">");
                                    showIMG.Append("    <p class=\"name\">" + AccountInfoController.GetByUserID(uid).FirstName + " " + AccountInfoController.GetByUserID(uid).LastName + "</p>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("<div class=\"chat-body\">");
                                    showIMG.Append("<div class=\"chat-text\">");
                                    showIMG.Append("<div class=\"date-time center-align\">" + string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.UtcNow.AddHours(7)) + "</div>");
                                    showIMG.Append("<div class=\"text-content\">");
                                    showIMG.Append("<div class=\"content\">");
                                    showIMG.Append("<div class=\"content-img\">");
                                    showIMG.Append("<div class=\"img-block\">");
                                    if (listLink[i].Contains(".doc"))
                                    {
                                        showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"/App_Themes/AdminNew45/assets/images/icon/file.png\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");

                                    }
                                    else if (listLink[i].Contains(".xls"))
                                    {
                                        showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"/App_Themes/AdminNew45/assets/images/icon/file.png\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");
                                    }
                                    else
                                    {
                                        showIMG.Append("<a href=\"" + listLink[i] + "\" target=\"_blank\"><img src=\"" + listLink[i] + "\" title=\"" + listComment[i] + "\"  class=\"\" height=\"50\"/></a>");
                                    }
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                    showIMG.Append("</div>");
                                }
                                dataout.UID = uid;
                                dataout.OrderID = id;
                                dataout.Comment = showIMG.ToString();
                                return serializer.Serialize(dataout);
                            }
                        }

                    }

                }

            }
            return serializer.Serialize(null);
        }
        public partial class CustomerComment
        {
            public int UID { get; set; }
            public int OrderID { get; set; }
            public string Comment { get; set; }
            public List<string> Link { get; set; }
            public List<string> CommentName { get; set; }
        }

        protected void btnPostComment_Click(object sender, EventArgs e)
        {
            string username = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username);
            DateTime currentDate = DateTime.Now;
            if (obj_user != null)
            {
                int uid = obj_user.ID;
                //var id = RouteData.Values["id"].ToString().ToInt(0);
                int id = hdfShopID.Value.ToInt(0);
                if (id > 0)
                {
                    var o = MainOrderController.GetAllByUIDAndID(uid, id);
                    if (o != null)
                    {
                        int salerID = Convert.ToInt32(o.SalerID);
                        int dathangID = Convert.ToInt32(o.DathangID);
                        int khotqID = Convert.ToInt32(o.KhoTQID);
                        int khovnID = Convert.ToInt32(o.KhoVNID);

                        if (salerID > 0)
                        {
                            var saler = AccountController.GetByID(salerID);
                            if (saler != null)
                            {
                                NotificationsController.Inser(salerID,
                                    saler.Username, id,
                                    "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                    currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(salerID, "Đơn hàng " + id + " có thông báo mới.", datalink);
                            }
                        }
                        if (dathangID > 0)
                        {
                            var dathang = AccountController.GetByID(dathangID);
                            if (dathang != null)
                            {
                                NotificationsController.Inser(dathangID,
                                    dathang.Username, id,
                                    "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                    currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(dathangID, "Đơn hàng " + id + " có thông báo mới.", datalink);
                            }
                        }
                        if (khotqID > 0)
                        {
                            var khotq = AccountController.GetByID(khotqID);
                            if (khotq != null)
                            {
                                NotificationsController.Inser(khotqID,
                                    khotq.Username, id,
                                    "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                    currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(khotqID, "Đơn hàng " + id + " có thông báo mới.", datalink);
                            }
                        }
                        if (khovnID > 0)
                        {
                            var khovn = AccountController.GetByID(khovnID);
                            if (khovn != null)
                            {
                                NotificationsController.Inser(khovnID,
                                    khovn.Username, id,
                                    "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                    currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(khovnID, "Đơn hàng " + id + " có thông báo mới.", datalink);
                            }
                        }

                        var admins = AccountController.GetAllByRoleID(0);
                        if (admins.Count > 0)
                        {
                            foreach (var admin in admins)
                            {
                                NotificationsController.Inser(admin.ID,
                                                                   admin.Username, id,
                                                                   "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                                                   currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(admin.ID, "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", datalink);
                            }
                        }

                        var managers = AccountController.GetAllByRoleID(2);
                        if (managers.Count > 0)
                        {
                            foreach (var manager in managers)
                            {
                                NotificationsController.Inser(manager.ID,
                                                                   manager.Username, id,
                                                                   "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                                                                   currentDate, obj_user.Username, false);
                                string strPathAndQuery = Request.Url.PathAndQuery;
                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                                PJUtils.PushNotiDesktop(manager.ID, "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", datalink);
                            }
                        }

                        //var cskhs = AccountController.GetAllByRoleID(9);
                        //if (cskhs.Count > 0)
                        //{
                        //    foreach (var cskh in cskhs)
                        //    {
                        //        NotificationsController.Inser(cskh.ID,
                        //                                           cskh.Username, id,
                        //                                           "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", id,
                        //                                           currentDate, obj_user.Username, false);
                        //        string strPathAndQuery = Request.Url.PathAndQuery;
                        //        string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                        //        string datalink = "" + strUrl + "manager/OrderDetail/" + id;
                        //        PJUtils.PushNotiDesktop(cskh.ID, "Đã có đánh giá mới cho đơn hàng #" + id + ". CLick vào để xem", datalink);
                        //    }
                        //}

                        string comment = hdfCommentText.Value;
                        string kq = OrderCommentController.Insert(id, comment, true, 1, currentDate, uid);
                        var hubContext = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
                        hubContext.Clients.All.addNewMessageToPage("", "");
                        PJUtils.ShowMessageBoxSwAlert("Gửi nội dung thành công", "s", true, Page);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = Session["userLoginSystem"].ToString();
            var u = AccountController.GetByUsername(username);
            DateTime currentDate = DateTime.Now;
            if (u != null)
            {
                int UID = u.ID;
                int ID = ViewState["OID"].ToString().ToInt(0);
                string orderCodeshop = Request.QueryString["ordershopcode"];
                var s = MainOrderController.GetAllByUIDAndID(UID, ID);
                if (s != null)
                {
                    //MainOrderController.UpdateNote(s.ID, txt_DNote.Text);
                    PJUtils.ShowMessageBoxSwAlert("Cập nhật ghi chú thành công", "s", true, Page);
                }
            }
        }

        protected void btnYCG_Click(object sender, EventArgs e)
        {
            string username_current = Session["userLoginSystem"].ToString();
            var obj_user = AccountController.GetByUsername(username_current);
            DateTime currentDate = DateTime.Now;
            if (obj_user != null)
            {
                if (obj_user.Wallet > 0)
                {
                    int OID = ViewState["OID"].ToString().ToInt();
                    if (OID > 0)
                    {
                        var o = MainOrderController.GetAllByID(OID);
                        if (o != null)
                        {
                            var check = YCGController.GetByMainOrderID(o.ID);
                            if (check == null)
                            {
                                YCGController.Insert(obj_user.ID, o.ID, txtFullName.Text, txtPhone.Text, txtAddress.Text, txtNote.Text, username_current, currentDate);
                                MainOrderController.UpdateYCG(o.ID, true);
                                var setNoti = SendNotiEmailController.GetByID(6);
                                if (setNoti != null)
                                {
                                    if (setNoti.IsSentNotiAdmin == true)
                                    {

                                        var admins = AccountController.GetAllByRoleID(0);
                                        if (admins.Count > 0)
                                        {
                                            foreach (var admin in admins)
                                            {
                                                NotificationsController.Inser(admin.ID, admin.Username, o.ID, "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.", 1, currentDate, obj_user.Username, false);
                                                //string strPathAndQuery = Request.Url.PathAndQuery;
                                                //string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                //string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                //PJUtils.PushNotiDesktop(admin.ID, "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.", datalink);
                                            }
                                        }

                                        var managers = AccountController.GetAllByRoleID(2);
                                        if (managers.Count > 0)
                                        {
                                            foreach (var manager in managers)
                                            {
                                                NotificationsController.Inser(manager.ID, manager.Username, o.ID, "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.",
                                                1, currentDate, obj_user.Username, false);
                                                string strPathAndQuery = Request.Url.PathAndQuery;
                                                string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                                string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                                PJUtils.PushNotiDesktop(manager.ID, "Đơn hàng " + o.ID + "đã yêu cầu giao hàng.", datalink);
                                            }
                                        }

                                        //var cskhs = AccountController.GetAllByRoleID(9);
                                        //if (cskhs.Count > 0)
                                        //{
                                        //    foreach (var cskh in cskhs)
                                        //    {
                                        //        NotificationsController.Inser(cskh.ID, cskh.Username, o.ID, "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.",
                                        //        1, currentDate, obj_user.Username, false);
                                        //        string strPathAndQuery = Request.Url.PathAndQuery;
                                        //        string strUrl = Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                                        //        string datalink = "" + strUrl + "manager/OrderDetail/" + o.ID;
                                        //        PJUtils.PushNotiDesktop(cskh.ID, "Đơn hàng " + o.ID + "đã yêu cầu giao hàng.", datalink);
                                        //    }
                                        //}
                                    }

                                    //if (setNoti.IsSentEmailAdmin == true)
                                    //{
                                    //    var admins = AccountController.GetAllByRoleID(0);
                                    //    if (admins.Count > 0)
                                    //    {
                                    //        foreach (var admin in admins)
                                    //        {
                                    //            try
                                    //            {
                                    //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", admin.Email,
                                    //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.", "");
                                    //            }
                                    //            catch { }
                                    //        }
                                    //    }

                                    //    var managers = AccountController.GetAllByRoleID(2);
                                    //    if (managers.Count > 0)
                                    //    {
                                    //        foreach (var manager in managers)
                                    //        {
                                    //            try
                                    //            {
                                    //                PJUtils.SendMailGmail("monamedia", "uvnajxzzurygsduf", manager.Email,
                                    //                    "Thông báo tại Mintic Logistics.", "Đơn hàng " + o.ID + " đã yêu cầu giao hàng.", "");
                                    //            }
                                    //            catch { }
                                    //        }
                                    //    }

                                    //}
                                }

                                PJUtils.ShowMessageBoxSwAlert("Tạo yêu cầu giao hàng thành công.", "s", true, Page);
                            }
                        }
                    }
                }
            }
        }
    }
}