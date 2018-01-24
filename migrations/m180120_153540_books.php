<?php

use yii\db\Migration;

/**
 * Class m180120_153540_books
 */
class m180120_153540_books extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable('books', [
            'id' => $this->primaryKey(),
            'name' => $this->string(120)->notNull(),
            'image_id' => $this->integer()->notNull()
        ]);
    }

    public function down()
    {
        echo "m180120_153540_books cannot be reverted.\n";

        return false;
    }

}
