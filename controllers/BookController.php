<?php

namespace app\controllers;

use app\models\Autors;
use app\models\Books;
use app\models\BooksHasAutor;
use app\models\Images;
use app\models\UploadForm;
use yii\web\UploadedFile;

class BookController extends \yii\web\Controller
{
    /**
     * @return string
     */
    public function actionCreate()
    {

        $model = new Books();
        $image = new UploadForm();
        $request = \Yii::$app->request;

        if (\Yii::$app->request->isPost) {
            $image->imageFile = UploadedFile::getInstance($image, 'imageFile');
            if ($file = $image->upload()) {
                // file is uploaded successfully
                $model->load($request->post());
                $model->image_id = $file->id;

                if ($model->save()) {
                    $this->redirect('/');
                }

            }
        }

        /** @var  $autors не желательно использовать при большом объеме данных */
        $autors = Autors::find()
            ->all();

        return $this->render('create', [
            'model'  => $model,
            'image'  => $image,
            'autors' => $autors,
        ]);
    }

    /**
     * @param $id
     * @return string
     */
    public function actionUpdate($id)
    {
        $model = Books::find()
            ->with('image')
            ->where(['id' => $id])
            ->one();

        $image = new UploadForm();
        $request = \Yii::$app->request;

        if (\Yii::$app->request->isPost) {
            $image->imageFile = UploadedFile::getInstance($image, 'imageFile');
            if ($file = $image->upload()) {
                // file is uploaded successfully
                $model->load($request->post());

                if (!empty($file->id)) {
                    $imageId = $model->image_id;
                    $model->image_id = $file->id;
                }

                if ($model->save()) {
                    Images::deleteAll(['id' => $imageId]);
                    $this->redirect('/');
                }

            }
        }

        /** @var  $autors не желательно использовать при большом объеме данных */
        $autors = Autors::find()
            ->all();


        return $this->render('update', [
            'model'  => $model,
            'image'  => $image,
            'autors' => $autors,
        ]);
    }

    /**
     * @param $id
     *
     * @return redirect
     */
    public function actionDelete($id)
    {
        BooksHasAutor::deleteAll(['book_id' => $id]);
        Books::deleteAll(['id' => $id]);

        $this->redirect('/');
    }


}
