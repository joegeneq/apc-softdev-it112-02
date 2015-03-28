<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "document_workflow".
 *
 * @property integer $id
 * @property integer $document_id
 * @property integer $employee_id
 * @property integer $station_desk_id
 * @property string $document_wokflow_comments
 * @property integer $document_status_id
 * @property string $time_accepted
 * @property string $time_released
 * @property string $total_time_spent
 * @property string $create_time
 * @property string $update_time
 * @property integer $employee_id1
 *
 * @property Document $document
 * @property Employee $employee
 * @property StationDesk $stationDesk
 * @property Employee $employeeId1
 * @property DocumentStatus $documentStatus
 */
class DocumentWorkflow extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'document_workflow';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['document_id', 'employee_id', 'station_desk_id', 'document_status_id', 'employee_id1'], 'required'],
            [['document_id', 'employee_id', 'station_desk_id', 'document_status_id', 'employee_id1'], 'integer'],
            [['document_wokflow_comments'], 'string'],
            [['time_accepted', 'time_released', 'total_time_spent', 'create_time', 'update_time'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'document_id' => 'Document ID',
            'employee_id' => 'Employee ID',
            'station_desk_id' => 'Station Desk ID',
            'document_wokflow_comments' => 'Document Wokflow Comments',
            'document_status_id' => 'Document Status ID',
            'time_accepted' => 'Time Accepted',
            'time_released' => 'Time Released',
            'total_time_spent' => 'Total Time Spent',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'employee_id1' => 'Employee Id1',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocument()
    {
        return $this->hasOne(Document::className(), ['id' => 'document_id']);
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
    public function getEmployeeId1()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_id1']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentStatus()
    {
        return $this->hasOne(DocumentStatus::className(), ['id' => 'document_status_id']);
    }
}
