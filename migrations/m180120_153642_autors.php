<?php

use yii\db\Migration;

/**
 * Class m180120_153642_autors
 */
class m180120_153642_autors extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable('autors', [
            'id' => $this->primaryKey(),
            'fio' => $this->string()->notNull(),
        ]);
    }

    public function down()
    {
        echo "m180120_153642_autors cannot be reverted.\n";

        return false;
    }

}
