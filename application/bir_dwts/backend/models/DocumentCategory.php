<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "document_category".
 *
 * @property integer $id
 * @property string $document_category_name
 * @property string $document_category_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property Document[] $documents
 */
class DocumentCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'document_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['document_category_description'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['document_category_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'document_category_name' => 'Document Category Name',
            'document_category_description' => 'Document Category Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['document_category' => 'id']);
    }
}
