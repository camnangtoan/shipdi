<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%size}}".
 *
 * @property integer $id
 * @property string $type
 * @property string $length
 * @property string $width
 * @property string $height
 *
 * @property Order[] $orders
 */
class Size extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%size}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'length', 'width', 'height'], 'required'],
            [['type'], 'string', 'max' => 8],
            [['length', 'width', 'height'], 'string', 'max' => 64]
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
            'length' => Yii::t('app', 'Length'),
            'width' => Yii::t('app', 'Width'),
            'height' => Yii::t('app', 'Height'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Order::className(), ['size_id' => 'id']);
    }
}
