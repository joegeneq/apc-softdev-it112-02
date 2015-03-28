<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "section".
 *
 * @property integer $id
 * @property string $section_number
 * @property string $section_code
 * @property string $section_name
 * @property string $section_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property Document[] $documents
 * @property Employee[] $employees
 * @property StationDesk[] $stationDesks
 */
class Section extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'section';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['section_name', 'section_description'], 'required'],
            [['section_description'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['section_number', 'section_code', 'section_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'section_number' => 'Section Number',
            'section_code' => 'Section Code',
            'section_name' => 'Section Name',
            'section_description' => 'Section Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['section_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['section_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStationDesks()
    {
        return $this->hasMany(StationDesk::className(), ['section_id' => 'id']);
    }
}
