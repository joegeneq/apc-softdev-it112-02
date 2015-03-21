<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property integer $current_position
 * @property string $last_name
 * @property string $first_name
 * @property string $create_time
 * @property string $update_time
 * @property integer $user_id
 * @property integer $division_id
 *
 * @property Document[] $documents
 * @property DocumentWorkflow[] $documentWorkflows
 * @property Division $division
 * @property Position $currentPosition
 * @property User $user
 * @property EmployeeHasPosition[] $employeeHasPositions
 * @property EmployeeHasStationDesk[] $employeeHasStationDesks
 */
class Employee extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['current_position'], 'required'],
            [['current_position', 'user_id', 'division_id'], 'integer'],
            [['create_time', 'update_time'], 'safe'],
            [['last_name', 'first_name'], 'string', 'max' => 45]
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
            'current_position' => 'Current Position',
            'last_name' => 'Last Name',
            'first_name' => 'First Name',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'user_id' => 'User ID',
            'division_id' => 'Division ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['encoded_by' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentWorkflows()
    {
        return $this->hasMany(DocumentWorkflow::className(), ['next_receiver' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDivision()
    {
        return $this->hasOne(Division::className(), ['id' => 'division_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurrentPosition()
    {
        return $this->hasOne(Position::className(), ['id' => 'current_position']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasPositions()
    {
        return $this->hasMany(EmployeeHasPosition::className(), ['employee_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeHasStationDesks()
    {
        return $this->hasMany(EmployeeHasStationDesk::className(), ['employee_id' => 'id']);
    }
}
