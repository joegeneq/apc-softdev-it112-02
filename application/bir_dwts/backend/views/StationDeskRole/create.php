<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\StationDeskRole */

$this->title = 'Create Station Desk Role';
$this->params['breadcrumbs'][] = ['label' => 'Station Desk Roles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="station-desk-role-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
