<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\document */

$this->title = $model->document_tracking_number;
$this->params['breadcrumbs'][] = ['label' => 'Documents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
            'document_tracking_number',
            'document_name',
            'document_description',
            'document_target_date',
            'document_category',
            'document_priority_id',
            'document_type_id',
            'document_comment',
            'employee_id',
            'customer_id',
            'company_agency_id',
            'document_image_front_page',
            'create_time',
            'update_time',
            'section_id',
        ],
    ]) ?>

</div>
