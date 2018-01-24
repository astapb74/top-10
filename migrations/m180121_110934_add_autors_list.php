<?php

use yii\db\Migration;
use app\models\Autors;

/**
 * Class m180121_110934_add_autors_list
 */
class m180121_110934_add_autors_list extends Migration
{

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $list = [
            'Костин М.Ю.',
            'Липатов Адрей',
            'Пушкин А.С.',
            'Лермонтов М.Ю.',
            'Толстой Л.Н.',
            'Стивин Кинг',
            'Гоголь Н.В.',
        ];

        foreach ($list as $item) {
            $this->insert('news', [
                'fio' => $item,
            ]);
        }

    }

    public function down()
    {
        echo "m180121_110934_add_autors_list cannot be reverted.\n";
    }

}
