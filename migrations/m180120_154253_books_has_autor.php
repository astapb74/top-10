<?php

use yii\db\Migration;

/**
 * Class m180120_154253_books_has_autor
 */
class m180120_154253_books_has_autor extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable('books_has_autor', [
            'id' => $this->primaryKey(),
            'book_id' => $this->integer()->notNull(),
            'autor_id' => $this->integer()->notNull()
        ]);


    }

    public function down()
    {
        echo "m180120_154253_books_has_autor cannot be reverted.\n";

        $this->dropTable('books_has_autor');

        return false;
    }

}
