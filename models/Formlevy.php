<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%formlevy}}".
 *
 * @property integer $id
 * @property string $type
 * @property string $content
 *
 * @property Order[] $orders
 */
class Formlevy extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%formlevy}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'content'], 'required'],
            [['type'], 'string', 'max' => 32],
            [['content'], 'string', 'max' => 1024]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'type' => Yii::t('app', 'Type'),
            'content' => Yii::t('app', 'Content'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Order::className(), ['levy_id' => 'id']);
    }
}
