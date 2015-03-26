<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "employee_has_station_desk".
 *
 * @property integer $id
 * @property integer $employee_id
 * @property integer $station_desk_id
 * @property integer $station_desk_role_id
 * @property string $created_time
 * @property string $update_time
 *
 * @property Employee $employee
 * @property StationDesk $stationDesk
 * @property StationDeskRole $stationDeskRole
 */
class EmployeeHasStationDesk extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee_has_station_desk';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['employee_id', 'station_desk_id', 'station_desk_role_id'], 'required'],
            [['employee_id', 'station_desk_id', 'station_desk_role_id'], 'integer'],
            [['created_time', 'update_time'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'employee_id' => 'Employee ID',
            'station_desk_id' => 'Station Desk ID',
            'station_desk_role_id' => 'Station Desk Role ID',
            'created_time' => 'Created Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStationDesk()
    {
        return $this->hasOne(StationDesk::className(), ['id' => 'station_desk_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStationDeskRole()
    {
        return $this->hasOne(StationDeskRole::className(), ['id' => 'station_desk_role_id']);
    }
}
