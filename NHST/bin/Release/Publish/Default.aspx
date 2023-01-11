<%@ Page Language="C#" MasterPageFile="~/DatHang24hMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NHST.Default4" %>

<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <main class="main">
        <div class="home-banner-section sec" style="background-image: url(/App_Themes/DH24h/images/home-banner.jpg);">
            <div class="container wow zoomIn">
                <h1 class="home-banner-title">ĐẶT HÀNG TRUNG QUỐC</h1>
                <p class="home-banner-sub-title">Dịch vụ <span class="hl-color">Đặt hàng Trung Quốc</span> - vận chuyển hàng từ <span class="hl-color">Trung Quốc về Việt Nam</span></p>
                <div class="install-tools">
                    <p class="title">Cài đặt công cụ đặt hàng</p>
                    <div class="btn-wrapper">
                        <a href="https://chrome.google.com/webstore/detail/lbhhdmdpchdhfmgnnabfppebilfnefdo" target="_blank" class="main-btn">
                            <img src="/App_Themes/DH24h/images/chrome.png" alt="">Google Chrome</a>
                        <a href="https://chrome.google.com/webstore/detail/lbhhdmdpchdhfmgnnabfppebilfnefdo" target="_blank" class="main-btn">
                            <img src="/App_Themes/DH24h/images/coccoc.png" alt="">Cốc Cốc</a>
                    </div>
                </div>
                <div class="install-tools">
                    <p class="title">Tải ứng dụng đặt hàng trên smartphone</p>
                    <div class="btn-wrapper">
                        <a href="#" class="btn">
                            <img src="/App_Themes/DH24h/images/google-play.png" alt=""></a>
                        <a href="#" class="btn">
                            <img src="/App_Themes/DH24h/images/apple-store.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <section class="search-section sec" style="background-image: url(/App_Themes/DH24h/images/search-section.jpg);">
            <div class="container wow fadeInLeft">
                <div class="search-tab-wrapper tab-wrapper">
                    <div class="main-title-box">
                        <h2 class="main-title"><span class="tab-link current" data-tab="#search">Tìm kiếm hàng</span> - <span class="tab-link" data-tab="#tracking">Tracking</span></h2>
                        <div class="main-title-decor"></div>
                    </div>
                    <div class="tab-content-wrapper">
                        <div class="tab-content" id="search">
                            <div class="search-form">
                                <select class="f-control select-f-control" id="brand-source">
                                    <option value="1688">1688</option>
                                    <option value="taobao">TAOBAO</option>
                                    <option value="tmall">TMALL</option>
                                </select>
                                <asp:TextBox runat="server" ID="txtSearch" CssClass="f-control input-f-control txtsearchfield" placeholder="Tìm kiếm sản phẩm"></asp:TextBox>
                                <a href="javascript:;" onclick="searchProduct()" class="main-btn"><i class="fa fa-search" aria-hidden="true"></i></a>
                                <asp:Button ID="btnSearch" runat="server"
                                    OnClick="btnSearch_Click" Style="display: none"
                                    OnClientClick="document.forms[0].target = '_blank';" UseSubmitBehavior="false" />
                            </div>
                        </div>                       
                        <div class="tab-content" id="tracking">
                            <div class="search-form">
                                <input type="text" id="txtMVD" class="f-control input-f-control" placeholder="Tracking sản phẩm">
                                 <a href="javascript:;" onclick="searchCode()" class="main-btn">TRACKING</a>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="services-section sec">
            <div class="container wow fadeInRight">
                <div class="main-title-box">
                    <h2 class="main-title">DỊCH VỤ CỦA CHÚNG TÔI</h2>
                    <div class="main-title-decor"></div>
                    <p class="sub-title">
                        Hỗ trợ giao dịch mua hàng trên Taobao.com,1688.com, alibaba.com, tmall.com,… và tất cả<br>
                        các website thương mại điện tử Trung Quốc – Chỉ với 6 bước đơn giản
                    </p>
                </div>
                <div class="services-wrapper">
                    <div class="columns">
                        <asp:Literal runat="server" ID="ltrService"></asp:Literal>
                    </div>
                </div>
            </div>
        </section>
        <section class="products-section sec pt-0">
            <div class="container wow fadeInLeft">
                <div class="main-title-box">
                    <h2 class="main-title">CÁC SẢN PHẨM HOT</h2>
                    <div class="main-title-decor"></div>
                </div>
                <div class="products-slider-container">
                    <div class="products-slider-wrapper">
                        <h3 class="md-title">Taobao.com</h3>
                        <div class="products-slider main-slider">
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="products-slider-wrapper">
                        <h3 class="md-title">1688.com</h3>
                        <div class="products-slider main-slider">
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="products-slider-wrapper">
                        <h3 class="md-title">Tmall.com</h3>
                        <div class="products-slider main-slider">
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-5.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-6.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-1.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-item">
                                <div class="products-item">
                                    <div class="products-img">
                                        <a href="#" class="ratio-box">
                                            <img src="/App_Themes/DH24h/images/products-4.png" alt="">
                                        </a>
                                    </div>
                                    <div class="products-info">
                                        <p class="products-price">$20</p>
                                        <p class="products-title"><a href="#">Lorem ipsum dolor sit amet elit consectetur adipiscing elit.</a></p>
                                        <div class="rating-stars">
                                            <span class="empty-stars">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                            <span class="filled-stars" style="width: 80%;">
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                                <i class="star fa fa-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="achievement-section sec" style="background-image: url(/App_Themes/DH24h/images/register-section.jpg);">
            <div class="container wow lightSpeedIn">
                <div class="columns">
                    <div class="column">
                        <div class="achievement-item">
                            <div class="achievement-icon">
                                <img src="/App_Themes/DH24h/images/achievement-1.png" alt="">
                            </div>
                            <div class="achievement-info">
                                <p class="achievement-number">500</p>
                                <p class="achievement-title">Đơn hàng đang đặt</p>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="achievement-item">
                            <div class="achievement-icon">
                                <img src="/App_Themes/DH24h/images/achievement-2.png" alt="">
                            </div>
                            <div class="achievement-info">
                                <p class="achievement-number">956</p>
                                <p class="achievement-title">Đơn đang vận chuyển</p>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="achievement-item">
                            <div class="achievement-icon">
                                <img src="/App_Themes/DH24h/images/achievement-3.png" alt="">
                            </div>
                            <div class="achievement-info">
                                <p class="achievement-number">203</p>
                                <p class="achievement-title">Đơn hàng chuẩn bị giao</p>
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="achievement-item">
                            <div class="achievement-icon">
                                <img src="/App_Themes/DH24h/images/achievement-4.png" alt="">
                            </div>
                            <div class="achievement-info">
                                <p class="achievement-number">63500</p>
                                <p class="achievement-title">Đơn hàng đã hoàn thành</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="why-choose-us sec">
            <div class="container wow fadeInLeft">
                <div class="main-title-box">
                    <h2 class="main-title">CÁC LÝ DO KHÔNG THỂ CHỐI TỪ</h2>
                    <div class="main-title-decor"></div>
                    <p class="sub-title">Khiến hơn 8.000 khách hàng thân thiết gắn bó với Chúng tôi, Với Trung bình 2,298 sản phẩm được giao dịch mỗi ngày tại Dathang24h.com</p>
                </div>
                <div class="reasons-wrapper">
                    <div class="columns">
                        <asp:Literal runat="server" ID="ltrBenefits"></asp:Literal>
                    </div>
                </div>
            </div>
        </section>
        <section class="partners-section sec">
            <div class="container wow fadeInRight">
                <div class="main-title-box">
                    <h2 class="main-title">ĐỐI TÁC CỦA CHÚNG TÔI</h2>
                    <div class="main-title-decor"></div>
                </div>
                <div class="partners-slider main-slider main-slider-stretch">
                    <div class="slide-item">
                        <div class="partners-item">
                            <a href="https://world.taobao.com/" target="_blank">
                                <img src="/App_Themes/DH24h/images/partners-1.png" alt=""></a>
                        </div>
                    </div>
                    <div class="slide-item">
                        <div class="partners-item">
                            <a href="https://www.alipay.com/">
                                <img src="/App_Themes/DH24h/images/partners-2.png" alt=""></a>
                        </div>
                    </div>
                    <div class="slide-item">
                        <div class="partners-item">
                            <a href="https://www.1688.com/" target="_blank">
                                <img src="/App_Themes/DH24h/images/partners-3.png" alt=""></a>
                        </div>
                    </div>
                    <div class="slide-item">
                        <div class="partners-item">
                            <a href="https://www.tmall.com/" target="_blank">
                                <img src="/App_Themes/DH24h/images/partners-4.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="register-section sec" style="background-image: url(/App_Themes/DH24h/images/register-section.jpg);">
            <div class="container wow zoomIn">
                <div class="main-title-box">
                    <h2 class="main-title">DATHANG24H - TỐC ĐỘ, NIỀM TIN VÀ TẤT CẢ</h2>
                    <div class="main-title-decor"></div>
                    <p class="sub-title">
                        Hàng ngày, chúng tôi tâm niệm luôn nỗ lực hết mình vượt qua nhiều rủi ro, khó khăn để đáp<br>
                        ứng khách hàng của chúng tôi một cách tốt nhất.
                    </p>
                </div>
                <a href="dang-ky" class="main-btn">ĐĂNG KÝ NGAY</a>
            </div>
        </section>
    </main>
    <asp:HiddenField ID="hdfWebsearch" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.txtsearchfield').on("keypress", function (e) {
                if (e.keyCode == 13) {
                    searchProduct();
                }
            });
        });

        function searchProduct() {
            var web = $("#brand-source").val();
            $("#<%=hdfWebsearch.ClientID%>").val(web);
            $("#<%=btnSearch.ClientID%>").click();
        }

        function keyclose_ms(e) {
            if (e.keyCode == 27) {
                close_popup_ms();
            }
        }

        function close_popup_ms() {
            $("#pupip_home").animate({ "opacity": 0 }, 400);
            $("#bg_popup_home").animate({ "opacity": 0 }, 400);
            setTimeout(function () {
                $("#pupip_home").remove();
                $(".zoomContainer").remove();
                $("#bg_popup_home").remove();
                $('body').css('overflow', 'auto').attr('onkeydown', '');
            }, 500);
        }

        function closeandnotshow() {
            $.ajax({
                type: "POST",
                url: "/Default.aspx/setNotshow",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    close_popup_ms();
                },
                error: function (xmlhttprequest, textstatus, errorthrow) {
                    alert('lỗi');
                }
            });

        }
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "/Default.aspx/getPopup",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != "null") {
                        var data = JSON.parse(msg.d);
                        var title = data.NotiTitle;
                        var content = data.NotiContent;
                        var email = data.NotiEmail;
                        var obj = $('form');
                        $(obj).css('overflow', 'hidden');
                        $(obj).attr('onkeydown', 'keyclose_ms(event)');
                        var bg = "<div id='bg_popup_home'></div>";
                        var fr = "<div id='pupip_home' class=\"columns-container1\">" +
                            "  <div class=\"center_column col-xs-12 col-sm-5\" id=\"popup_content_home\">";
                        fr += "<div class=\"popup_header\">";
                        fr += title;
                        fr += "<a style='cursor:pointer;right:5px;' onclick='close_popup_ms()' class='close_message'></a>";
                        fr += "</div>";
                        fr += "     <div class=\"changeavatar\">";
                        fr += "         <div class=\"content1\">";
                        fr += content;
                        fr += "         </div>";
                        fr += "         <div class=\"content2\">";
                        fr += "<a href=\"javascript:;\" class=\"btn btn-close-full\" onclick='closeandnotshow()'>Đóng & không hiện thông báo</a>";
                        fr += "<a href=\"javascript:;\" class=\"btn btn-close\" onclick='close_popup_ms()'>Đóng</a>";
                        fr += "         </div>";
                        fr += "     </div>";
                        fr += "<div class=\"popup_footer\">";
                        fr += "<span class=\"float-right\">" + email + "</span>";
                        fr += "</div>";
                        fr += "   </div>";
                        fr += "</div>";
                        $(bg).appendTo($(obj)).show().animate({ "opacity": 0.7 }, 800);
                        $(fr).appendTo($(obj));
                        setTimeout(function () {
                            $('#pupip').show().animate({ "opacity": 1, "top": 20 + "%" }, 200);
                            $("#bg_popup").attr("onclick", "close_popup_ms()");
                        }, 1000);
                    }
                },
                error: function (xmlhttprequest, textstatus, errorthrow) {
                    alert('lỗi');
                }
            });
        });

        function searchCode() {
            var code = $("#txtMVD").val();
            if (isEmpty(code)) {
                alert('Vui lòng nhập mã vận đơn.');
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/Default.aspx/GetInfor",
                    data: "{ordecode:'" + code + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != "null") {
                            //var data = JSON.parse(msg.d);
                            var title = "Thông tin mã vận đơn";
                            var content = msg.d;
                            var email = "";
                            var obj = $('form');
                            $(obj).css('overflow', 'hidden');
                            $(obj).attr('onkeydown', 'keyclose_ms(event)');
                            var bg = "<div id='bg_popup_home'></div>";
                            var fr = "<div id='pupip_home' class=\"columns-container1\">" +
                                "  <div class=\"center_column col-xs-12 col-sm-5\" id=\"popup_content_home\">";
                            fr += "<div class=\"popup_header\">";
                            fr += title;
                            fr += "<a style='cursor:pointer;right:5px;' onclick='close_popup_ms()' class='close_message'></a>";
                            fr += "</div>";
                            fr += "     <div class=\"changeavatar\">";
                            fr += "         <div class=\"content1\" style=\"width:75%;margin-left:11%\">";
                            fr += content;
                            fr += "         </div>";
                            fr += "         <div class=\"content2\">";
                            fr += "             <a href=\"javascript:;\" class=\"btn btn-close\" onclick='close_popup_ms()'>Đóng</a>";
                            fr += "         </div>";
                            fr += "     </div>";
                            fr += "<div class=\"popup_footer\">";
                            fr += "<span class=\"float-right\">" + email + "</span>";
                            fr += "</div>";
                            fr += "   </div>";
                            fr += "</div>";
                            $(bg).appendTo($(obj)).show().animate({ "opacity": 0.7 }, 800);
                            $(fr).appendTo($(obj));
                            setTimeout(function () {
                                $('#pupip').show().animate({ "opacity": 1, "top": 20 + "%" }, 200);
                                $("#bg_popup").attr("onclick", "close_popup_ms()");
                            }, 1000);
                        }
                    },
                    error: function (xmlhttprequest, textstatus, errorthrow) {
                        alert('lỗi');
                    }
                });
            }

        }
    </script>
    <style>
        #bg_popup_home {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: #333;
            opacity: 0.7;
            filter: alpha(opacity=70);
            left: 0px;
            top: 0px;
            z-index: 999999999;
            opacity: 0;
            filter: alpha(opacity=0);
        }

        #popup_ms_home {
            background: #fff;
            border-radius: 0px;
            box-shadow: 0px 2px 10px #fff;
            float: left;
            position: fixed;
            width: 735px;
            z-index: 10000;
            left: 50%;
            margin-left: -370px;
            top: 200px;
            opacity: 0;
            filter: alpha(opacity=0);
            height: 360px;
        }

            #popup_ms_home .popup_body {
                border-radius: 0px;
                float: left;
                position: relative;
                width: 735px;
            }

            #popup_ms_home .content {
                /*background-color: #487175;     border-radius: 10px;*/
                margin: 12px;
                padding: 15px;
                float: left;
            }

            #popup_ms_home .title_popup {
                /*background: url("../images/img_giaoduc1.png") no-repeat scroll -200px 0 rgba(0, 0, 0, 0);*/
                color: #ffffff;
                font-family: Arial;
                font-size: 24px;
                font-weight: bold;
                height: 35px;
                margin-left: 0;
                margin-top: -5px;
                padding-left: 40px;
                padding-top: 0;
                text-align: center;
            }

            #popup_ms_home .text_popup {
                color: #fff;
                font-size: 14px;
                margin-top: 20px;
                margin-bottom: 20px;
                line-height: 20px;
            }

                #popup_ms_home .text_popup a.quen_mk, #popup_ms_home .text_popup a.dangky {
                    color: #FFFFFF;
                    display: block;
                    float: left;
                    font-style: italic;
                    list-style: -moz-hangul outside none;
                    margin-bottom: 5px;
                    margin-left: 110px;
                    -webkit-transition-duration: 0.3s;
                    -moz-transition-duration: 0.3s;
                    transition-duration: 0.3s;
                }

                    #popup_ms_home .text_popup a.quen_mk:hover, #popup_ms_home .text_popup a.dangky:hover {
                        color: #8cd8fd;
                    }

            #popup_ms_home .close_popup {
                background: url("/App_Themes/Camthach/images/close_button.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                display: block;
                height: 28px;
                position: absolute;
                right: 0px;
                top: 5px;
                width: 26px;
                cursor: pointer;
                z-index: 10;
            }

        #popup_content_home {
            height: auto;
            position: fixed;
            background-color: #fff;
            top: 15%;
            z-index: 999999999;
            left: 25%;
            border-radius: 10px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            width: 50%;
            padding: 20px;
        }

        #popup_content_home {
            padding: 0;
        }

        .popup_header, .popup_footer {
            float: left;
            width: 100%;
            background: #03a9f4;
            padding: 10px;
            position: relative;
            color: #fff;
        }

        .popup_header {
            font-weight: bold;
            font-size: 16px;
            text-transform: uppercase;
        }

        .close_message {
            top: 10px;
        }

        .changeavatar {
            padding: 10px;
            margin: 5px 0;
            float: left;
            width: 100%;
        }

        .float-right {
            float: right;
        }

        .content1 {
            float: left;
            width: 100%;
        }

        .content2 {
            float: left;
            width: 100%;
            border-top: 1px solid #eee;
            clear: both;
            margin-top: 10px;
        }

        .btn.btn-close {
            float: right;
            background: #03a9f4;
            color: #fff;
            margin: 10px 5px;
            text-transform: none;
            padding: 10px 20px;
        }

            .btn.btn-close:hover {
                background: #95d3ef;
            }

        .btn.btn-close-full {
            float: right;
            background: #fed03d;
            color: #fff;
            margin: 10px 5px;
            text-transform: none;
            padding: 10px 20px;
        }

            .btn.btn-close-full:hover {
                background: #f8d486;
            }


        @media screen and (max-width: 768px) {
            #popup_content_home {
                left: 10%;
                width: 80%;
            }

            .content1 {
                overflow: auto;
                height: 300px;
            }
        }
    </style>
</asp:Content>
