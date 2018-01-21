<?php

namespace app\models;

use yii\base\Model;
use app\models\Images;
use yii\web\UploadedFile;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg'],
        ];
    }

    public function upload()
    {
        /** @var  $path служит уникальным именем чтобы на сервере не затирались изображения */
        $path = 'uploads/' . uniqid() . '.' . $this->imageFile->extension;
        $this->imageFile->saveAs($path);

        $image = new Images();
        $image->name = $this->imageFile->baseName . '.' . $this->imageFile->extension;
        $image->path = $path;
        $image->size = $this->imageFile->size;
        $image->mine = $this->imageFile->type;
        $image->save();
        return $image;

    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'imageFile' => 'Загрузить изображение',
        ];
    }
}

