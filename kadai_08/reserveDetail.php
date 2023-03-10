<?php
  session_start();
  $dnameErr = "";
  if (isset($_SESSION['errMsg']['dname'])) {
    $dnameErr = "<span style='color: red;'>" . $_SESSION['errMsg']['dname'] ."</span>";
  }
  unset($_SESSION['errMsg']); // すべてのエラーメッセージをクリア
  require_once('./dbConfig.php');
  $link = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
  if ($link == null) {
    die("接続に失敗しました：" . mysqli_connect_error());
  }
  mysqli_set_charset($link, "utf8");
  $roomNo = $_GET['rno'];
  $sql = "SELECT room_name  FROM room  WHERE  room_no = {$roomNo}";
  $result = mysqli_query($link, $sql);
  $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
  $roomName = $row['room_name'];
  $_SESSION['reserve']['roomno'] = $roomNo;
  $reserveDay = $_SESSION['reserve']['day'];

  $dname = "";
  if (isset($_SESSION['reserve']['dname']) == true) {
      $dname = $_SESSION['reserve']['dname'];
  }
?>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./css/style.css" type="text/css">
  <title>森不動産</title>
</head>
<body>
  <!-- ヘッダー：開始-->
  <header id="header">
    <div id="pr">
      <p>ニセコでホテルを販売している妄想です</p>
    </div>
    
  <nav id="menu">
    <ul>
      <li><a href="./index.php">ホーム</a></li>
      <li><a href="./roomList.php">不動産の紹介</a></li>
      <li><a href="./reserveDay.php">内覧予約</a></li>
    </ul>
  </nav>
  
 <section>
    <h2>ご予約（詳細情報の入力）</h2>
    <p>詳細情報を入力後、予約確認ボタンを押してください。<br />
    （※がついている項目は入力必須項目です）</p>
    <h3>予約情報</h3>
    <table class="input">
      <tr><th>物件の名称</th><td><?php echo $roomName; ?></td></tr>
      <tr><th>予約日</th><td><?php echo $reserveDay; ?></td></tr>
    </table><br />
    <h3>代表者情報</h3>
    <form method="post" action="reserveCheck.php" >
      <table class="input">
        <tr>
          <th>代表者氏名（※）</th>
          <td><input type="text" name="dname" value="<?php echo $dname; ?>" /><?php echo $dnameErr; ?></td></tr>
        <tr>
          <th>連絡先電話番号（※）</th>
          <td><input type="text" name="dtelno" value="" /></td></tr>
        <tr>
          <th>メールアドレス</th>
          <td><input type="text" name="dmail" value="" /></td></tr>
      </table><br />
   
      <table class="input">
        <tr>
          <th>家族人数（※）</th>
        <td><input type="text" name="reserveNumber" value="" /></td>
        </tr>
        <tr>
          <th>希望時間（※）</th>
          <td><select name="checkin">
            <option value="">時間を選択</option>
            <option value="9:00">9:00</option>
            <option value="10:00">10:00</option>
            <option value="11:00">11:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>

          </select></td>
        </tr>
        <tr>
          <th>連絡事項</th><td><textarea name="message" cols="40" rows="4"></textarea></td>
        </tr>
      </table><br />
    <p>まだ予約は確定しておりません。次の画面で確定させてください。</p>
    <input class="submit_a" type="submit" value="予約確認" />
    <input class="submit_a" type="button" value="前の画面に戻る" onclick="history.back();" />
    </form>
  </section>
      </article>
    </main>
    
<?php
  mysqli_free_result( $result );
  mysqli_close( $link );
?>
</body>
</html>
