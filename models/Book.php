<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%book}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property integer $author_id
 *
 * @property Author $author
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%book}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description'], 'required'],
            [['author_id'], 'integer'],
            [['title'], 'string', 'max' => 64],
            [['description'], 'string', 'max' => 1024]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'description' => Yii::t('app', 'Description'),
            'author_id' => Yii::t('app', 'Author'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(Author::className(), ['id' => 'author_id']);
    }
}
