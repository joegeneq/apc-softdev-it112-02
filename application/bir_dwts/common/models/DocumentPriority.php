<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "document_priority".
 *
 * @property integer $id
 * @property string $document_priority_name
 * @property string $document_priority_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property Document[] $documents
 */
class DocumentPriority extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'document_priority';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['document_priority_description'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['document_priority_name'], 'string', 'max' => 45]
        ];
    }

    public function behaviors()
    {
        return [
            'timestamp' => [
            'class' => 'yii\behaviors\TimestampBehavior',
            'attributes' => [
            ActiveRecord::EVENT_BEFORE_INSERT => ['create_time', 'update_time'],
            ActiveRecord::EVENT_BEFORE_UPDATE => ['update_time'],
            ],
            'value' => new Expression('NOW()'),
        ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'document_priority_name' => 'Document Priority Name',
            'document_priority_description' => 'Document Priority Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['document_priority_id' => 'id']);
    }
}
