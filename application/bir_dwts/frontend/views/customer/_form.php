<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\CompanyAgency;

/* @var $this yii\web\View */
/* @var $model common\models\Customer */
/* @var $form yii\widgets\ActiveForm */

/*   <?= $form->field($model, 'create_time')->textInput() ?>
     <?= $form->field($model, 'update_time')->textInput() ?> */

?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer_lastname')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_firstname')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'company_agency_id')->dropDownList(
        ArrayHelper::map(CompanyAgency::find()->all(),'id','company_agency_name'),
        ['prompt'=>'Select CompanyAgency']
    ) ?>

    <?= $form->field($model, 'customer_cell_phone')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_email')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'customer_landline')->textInput(['maxlength' => 45]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
