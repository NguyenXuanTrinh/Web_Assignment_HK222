<?php
    session_start();
    ob_start();
    $rootPath = '/AssignmentWeb';

    // nếu khách hàng chưa đăng nhập thì chuyển đến trang đăng nhập
    if (!isset($_SESSION['email_user']) && empty($_SESSION['email_user']) ) header('location: login.php');
    require_once '../db/DB.php';
    $email = mysqli_real_escape_string($conn,$_SESSION['email_user']);
    if ($conn->connect_error) {
        die("có lỗi xảy ra".$conn->connect_error);
    } 
    $sqlUser = "SELECT user_id FROM user WHERE email = '$email'";
    $ketQua = $conn->query($sqlUser);
    $user = $ketQua->fetch_array();
    $id = $user['user_id'];
    //Nếu không có sản phẩm trong giỏ hàng thì trở về trang giỏ hàng
    if (isset($_POST['order'])) {
        $nameReceiver = $_POST['nameReceiver'];
        $phoneReceiver = $_POST['phoneReceiver'];
        $addressReceiver = $_POST['addressReceiver'];
        $payment = $_POST['payment'];
        $paymentMethod = $_POST['paymentMethod'];
        if ($nameReceiver == '' || $phoneReceiver =='' || $addressReceiver =='' || $payment == '' || $paymentMethod =='') {
            $tb = 'Bạn chưa nhập đầy đủ thông tin, vui lòng kiểm tra lại!!!';
        } else {
            $sqlOrder = "INSERT INTO `assignmentweb`.`order` (`payment`, `address_receiver`, `phone_receiver`, `name_receiver`, `user_id`) 
            VALUES ('$payment', '$addressReceiver', '$phoneReceiver', '$nameReceiver', '$id');";  
            if ($conn->query($sqlOrder)) {
                // lấy order id
                $orderId = mysqli_insert_id($conn);
                foreach($_SESSION['cart'] as $key => $value) {
                    $productId = $value['id'];
                    $quantityItem = $value['quantity'];
                    $price = $value['price'];
                    $sqlOrderItem = "INSERT INTO order_item (order_id, product_id, quantity_item, price) 
                                                VALUES ('$orderId', '$productId', '$quantityItem', '$price')";
                    $conn->query($sqlOrderItem);
                }
            }

            $success = 1; 
            unset($_SESSION['cart']); 
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"  href="https://site-assets.fontawesome.com/releases/v6.1.2/css/all.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="./public/css/base.css">
    <link rel="stylesheet" href="./public/css/home.css">
</head>
<body>
<?php
    require '../includes/header.php';
    require '../includes/navbar.php';
?>

<?php 
// Nếu chưa có sản phẩm trong giỏ hàng thì hiển thị btn quay về trang sản phẩm
if (empty($_SESSION['cart']) && isset($success)) {
?>
    <div class="container pt-5 pb-5">
        <div class="row mb-2">
            <div class="alert alert-success text-center">
                <div class="h4"> <i class="fa-sharp fa-solid fa-circle-check"></i> Thanh toán thành công</div>
                <p>Chi tiết đơn hàng đã được gửi qua mail cho quý khách</p>
            </div>
        </div>
        <div class="row">
            <div class="mx-auto w-25">
                <a href="<?php echo $rootPath?>/product.php" class="btn btn-primary">Tiếp tục mua hàng</a>
            </div>
        </div>
    </div>
<?php
} else {

if (empty($_SESSION['cart'])) {
?>
    <div class="container pt-5 pb-5">
        <div class="row mb-2">
            <div class="alert alert-warning">
                <span class="h4"> <i class="fa-light fa-face-smile"></i> Bạn chưa có đơn hàng nào!!!</span>
            </div>
        </div>
        <div class="row">
            <div class="mx-auto w-25">
                <a href="<?php echo $rootPath?>/product.php" class="btn btn-primary">Trở về trang sản phẩm</a>
            </div>
        </div>
    </div>
<?php
    // Nếu có giỏ hàng thì hiện form để người dùng điền thông tin
} else {
?>

<div class="container pt-5 pb-5">
    <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="row">
        <div class="col-xl-8 col-md-6 col-sm-12 shadow-sm p-3 mb-5 bg-body rounded">
            <div class="h5">Địa chỉ giao hàng</div>
            <label class="mb-1 ms-1" for="">Họ và tên</label>
            <input type="text" class="form-control mb-2" name="nameReceiver" placeholder="Họ tên người nhận">
            <label class="mb-1 ms-1" for="">Số điện thoại</label>
            <input type="text" class="form-control mb-2" name="phoneReceiver" placeholder="Nhập số điện thoại">
            <label class="mb-1 ms-1" for="">Địa chỉ (Tỉnh/Thành phố)</label>
            <input type="text" class="form-control mb-2" name="addressReceiver" placeholder="Nhập số nhà/tên đường/quận/thành phố">
        <?php
            if(isset($tb) && $tb!='') {
                echo '<div class="alert alert-danger">'.$tb.'</div>';
            }
        ?>
        </div>
        <div class="col-xl-4 col-md-6 col-sm-12">
            <div class="container">
                <div class="row shadow-sm p-3 mb-3 bg-body rounded">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h6>Đơn hàng gồm <?=sizeof($_SESSION['cart'])?> sản phẩm</h6>
                        </li>
                        <?php 
                            $totalBill = 0;
                            foreach($_SESSION['cart'] as $key => $value) {
                        ?>
                        <li class="list-group-item">
                            <p class="d-flex justify-content-between">
                                <span><?=$value['quantity']?>x <?=$value['name']?></span>
                                <span><?=number_format($value['price']*$value['quantity'])?> <sup>đ</sup> </span>
                            </p>
                        </li>
                        <?php
                            $totalBill += $value['price']*$value['quantity'];
                            }
                        ?>
                        <li class="list-group-item">
                            <p class="d-flex justify-content-between">
                                <span>Tổng tiền (đã gồm VAT)</span>
                                <span class="text-danger"><strong><?=number_format($totalBill)?> <sup>đ</sup></strong> </span>
                            </p>
                        </li>
                    </ul>
                </div>
                <div class="row shadow-sm p-3 mb-5 bg-body rounded">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <p>
                                <h6>Chọn hình thức thanh toán</h6>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" value="tienMat" id="tienMat" checked>
                                    <label class="form-check-label" for="tienMat">
                                        Thanh toán khi nhận hàng
                                    </label>
                                </div>
                                <!-- <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" value="ATM" id="ATM">
                                    <label class="form-check-label" for="ATM">
                                        Thanh toán qua ATM
                                    </label>
                                </div> -->
                            </p>
                            <p>
                                <input type="hidden" name="payment" value="<?=$totalBill?>">
                                <button type="submit" name="order" class="btn btn-primary w-100"><i class="fa-regular fa-money-bill-wave"></i> <strong>Thanh toán</strong></button>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</div>
<?php 
}
// end else 
}
?>

<?php
    require '../includes/footer.php';
?>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>