<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "document_type".
 *
 * @property integer $id
 * @property string $document_type_name
 * @property string $document_type_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property Document[] $documents
 */
class DocumentType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'document_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id'], 'integer'],
            [['document_type_description'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['document_type_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'document_type_name' => 'Document Type Name',
            'document_type_description' => 'Document Type Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['document_type_id' => 'id']);
    }
}
