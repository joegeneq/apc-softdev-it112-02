<?php

namespace backend\models;

use Yii;
use yii\db\Expression;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;



/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property string $last_name
 * @property string $first_name
 * @property integer $current_position
 * @property integer $section_id
 * @property string $create_time
 * @property string $update_time
 * @property integer $user_id
 *
 * @property Document[] $documents
 * @property DocumentWorkflow[] $documentWorkflows
 * @property Section $section
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
            [['current_position', 'section_id', 'user_id'], 'required'],
            [['current_position', 'section_id', 'user_id'], 'integer'],
            [['create_time', 'update_time'], 'safe'],
            [['last_name', 'first_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'last_name' => 'Last Name',
            'first_name' => 'First Name',
            'current_position' => 'Current Position',
            'section_id' => 'Section ID',
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
        return $this->hasMany(Document::className(), ['employee_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentWorkflows()
    {
        return $this->hasMany(DocumentWorkflow::className(), ['employee_id1' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSection()
    {
        return $this->hasOne(Section::className(), ['id' => 'section_id']);
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
