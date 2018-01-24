<?php

use yii\db\Migration;

/**
 * Class m180120_153012_images
 */
class m180120_153012_images extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable('images', [
            'id' => $this->primaryKey(),
            'name' => $this->string(80)->notNull(),
            'path' => $this->string(250)->notNull(),
            'mine' => $this->string(50)->notNull(),
            'size' => $this->integer()->notNull(),
        ]);
    }

    public function down()
    {
        echo "m180120_153012_images cannot be reverted.\n";

        return false;
    }

}
