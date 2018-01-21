<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $model app\models\Books */
/* @var $form ActiveForm */
?>
<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

<?= $form->field($model, 'name') ?>

<?php if ($model['image']): ?>
    <?= Html::img('/' . $model['image']->path, ['class' => 'img-thumbnail', 'width' => 250]) ?>
<?php endif; ?>

<?= $form->field($image, 'imageFile')
    ->fileInput(['multiple' => false, 'accept' => 'image/*']) ?>

<?= $form->field($model, 'desc')->textarea() ?>
<?= $form->field($model, 'dt') ?>
<?= $form->field($model, 'isbn') ?>

<?= $form->field($model, 'autorIds')->widget(Select2::classname(), [
    'data' => ArrayHelper::map($autors, 'id', 'fio'),
    'language' => 'ru',
    'options' => ['placeholder' => 'Select a state ...', 'multiple' => true],
    'pluginOptions' => [
        'allowClear' => true
    ],
]); ?>

<div class="form-group">
    <?= Html::submitButton('Cохранить', ['class' => 'btn btn-primary']) ?>
</div>
<?php ActiveForm::end(); ?>
