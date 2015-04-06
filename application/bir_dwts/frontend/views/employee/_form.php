<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Section;
use common\models\User;
use common\models\Position;

/* @var $this yii\web\View */
/* @var $model common\models\Employee */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-form">
    
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'employee_id_number')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'employee_last_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'employee_first_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'current_position')->dropDownList(
        ArrayHelper::map(Position::find()->all(),'id', 'position_name'),
        ['prompt'=>'Select Position']
    ) ?>

    <?= $form->field($model, 'section_id')->dropDownList(
        ArrayHelper::map(Section::find()->all(),'id', 'section_name'),
        ['prompt'=>'Select Section']
    ) ?>

    <?= $form->field($model, 'user_id')->dropDownList(
        ArrayHelper::map(User::find()->all(),'id', 'username'),
        ['prompt'=>'Select User']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
