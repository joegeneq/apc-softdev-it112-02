<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property integer $current_position
 * @property string $name
 * @property string $first_name
 * @property string $create_time
 * @property string $update_time
 * @property integer $user_id
 *
 * @property Document[] $documents
 * @property DocumentWokflow[] $documentWokflows
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
            [['current_position', 'user_id'], 'integer'],
            [['create_time', 'update_time'], 'safe'],
            [['name', 'first_name'], 'string', 'max' => 45]
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
            'name' => 'Name',
            'first_name' => 'First Name',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'user_id' => 'User ID',
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
    public function getDocumentWokflows()
    {
        return $this->hasMany(DocumentWokflow::className(), ['employee_id' => 'id']);
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
