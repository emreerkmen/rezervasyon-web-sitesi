function yeniKayit() {
    window.open("yeniKayit.aspx",
    "_blank", "toolbar=yes,scrollbars=yes,resizable=no,top=200,left=300,width=725,height=400");
}

function uyari() {
    var bilgi = document.getElementsByClassName('bilgi'); 
    bilgi.style.padding = "0";
    var uyari = document.getElementsByClassName('uyari');
    uyari.style.display = "block";
}

function basariliKayit() {
    alert("Kayit islemi basarili. Anasayfaya yonlendiriliyorsunuz...");
}

function basarisizGiris() {
    alert("Hatali kullanici adi ya da sifre. Tekrar deneyiniz.");
}

$(document).on("click", ".restaurantName", function (event) {
    var id;
    id = event.target.id;
    var index = id.indexOf(".");
    id = id.substring(25,index);

    $.ajax({
        type: "POST",
        url: "restoranlar.aspx/gotoRest",
        data: "{ ID: '" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: "true",
        cache: "false",
        success: function (msg) {
            window.location = msg.d;
        },
        Error: function (x, e) {
            // On Error
        }
    });
});

$(document).ready(function () {
    $(".siparisVer").click(function () {
        $(".menuWithHeader").fadeToggle();
    });

    $(".tekMasa").click(function () {
        $(".tekMasa").removeClass("active");
        $(this).toggleClass("active");
    });

    $("#btn_rezervasyonYap").click(function () {
        if ($("div.masalar").find("div.active").length == 0)
            alert("Rezervasyon yapýlacak masayý seçin.");
    });

    $(".numericUpDown").click(function () {
        var val;
        var id = event.target.id;
        val = document.getElementById(id).value;
    });
});

$(document).on("click", ".tekMasa", function (event) {
    var masaNo;
    var kapasite;
    masaNo = $(this).children(".masaNo").html();
    masaNo = masaNo.substr(5, 6);
    kapasite = $(this).children(".kapasite").html();
    kapasite = kapasite.substr(0, 1);

    $.ajax({
        type: "POST",
        url: "restoranlar.aspx/masaSec",
        data: "{ masaNo: '" + masaNo + "', kapasite: '" + kapasite + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: "true",
        cache: "false",
        success: function (msg) {

        },
        Error: function (x, e) {
            // On Error
        }
    });
});


