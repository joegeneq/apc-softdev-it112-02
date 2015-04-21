<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\DocumentCategory;
use common\models\DocumentPriority;
use common\models\DocumentType;
use common\models\Employee;
use common\models\Customer;
use common\models\CompanyAgency;
use common\models\Section;
use dosamigos\datepicker\DatePicker;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model common\models\Document */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-form">

    <?php $form = ActiveForm::begin(['options' =>['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'document_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_description')->textArea(['maxlength' => 45]) ?>

            <?= $form->field($model, 'document_target_date')->widget(
         DatePicker::className(), [
        // inline too, not bad
        'inline' => false, 
         // modify template for custom rendering
        //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd'
        ]
    ]);?>


    <?= $form->field($model, 'document_category')->dropDownList(
        ArrayHelper::map(DocumentCategory::find()->all(),'id', 'document_category_name'),
        ['prompt'=>'Select Category']
    ) ?>

    <?= $form->field($model, 'section_id')->dropDownList(
        ArrayHelper::map(Section::find()->all(),'id', 'section_name'),
        [
        'prompt'=>'Select Section',
        'onchange'=>'
            $.post( "index.php?r=document-type/lists&id='.'"+$(this).val(), function( data ) {
                $( "select#document-document_type_id" ).html( data );
        });'

        ]
    ) ?>


    <?= $form->field($model, 'document_type_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(DocumentType::find()->all(),'id', 'document_type_name'),
        'language' => 'en',
        'options' => ['placeholder' => 'Select a Type ...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]); ?>
    
    <?= $form->field($model, 'document_comment')->textArea(['maxlength' => 45]) ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id', 'employee_last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'company_agency_id')->dropDownList(
        ArrayHelper::map(CompanyAgency::find()->all(),'id', 'company_agency_name'),
        ['prompt'=>'Select Company Agency']
    ) ?>

    <?= $form->field($model, 'customer_id')->dropDownList(
        ArrayHelper::map(Customer::find()->all(),'id', 'customer_lastname'),
        ['prompt'=>'Select Customer']
    ) ?>

    <?=$form->field($model, 'file')->fileInput(); ?>

    <?= $form->field($model, 'document_priority_id')->dropDownList(
        ArrayHelper::map(DocumentPriority::find()->all(),'id', 'document_priority_name'),
        ['prompt'=>'Select Priority']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
