<?php

namespace backend\models;

use Yii;
use yii\db\Expression;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;
/**
 * This is the model class for table "station_desk_role".
 *
 * @property integer $id
 * @property string $station_desk_role_code
 * @property string $station_desk_role_name
 * @property string $station_desk_role_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property EmployeeHasStationDesk[] $employeeHasStationDesks
 */
class StationDeskRole extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'station_desk_role';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_time', 'update_time'], 'safe'],
            [['station_desk_role_code', 'station_desk_role_name', 'station_desk_role_description'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'station_desk_role_code' => 'Station Desk Role Code',
            'station_desk_role_name' => 'Station Desk Role Name',
            'station_desk_role_description' => 'Station Desk Role Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasStationDesks()
    {
        return $this->hasMany(EmployeeHasStationDesk::className(), ['station_desk_role_id' => 'id']);
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
	
}
