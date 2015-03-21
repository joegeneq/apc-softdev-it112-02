<?php

namespace backend\models;

use yii\db\Expression;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Security;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "customer".
 *
 * @property integer $id
 * @property string $customer_name
 * @property string $customer_lastname
 * @property integer $company_agency_id
 * @property string $customer_cell_phone
 * @property string $customer_email
 * @property string $customer_landline
 * @property string $create_time
 * @property string $update_time
 *
 * @property CompanyAgency $companyAgency
 * @property Document[] $documents
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_agency_id'], 'required'],
            [['company_agency_id'], 'integer'],
            [['create_time', 'update_time'], 'safe'],
            [['customer_name', 'customer_lastname', 'customer_cell_phone', 'customer_email', 'customer_landline'], 'string', 'max' => 45]
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
            'customer_name' => 'Customer Name',
            'customer_lastname' => 'Customer Lastname',
            'company_agency_id' => 'Company Agency ID',
            'customer_cell_phone' => 'Customer Cell Phone',
            'customer_email' => 'Customer Email',
            'customer_landline' => 'Customer Landline',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
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
    public function getDocuments()
    {
        return $this->hasMany(Document::className(), ['customer_id' => 'id']);
    }
}
