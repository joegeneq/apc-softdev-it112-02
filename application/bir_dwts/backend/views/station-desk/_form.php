<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Section;

/* @var $this yii\web\View */
/* @var $model common\models\StationDesk */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="station-desk-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'station_desk_code')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'station_desk_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'station_desk_notes')->textarea(['rows' => 6]) ?>
    
    <?= $form->field($model, 'section_id')->dropDownList(
        ArrayHelper::map(Section::find()->all(),'id', 'section_name'),
        ['prompt'=>'Select Section']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
