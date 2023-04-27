<nav class="navbar navbar-expand-lg bg-light shadow-sm p-3 bg-body rounded" id="navbar-top">
  
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="<?php echo $rootPath ?>">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?php echo $rootPath;?>/product.php">Sản phẩm</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?php echo $rootPath;?>/contact.php">Liên hệ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?php echo $rootPath;?>/posts.php">Tin tức</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?php echo $rootPath;?>/policy.php">Chính sách</a>
          </li>
        </ul>
        <form action="<?php echo $rootPath?>/search.php" method="get" class="d-flex me-3" role="search">
          <div class="input-group flex-nowrap search-top">
            <input class="form-control" type="search" name="key" placeholder="Search..." id="live-search" aria-label="Search" value="<?php if (!empty($_GET['key'])) echo $_GET['key']; ?>">
            <button class="btn btn-info round-circle" type="submit"><i class="fa-regular fa-magnifying-glass text-white"></i></button>
            <div id="live-search__result"></div>  
          </div>
        </form>
        <ul class="nav navbar-nav pull-right">
          <li class="nav-item me-2">
            <a href="<?php echo $rootPath?>/cart.php" class="btn btn-light" id="headerCart"></a>
          </li>
          <a class="navbar-brand" href="<?php echo $rootPath; ?>">
          <img src="https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/299839396_753939239190341_8102183110760877527_n.jpg?stp=cp6_dst-jpg&_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=6bfrUgNLinEAX8L1Lnx&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfB8Bw8JMhacB8n-zaNyiafx90UwHwfNsvmm8iV-M79kNQ&oe=644F8A68" alt="Logo" width="70" height="30" class="d-inline-block align-text-top">
      </a>
          <?php
          
            if (!isset($_SESSION['email_user'])) {
          ?>
          
            <li class="nav-item">
                <a class="nav-link" href="<?php echo $rootPath?>/sign_up.php">Đăng ký</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo $rootPath?>/customer/login.php">Đăng nhập</a>
            </li>
          <?php
            } else {
          ?>
            <li class="nav-item">
              <div class="dropdown">
                <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <?php 
                  $email = $_SESSION['email_user'];
                  $sqlUser = "SELECT name FROM user WHERE email = '$email'";
                  $ketQua = $conn->query($sqlUser);
                  $user = $ketQua->fetch_array();
                  echo $user['name'];
                ?>
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="<?php echo $rootPath?>/customer/my_account.php">Tài khoản</a></li>
                  <li><a class="dropdown-item" href="<?php echo $rootPath?>/customer/my_order.php">Đơn hàng</a></li>
                  <li><a class="dropdown-item" href="<?php echo $rootPath?>/customer/check_out.php">Thanh toán</a></li>
                  <li><a class="dropdown-item" href="<?php echo $rootPath?>/customer/reset_password.php">Đổi mật khẩu</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo $rootPath?>/customer/logout.php">Đăng xuất</a>
            </li>
            <?php 
            }
            ?>
        </ul>
      </div>

</nav>