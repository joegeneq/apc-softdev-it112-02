<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\DocumentSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'encoded_by') ?>

    <?= $form->field($model, 'customer_id') ?>

    <?= $form->field($model, 'company_agency_id') ?>

    <?= $form->field($model, 'document_tracking_number') ?>

    <?php // echo $form->field($model, 'document_description') ?>

    <?php // echo $form->field($model, 'document_category') ?>

    <?php // echo $form->field($model, 'document_priority') ?>

    <?php // echo $form->field($model, 'document_target_date') ?>

    <?php // echo $form->field($model, 'document_type') ?>

    <?php // echo $form->field($model, 'document_notes') ?>

    <?php // echo $form->field($model, 'document_image_front_page') ?>

    <?php // echo $form->field($model, 'create_time') ?>

    <?php // echo $form->field($model, 'update_time') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
