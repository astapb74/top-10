<?php

use yii\db\Migration;

/**
 * Class m180121_114642_books_add_colums_desc_dt_isbn
 */
class m180121_114642_books_add_colums_desc_dt_isbn extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->addColumn('books', 'desc', $this->text()->notNull());
        $this->addColumn('books', 'dt', $this->integer()->notNull());
        $this->addColumn('books', 'isbn', $this->string(100)->notNull());
    }

    public function down()
    {
        echo "m180121_114642_books_add_colums_desc_dt_isbn cannot be reverted.\n";

        $this->dropColumn('books', 'desc');
        $this->dropColumn('books', 'dt');
        $this->dropColumn('books', 'isbn');

        return false;
    }

}
