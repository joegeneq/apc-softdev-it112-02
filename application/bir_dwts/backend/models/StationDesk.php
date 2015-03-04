<?php

namespace backend\models;

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
 *
 * @property DocumentWokflow[] $documentWokflows
 * @property EmployeeHasStationDesk[] $employeeHasStationDesks
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentWokflows()
    {
        return $this->hasMany(DocumentWokflow::className(), ['station_desk_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasStationDesks()
    {
        return $this->hasMany(EmployeeHasStationDesk::className(), ['station_desk_id' => 'id']);
    }
}
