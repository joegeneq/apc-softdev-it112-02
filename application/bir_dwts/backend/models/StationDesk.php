<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "station_desk".
 *
 * @property integer $id
 * @property string $station_desk_code
 * @property string $station_desk_name
 * @property string $station_desk_notes
 * @property string $create_time
 * @property string $update_time
 * @property integer $division_id
 *
 * @property DocumentWorkflow[] $documentWorkflows
 * @property EmployeeHasStationDesk[] $employeeHasStationDesks
 * @property Division $division
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
            [['division_id'], 'integer'],
            [['station_desk_code', 'station_desk_name'], 'string', 'max' => 45]
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
            'station_desk_code' => 'Station Desk Code',
            'station_desk_name' => 'Station Desk Name',
            'station_desk_notes' => 'Station Desk Notes',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'division_id' => 'Division ID',
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
    public function getDivision()
    {
        return $this->hasOne(Division::className(), ['id' => 'division_id']);
    }
}
