<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "position".
 *
 * @property integer $id
 * @property string $position_code
 * @property string $position_name
 * @property string $position_description
 * @property string $position_notes
 * @property string $create_time
 * @property string $update_time
 *
 * @property Employee[] $employees
 * @property EmployeeHasPosition[] $employeeHasPositions
 */
class Position extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'position';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['position_description', 'position_notes'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['position_code', 'position_name'], 'string', 'max' => 45]
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
            'position_code' => 'Position Code',
            'position_name' => 'Position Name',
            'position_description' => 'Position Description',
            'position_notes' => 'Position Notes',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['current_position' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasPositions()
    {
        return $this->hasMany(EmployeeHasPosition::className(), ['position_id' => 'id']);
    }
}
