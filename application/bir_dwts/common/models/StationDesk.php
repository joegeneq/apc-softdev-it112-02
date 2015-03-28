<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "station_desk".
 *
 * @property integer $id
 * @property string $station_desk_code
 * @property string $station_desk_name
 * @property string $station_desk_notes
 * @property string $create_time
 * @property string $update_time
 * @property integer $section_id
 *
 * @property DocumentWorkflow[] $documentWorkflows
 * @property EmployeeHasStationDesk[] $employeeHasStationDesks
 * @property Section $section
 */
class StationDesk extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'station_desk';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['station_desk_notes'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['section_id'], 'integer'],
            [['station_desk_code', 'station_desk_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'station_desk_code' => 'Station Desk Code',
            'station_desk_name' => 'Station Desk Name',
            'station_desk_notes' => 'Station Desk Notes',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'section_id' => 'Section ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentWorkflows()
    {
        return $this->hasMany(DocumentWorkflow::className(), ['station_desk_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasStationDesks()
    {
        return $this->hasMany(EmployeeHasStationDesk::className(), ['station_desk_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSection()
    {
        return $this->hasOne(Section::className(), ['id' => 'section_id']);
    }
}
