<?php
/* @var $this yii\web\View */
/* @var $model app\models\Books */
/* @var $autors app\models\Autors */
/* @var $image app\models\UploadForm */
?>
<div class="book-create col-md-6">

    <?= $this->render('_form', [
        'model'  => $model,
        'image'  => $image,
        'autors' => $autors,
    ]); ?>

</div><!-- book-create -->
