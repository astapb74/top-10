<?php

use yii\db\Migration;

/**
 * Class m180121_075716_book_autors_add_foregin
 */
class m180121_075716_book_autors_add_foregin extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->addForeignKey('books_image', 'books', 'image_id', 'images', 'id', 'NO ACTION');
        $this->addForeignKey('books_autors', 'books_has_autor', 'autor_id', 'autors', 'id', 'NO ACTION');
        $this->addForeignKey('autors_books', 'books_has_autor', 'book_id', 'books', 'id', 'NO ACTION');
    }

    public function down()
    {
        echo "m180121_075716_book_autors_add_foregin cannot be reverted.\n";
        $this->dropForeignKey('books_image');
        $this->dropForeignKey('books_autors');
        $this->dropForeignKey('autors_books');

        return false;
    }

}
