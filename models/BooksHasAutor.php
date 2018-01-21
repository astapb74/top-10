<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "books_has_autor".
 *
 * @property int $id
 * @property int $book_id
 * @property int $autor_id
 *
 * @property Books $book
 * @property Autors $autor
 */
class BooksHasAutor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'books_has_autor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['book_id', 'autor_id'], 'required'],
            [['book_id', 'autor_id'], 'integer'],
            [['book_id'], 'exist', 'skipOnError' => true, 'targetClass' => Books::className(), 'targetAttribute' => ['book_id' => 'id']],
            [['autor_id'], 'exist', 'skipOnError' => true, 'targetClass' => Autors::className(), 'targetAttribute' => ['autor_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'book_id' => 'Book ID',
            'autor_id' => 'Autor ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBook()
    {
        return $this->hasOne(Books::className(), ['id' => 'book_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAutor()
    {
        return $this->hasOne(Autors::className(), ['id' => 'autor_id']);
    }
}
