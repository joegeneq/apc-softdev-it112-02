<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;


/**
 * This is the model class for table "employee_has_position".
 *
 * @property integer $id
 * @property integer $employee_id
 * @property integer $position_id
 * @property string $employee_position_start_date
 * @property string $employee_position_end_date
 * @property string $create_time
 * @property string $update_time
 *
 * @property Employee $employee
 * @property Position $position
 */
class EmployeeHasPosition extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee_has_position';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['employee_id', 'position_id'], 'required'],
            [['employee_id', 'position_id'], 'integer'],
            [['employee_position_start_date', 'create_time', 'update_time'], 'safe'],
            [['employee_position_end_date'], 'string', 'max' => 45]
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
            'position_id' => 'Position ID',
            'employee_position_start_date' => 'Employee Position Start Date',
            'employee_position_end_date' => 'Employee Position End Date',
            'create_time' => 'Create Time',
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
    public function getPosition()
    {
        return $this->hasOne(Position::className(), ['id' => 'position_id']);
    }
}
