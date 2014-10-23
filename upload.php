<?php

// http://am-yu.net/2014/02/04/canvas-pbbs2/
// http://php.net/manual/ja/function.imagejpeg.php

// phpinfo();
//touch("/tmp/test.txt");

ini_set("display_errors", 1);
error_reporting(E_ALL);

//canvasデータがPOSTで送信されてきた場合
$canvas = $_POST["image"];

//ヘッダに「data:image/png;base64,」が付いているので、それは外す
$canvas = preg_replace("/data:[^,]+,/i","",$canvas);

//残りのデータはbase64エンコードされているので、デコードする
$canvas = base64_decode($canvas);

//まだ文字列の状態なので、画像リソース化
$image = imagecreatefromstring($canvas);

//画像として保存（ディレクトリは任意）
// imagesavealpha($image, TRUE); // 透明色の有効
imagejpeg($image ,'hisasann.jpeg');

// メモリを開放します
imagedestroy($image);

?>

