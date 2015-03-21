<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "division".
 *
 * @property integer $id
 * @property string $division_name
 * @property string $division_description
 * @property string $create_time
 * @property string $update_time
 *
 * @property Employee[] $employees
 * @property StationDesk[] $stationDesks
 */
class Division extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'division';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['division_name', 'division_description'], 'required'],
            [['create_time', 'update_time'], 'safe'],
            [['division_name'], 'string', 'max' => 255],
            [['division_description'], 'string', 'max' => 32]
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
            'division_name' => 'Division Name',
            'division_description' => 'Division Description',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['division_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStationDesks()
    {
        return $this->hasMany(StationDesk::className(), ['division_id' => 'id']);
    }
}
