<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $id
 * @property string $phonenumber
 * @property string $address
 * @property string $locationx
 * @property string $locationy
 * @property integer $charges_id
 * @property integer $shop_id
 * @property integer $weight_id
 * @property integer $size_id
 * @property integer $timeorder_id
 * @property integer $levy_id
 * @property integer $statusorder_id
 * @property string $note
 * @property integer $cod_id
 *
 * @property Charge $charges
 * @property Shop $shop
 * @property Weight $weight
 * @property Size $size
 * @property Timeorder $timeorder
 * @property Formlevy $levy
 * @property Statusorder $statusorder
 * @property Statuscod $cod
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phonenumber', 'address', 'charges_id', 'shop_id', 'weight_id', 'size_id', 'timeorder_id', 'levy_id', 'statusorder_id', 'cod_id'], 'required'],
            [['charges_id', 'shop_id', 'weight_id', 'size_id', 'timeorder_id', 'levy_id', 'statusorder_id', 'cod_id'], 'integer'],
            [['note'], 'string'],
            [['phonenumber'], 'string', 'max' => 16],
            [['address'], 'string', 'max' => 2048],
            [['locationx', 'locationy'], 'string', 'max' => 32]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'phonenumber' => Yii::t('app', 'Phone number'),
            'address' => Yii::t('app', 'Address'),
            'locationx' => Yii::t('app', 'Location x'),
            'locationy' => Yii::t('app', 'Location y'),
            'charges_id' => Yii::t('app', 'Charge'),
            'shop_id' => Yii::t('app', 'Shop'),
            'weight_id' => Yii::t('app', 'Weight'),
            'size_id' => Yii::t('app', 'Size'),
            'timeorder_id' => Yii::t('app', 'Time order'),
            'levy_id' => Yii::t('app', 'Form levy'),
            'statusorder_id' => Yii::t('app', 'Status order'),
            'note' => Yii::t('app', 'Note'),
            'cod_id' => Yii::t('app', 'Status COD'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCharges()
    {
        return $this->hasOne(Charge::className(), ['id' => 'charges_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShop()
    {
        return $this->hasOne(Shop::className(), ['id' => 'shop_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWeight()
    {
        return $this->hasOne(Weight::className(), ['id' => 'weight_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSize()
    {
        return $this->hasOne(Size::className(), ['id' => 'size_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTimeorder()
    {
        return $this->hasOne(Timeorder::className(), ['id' => 'timeorder_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLevy()
    {
        return $this->hasOne(Formlevy::className(), ['id' => 'levy_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatusorder()
    {
        return $this->hasOne(Statusorder::className(), ['id' => 'statusorder_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCod()
    {
        return $this->hasOne(Statuscod::className(), ['id' => 'cod_id']);
    }
}
