<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "document".
 *
 * @property integer $id
 * @property string $create_time
 * @property string $update_time
 * @property integer $encoded_by
 * @property integer $customer_id
 * @property integer $company_agency_id
 * @property string $document_tracking_number
 * @property string $document_description
 * @property string $document_priority
 * @property string $document_category
 * @property string $document_type
 * @property string $document_notes
 * @property resource $document_image_front_page
 *
 * @property CompanyAgency $companyAgency
 * @property Customer $customer
 * @property Employee $encodedBy
 * @property DocumentWorkflow[] $documentWorkflows
 */
class document extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'document';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_time', 'update_time'], 'safe'],
            [['encoded_by', 'customer_id'], 'required'],
            [['encoded_by', 'customer_id', 'company_agency_id'], 'integer'],
            [['document_image_front_page'], 'string'],
            [['document_tracking_number', 'document_description', 'document_priority', 'document_category', 'document_type', 'document_notes'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'encoded_by' => 'Encoded By',
            'customer_id' => 'Customer ID',
            'company_agency_id' => 'Company Agency ID',
            'document_tracking_number' => 'Document Tracking Number',
            'document_description' => 'Document Description',
            'document_priority' => 'Document Priority',
            'document_category' => 'Document Category',
            'document_type' => 'Document Type',
            'document_notes' => 'Document Notes',
            'document_image_front_page' => 'Document Image Front Page',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyAgency()
    {
        return $this->hasOne(CompanyAgency::className(), ['id' => 'company_agency_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomer()
    {
        return $this->hasOne(Customer::className(), ['id' => 'customer_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEncodedBy()
    {
        return $this->hasOne(Employee::className(), ['id' => 'encoded_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentWorkflows()
    {
        return $this->hasMany(DocumentWorkflow::className(), ['document_id' => 'id']);
    }
}
