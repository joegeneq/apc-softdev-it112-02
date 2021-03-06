<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "document".
 *
 * @property integer $id
 * @property string $document_tracking_number
 * @property string $document_name
 * @property string $document_description
 * @property string $document_target_date
 * @property integer $document_category
 * @property integer $document_priority_id
 * @property integer $document_type_id
 * @property string $document_comment
 * @property integer $employee_id
 * @property integer $customer_id
 * @property integer $company_agency_id
 * @property resource $document_image_front_page
 * @property string $create_time
 * @property string $update_time
 * @property integer $section_id
 *
 * @property Employee $employee
 * @property Customer $customer
 * @property CompanyAgency $companyAgency
 * @property DocumentCategory $documentCategory
 * @property DocumentPriority $documentPriority
 * @property DocumentType $documentType
 * @property Section $section
 * @property DocumentWorkflow[] $documentWorkflows
 */
class Document extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $file;
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
            [['document_target_date', 'create_time', 'update_time'], 'safe'],
            [['document_category', 'document_priority_id', 'document_type_id', 'employee_id', 'customer_id', 'company_agency_id', 'section_id'], 'required'],
            [['document_category', 'document_priority_id', 'document_type_id', 'employee_id', 'customer_id', 'company_agency_id', 'section_id'], 'integer'],
            [['document_image_front_page'], 'string'],
            [['file'],'file'],
            [['document_tracking_number','logo', 'document_name', 'document_description', 'document_comment'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'document_tracking_number' => 'Tracking Number',
            'document_name' => 'Document Name',
            'document_description' => 'Document Description',
            'document_target_date' => 'Document Target Date',
            'document_category' => 'Document Category',
            'document_priority_id' => 'Document Priority',
            'document_type_id' => 'Document Type',
            'document_comment' => 'Document Comment',
            'employee_id' => 'Employee',
            'customer_id' => 'Customer',
            'company_agency_id' => 'Company Agency',
            'document_image_front_page' => 'Document Image Front Page',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'section_id' => 'Section',
            'file'=>'Document Image Front Page',
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
    public function getCustomer()
    {
        return $this->hasOne(Customer::className(), ['id' => 'customer_id']);
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
    public function getDocumentCategory()
    {
        return $this->hasOne(DocumentCategory::className(), ['id' => 'document_category']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentPriority()
    {
        return $this->hasOne(DocumentPriority::className(), ['id' => 'document_priority_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentType()
    {
        return $this->hasOne(DocumentType::className(), ['id' => 'document_type_id']);
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
    public function getDocumentWorkflows()
    {
        return $this->hasMany(DocumentWorkflow::className(), ['document_id' => 'id']);
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
