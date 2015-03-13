<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\CompanyAgency;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_lastname')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'company_agency_id')->dropdownList(
        ArrayHelper::map(CompanyAgency::find()->all(),'id','company_agency_full_name'),
        ['prompt'=>'Select code'] 
) ?>

    <?= $form->field($model, 'customer_cell_phone')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_email')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_landline')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
