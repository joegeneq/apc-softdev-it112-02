<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "Company_agency".
 *
 * @property integer $id
 * @property string $create_time
 * @property string $update_time
 * @property string $company_agency_code
 * @property string $company_agency_full_name
 * @property string $company_agency_notes
 */
class Company_agency extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Company_agency';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['create_time', 'update_time'], 'safe'],
            [['company_agency_notes'], 'string'],
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
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'company_agency_code' => 'Company Agency Code',
            'company_agency_full_name' => 'Company Agency Full Name',
            'company_agency_notes' => 'Company Agency Notes',
        ];
    }
}
