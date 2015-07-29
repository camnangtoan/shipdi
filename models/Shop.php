<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%shop}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $address
 * @property string $locationx
 * @property string $localtiony
 */
class Shop extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shop}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'address', 'locationx', 'locationy'], 'required'],
            [['name', 'address'], 'string', 'max' => 2048],
            [['locationx', 'locationy'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'address' => Yii::t('app', 'Address'),
            'locationx' => Yii::t('app', 'Location x'),
            'locationy' => Yii::t('app', 'Location y'),
        ];
    }
}
