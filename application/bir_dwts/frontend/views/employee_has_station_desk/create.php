<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\EmployeeHasStationDesk */

$this->title = 'Create Employee Has Station Desk';
$this->params['breadcrumbs'][] = ['label' => 'Employee Has Station Desks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-has-station-desk-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
