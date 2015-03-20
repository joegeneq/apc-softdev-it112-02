<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "company_agency".
 *
 * @property integer $id
 * @property string $company_agency_code
 * @property string $company_agency_full_name
 * @property string $company_agency_notes
 * @property string $create_time
 * @property string $update_time
 *
 * @property Customer[] $customers
 * @property Document[] $documents
 */
class CompanyAgency extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'company_agency';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_agency_notes'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['company_agency_code', 'company_agency_full_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'company_agency_code' => 'Company Agency Code',
            'company_agency_full_name' => 'Company Agency Full Name',
            'company_agency_notes' => 'Company Agency Notes',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomers()
    {
        return $this->hasMany(Customer::className(), ['company_agency_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['company_agency_id' => 'id']);
    }
}
