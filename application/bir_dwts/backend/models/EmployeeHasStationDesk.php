<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "employee_has_station_desk".
 *
 * @property integer $id
 * @property integer $employee_id
 * @property integer $station_desk_id
 * @property integer $station_desk_role_id
 * @property string $create_time
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
            [['create_time'], 'safe']
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
            'employee_id' => 'Employee ID',
            'station_desk_id' => 'Station Desk ID',
            'station_desk_role_id' => 'Station Desk Role ID',
            'create_time' => 'create time',
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
