<?php
use \yii\helpers\Html;
use \yii\helpers\ArrayHelper;

/* @var $this yii\web\View */

$this->title = 'Список книг - TOP 10';
?>
<div class="site-index">

    <div class="jumbotron">
        <h3><?= $this->title ?></h3>
    </div>

    <div class="body-content">

        <?php foreach ($books as $key => $model): ?>
            <?php if (!(($key + 1) % 3)): ?>
                <div class="row">
            <?php endif; ?>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <?= Html::img('/' . $model['image']->path) ?>
                    <div class="caption">
                        <h3><?= $model->name ?></h3>
                        <p>
                            <?= $model->desc ?><br>
                            <span>Год выпуска: </span><b><?= $model->dt ?></b><br>
                            <span>ISBN: <?= $model->isbn ?></span><br>
                            <?php if ($model['booksHasAutors']): ?>
                                <span>Авторы: <?= implode(', ', ArrayHelper::map($model->getAutors(), 'id', 'fio')) ?></span>
                            <?php endif; ?>
                        </p>
                        <?php if (!\Yii::$app->user->isGuest): ?>
                            <p>
                                <?= Html::a('Редактировать', ['book/update', 'id' => $model->id], ['class' => 'btn btn-default']) ?>
                                <?= Html::a('Удалить', ['book/delete', 'id' => $model->id], ['class' => 'btn btn-danger']) ?>
                            </p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <?php if (!(($key + 1) % 3)): ?>
                </div>
            <?php endif; ?>

        <?php endforeach; ?>

    </div>
</div>
